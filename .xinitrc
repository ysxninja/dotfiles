xset r rate 190 30 
systemctl --user import-environment DISPLAY
DEFAULT_SESSION='i3 --shmlog-size 0'

exec $DEFAULT_SESSION
