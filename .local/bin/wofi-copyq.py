#!/usr/bin/env python3

# https://github.com/cjbassi/rofi-copyq/blob/master/rofi-copyq
# https://github.com/albertlauncher/python/blob/master/CopyQ.py

import json
import subprocess as sp

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


if __name__ == '__main__':
    p = sp.run('copyq -'.split(), input=copyq_script_getAll,
               encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)
    json_arr = json.loads(p.stdout)

    items = []
    for json_obj in json_arr:
        text = json_obj['text']
        text = " ".join(filter(None, text.replace("\n", " ").split(" ")))
        items.append(text)

    title = 'wofi-copyq'
    wofi = f'wofi --conf=/home/ysxninja/.config/wofi/config-clipq -p {title} '.split()
    wofi_input = '\n'.join(x for x in items)

    p = sp.run(wofi, input=wofi_input, encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)
    if p.returncode == 0:
        num = p.stdout.strip()
        print(num)
        sp.run(f'copyq select({num});'.split(),
               encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)

