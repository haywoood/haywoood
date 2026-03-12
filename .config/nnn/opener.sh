#!/bin/sh

case "$(file -b --mime-type "$1")" in
    video/*|audio/*)
        mpv "$1" ;;
    image/*)
        open "$1" ;;
    *)
        "${EDITOR:-emacs}" "$1" ;;
esac
