# filebot-watcher
CONTAINERNAME="Filebot"
IMAGE="flo313/filebot-watcher"
FILEBOTARGLIST="@/data/FileBotArgList"
CONTAINER_DATA_PATH="/data:/data"
CONTAINER_WDIR_PATH="/volume1:/volume1"

DOCKER_OPTIONS="--restart unless-stopped -v $CONTAINER_DATA_PATH -v $CONTAINER_WDIR_PATH"
docker run $DOCKER_OPTIONS --name $CONTAINERNAME -it $IMAGE /volume1/input $FILEBOTARGLIST



*********************************
/data/FileBotArgList content
*********************************

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
gmail=*******
artwork=n
excludeList=/data/excludeList.txt
reportError=y
--log
all
--log-file
/data/filebot.log
