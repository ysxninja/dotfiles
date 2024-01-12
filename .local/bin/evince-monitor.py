import subprocess
import os
import time
import requests
import configparser
import base64

# Read Wakatime API key from configuration file
config = configparser.ConfigParser()
config.read(os.path.expanduser('/opt/wakapi/.wakatime.cfg'))

WAKATIME_API_KEY = config.get('settings', 'api_key')
WAKATIME_API_KEY_BASE64 = base64.b64encode(WAKATIME_API_KEY.encode()).decode()
WAKATIME_API_URL = config.get('settings', 'api_url')
WAKATIME_ENDPOINT = f"{WAKATIME_API_URL}/users/current/heartbeats"
# DEBUG: WAKATIME_ENDPOINT = "http://localhost:3003/api/users/current/heartbeats"
LOGFILE = "/opt/wakapi/evince_monitor.log"

def get_active_window():
    try:
        title = subprocess.check_output(["i3get", "--instance", "evince", "--print", "t"]).decode("utf-8").strip()
        con_id = subprocess.check_output(["i3get", "--instance", "evince", "--print", "n"]).decode("utf-8").strip()
        window_class = subprocess.check_output(["i3get", "--instance", "evince", "--print", "c"]).decode("utf-8").strip()

        # Split title into main and subtitle parts
        title_parts = title.split(" — ")  # Adjust the separator based on your actual title format

        # DEBUG: For debugging purposes, print each piece of information
        # print(f"Title: {title}")
        # print(f"Main Title: {title_parts[0]}")
        subtitle = title_parts[1] if len(title_parts) > 1 else None
        # print(f"Subtitle: {subtitle}")
        # print(f"Con_ID: {con_id}")
        # print(f"Class: {window_class}")

        # For the actual use, return the desired piece of information as a tuple
        return window_class, title_parts[0], subtitle, con_id

    except subprocess.CalledProcessError as e:
        print(f"Evince_monitor.sh: Error running i3get: {e}")
    except Exception as ex:
        print(f"Evince_monitor.sh: Error: {ex}")

    # Return None in case of an error
    return None

def is_evince_active():
    active_window = get_active_window()

    # Check if get_active_window returned a valid result
    if active_window:
        return "evince" in active_window[0].lower()

    return False

def send_heartbeat():
    window_info = get_active_window()

    if window_info:
        timestamp = time.time()
        entity = window_info[2] if window_info[2] else window_info[1]  # Use subtitle as entity, fallback to main title
        data = {
            "entity": entity.capitalize(),  # Capitalize the first letter
            "time": timestamp,
            "type": "file",
            "user_agent": "Evince",
            "editor" : "Evince",
            "os" : "Linux",
            "project": "Learning",
            "branch": "main",
            "category": "Learning",
        }

        headers = {
            "Authorization": f"Basic {WAKATIME_API_KEY_BASE64}"
        }

        try:
            response = requests.post(WAKATIME_ENDPOINT, json=data, headers=headers, timeout=10)
            print(f"Evince_monitor.sh: Response {response.content}")
            response.raise_for_status()
            print(f"Evince_monitor.sh: Heartbeat sent successfully at {timestamp}")
        except requests.exceptions.RequestException as e:
            print(f"Evince_monitor.sh: Error sending heartbeat: {e}")

def log_activity():
    wakatime_file = LOGFILE  # Replace with your actual Wakatime log file path

    try:
        with open(wakatime_file, "a") as f:
            timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
            window_info = get_active_window()

            # Check if get_active_window returned a valid result
            if window_info:
                entity = window_info[2] if window_info[2] else window_info[1]  # Use subtitle as entity, fallback to main title
                f.write(f"{timestamp} Title: {window_info[1]}")
                if window_info[2]:  # If subtitle exists, include it in the log
                    f.write(f" — {window_info[2]}")
                f.write(f", Entity: {entity}, Class: {window_info[0]}, Con_ID: {window_info[3]}\n")
                # print(f"Logged at {timestamp}")
            else:
                print("Evince_monitor.sh: Error getting active window info")
    except Exception as e:
        print(f"Evince_monitor.sh: Error logging activity: {e}")

def main():
    while True:
        try:
            if is_evince_active():
                send_heartbeat()
                log_activity()

            time.sleep(120)  # Sleep for 2 minutes
        except KeyboardInterrupt:
            break
        except Exception as e:
            print(f"Evince_monitor.sh: Error in main loop: {e}")

if __name__ == "__main__":
    main()
