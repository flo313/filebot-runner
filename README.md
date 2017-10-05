![Filebot](https://www.filebot.net/images/filebot.logo.svg)

Filebot media management
 
# Usage
```
CONTAINERNAME="Filebot"
IMAGE="flo313/filebot-watcher"
FILEBOTARGLIST="@/data/FileBotArgList"
CONTAINER_DATA_PATH="/data:/data"
CONTAINER_WDIR_PATH="/volume1:/volume1"

DOCKER_OPTIONS="--restart unless-stopped -v $CONTAINER_DATA_PATH -v $CONTAINER_WDIR_PATH"
docker run $DOCKER_OPTIONS --name $CONTAINERNAME -it $IMAGE /volume1/input $FILEBOTARGLIST
```

# /data/FileBotArgList content
```
--output
/volume1/output
--action
move
-non-strict
--conflict
skip
--lang
fr
--def
skipExtract=y
seriesFormat=TV Shows/{n}/S{s.pad(2)}_{vf}/{n} - {S00E00} - {t}
animeFormat=Anime/{n}/{n} - {absolute} - {t}
movieFormat=Movies/{n} - {y} - {vf}
unsorted=y
kodi=*******
artwork=n
excludeList=/data/excludeList.txt
reportError=y
--log
all
--log-file
/data/filebot.log
```
# /data/muttrc content
Here is the mutt configuration file used to allow mail notification.
Info: The line "to=" isn't a mutt directive but it is used to define 
the recipient of the mail.
```
set from = "UserMailAddress@gmail.com"
set realname = "Name SURNAME"
set imap_user = "UserMailAddress@gmail.com"
set imap_pass = "password"
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed ="+[Gmail]/Drafts"
set header_cache =~/.mutt/cache/headers
set message_cachedir =~/.mutt/cache/bodies
set certificate_file =~/.mutt/certificates
set smtp_url = "smtp://UserMailAddress@smtp.gmail.com:587/"
set smtp_pass = "password"
set move = no 
set imap_keepalive = 900
to=UserMailAddress@gmail.com
```
