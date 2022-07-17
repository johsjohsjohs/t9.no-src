# dmenu_applications

I have found a very cool dmenu script That looks for applications instead of /usr/bin that dmenu_run uses. if you are gonna use this insted of dmenu_run than just moved dmenu_applications into dmenu src folder than remove dmenu_run and rename dmenu_applications to dmenu_run.

Here is the script that was made by [akinozgen](https://github.com/akinozgen/dmenu_applications)

```bash
#!/bin/bash
DESKTOP_FILES="$(du -ha /usr/share/applications/ | grep .desktop | awk '{print $2}')"
declare -A HASHMAP
for FILE in $DESKTOP_FILES
do
        APP_NAME="$(cat $FILE | grep Name= | sed 's/Name=//g' | head -1)"
        if [ "$APP_NAME" == "" ]; then
            APP_NAME="$(sed 's/\/usr\/share\/applications\//$FILE/g')"
        fi
        HASHMAP["$APP_NAME"]=$FILE
done
SELECTION=$(printf "%s\n" "${!HASHMAP[@]}" | dmenu -i -l 15 -fn 'SF Mono' -fn monospace-14)
gtk-launch "$(echo ${HASHMAP[$SELECTION]} | sed 's/\/usr\/share\/applications\///g')"
exit
```
if you want it be like dmenu_run than just remove "-l 15" from the script.
;tags: english
