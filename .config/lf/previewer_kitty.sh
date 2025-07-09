#!/bin/sh
draw() {
  kitten icat --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$1" </dev/null >/dev/tty
  exit 1
}

file="$1"
w="$2"
h="$3"
x="$4"
y="$5"

case "$(file -Lb --mime-type "$file")" in 
  image/*)
    draw "$file"
    ;;
  video/*)
    # vidthumb is from here:
    # https://raw.githubusercontent.com/duganchen/kitty-pistol-previewer/main/vidthumb
    draw "$("$HOME"/.config/lf/vidthumb_kitty.sh "$file")"
    ;;
  audio/*)
    exiftool "$file"
    ;;
  application/x-tar)
    tar tf "$file"
    ;;
  application/zip)
    unzip -l "$file"
    ;;
  application/x-rar-compressed)
    unrar l "$file"
    ;;
  application/x-7z-compressed)
    7z l "$file"
    ;;
  application/pdf)
    exiftool "$file"
    ;;
  *)
    bat --color=always --style=plain --pager=never "$file" || highlight --out-format ansi "$file"
    ;;
esac

pistol "$file"
