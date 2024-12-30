#!/usr/bin/env python3

# https://github.com/cjbassi/rofi-copyq/blob/master/rofi-copyq
# https://github.com/albertlauncher/python/blob/master/CopyQ.py

import json
import subprocess as sp

# CopyQ script to get all clipboard items
copyq_script_getAll = r"""
var result = [];

for (var i = 0; i < size(); ++i) {
    var obj = {};
    
    // Read the mime types for the clipboard entry
    var mime_types = str(read("?", i)).split("\n");
    mime_types.pop();  // Remove empty last element

    // For text-based entries
    if (mime_types.includes("text/plain") || mime_types.includes("text/html") || mime_types.includes("application/json")) {
        obj.row = i;
        obj.mimetypes = mime_types;
        obj.text = str(read(i)).trim();  // Trim extra whitespace

        // If the text is empty, label it as <DATA>
        if (obj.text.length > 0) {
            result.push(obj);
        } else {
            obj.text = "<DATA>";
            result.push(obj);
        }
    }
    // For image or binary blobs, label them as <IMAGE> or <DATA>
    else if (mime_types.some(type => type.startsWith("image/"))) {
        obj.row = i;
        obj.mimetypes = mime_types;
        obj.text = "<IMAGE>";  // For image types
        result.push(obj);
    } else {
        obj.row = i;
        obj.mimetypes = mime_types;
        obj.text = "<DATA>";  // For any other binary data
        result.push(obj);
    }
}

JSON.stringify(result);
"""

def get_clipboard_items():
    """Run the CopyQ script and return the clipboard items."""
    try:
        p = sp.run('copyq -'.split(), input=copyq_script_getAll,
                   encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)
        p.check_returncode()  # Raise an exception if the subprocess fails
        return json.loads(p.stdout)
    except sp.CalledProcessError as e:
        print(f"Error fetching clipboard items: {e}")
        return []

def run_rofi(items):
    """Display the clipboard items using rofi and return the selected index."""
    try:
        title = 'rofi-copyq'
        rofi = f'rofi -dmenu -i -p {title} -format i -theme-str listview{{lines:5;columns:1;}}'.split()
        rofi_input = '\n'.join(items)
        p = sp.run(rofi, input=rofi_input, encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)

        if p.returncode == 0:
            return int(p.stdout.strip())
        return None
    except sp.CalledProcessError as e:
        print(f"Error running rofi: {e}")
        return None

def copy_to_clipboard(selected_index, original_items):
    """Copy the selected clipboard item to the clipboard using its original index."""
    try:
        selected_clipboard_item = original_items[selected_index]
        original_copyq_index = selected_clipboard_item['row']
        sp.run(f'copyq select({original_copyq_index})'.split(), encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)
        print(f"rofi-copyq: Item copied to clipboard: {selected_clipboard_item['row']}")
    except IndexError:
        print("rofi-copyq: Invalid selection index")
    except sp.CalledProcessError as e:
        print(f"Error copying item to clipboard: {e}")

if __name__ == '__main__':
    # Fetch all clipboard items from CopyQ
    clipboard_items = get_clipboard_items()

    if not clipboard_items:
        print("No clipboard items found.")
    else:
        items = []
        original_items = []

        # Prepare clipboard items for display in rofi
        for json_obj in clipboard_items:
            text = json_obj['text']
            original_items.append(json_obj)

            # Format the text and include the index in brackets for display
            index_display = f"{json_obj['row']} "  # Prepend the index in brackets
            display_text = text.replace("\n", " \\n ")  # Replace newline with space for better formatting
            display_text = " ".join(filter(None, display_text.split(" ")))

            items.append(index_display + display_text)

        # Show the items in rofi and get the user's selection
        selected_index = run_rofi(items)

        if selected_index is not None:
            copy_to_clipboard(selected_index, original_items)
