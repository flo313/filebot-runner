FROM openjdk:8-jre

ENV FILEBOT_VERSION 4.7.9

WORKDIR /usr/share/filebot

RUN FILEBOT_SHA256=7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf \
 && FILEBOT_PACKAGE=filebot_${FILEBOT_VERSION}_amd64.deb \
 && curl -L -O https://downloads.sourceforge.net/project/filebot/filebot/FileBot_$FILEBOT_VERSION/$FILEBOT_PACKAGE \
 && echo "$FILEBOT_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check --strict \
 && dpkg -i $FILEBOT_PACKAGE \
 && rm $FILEBOT_PACKAGE

RUN apt-get update && apt-get install -y \
    mediainfo \
    libchromaprint-tools \
    file \
    curl \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*


ENV DOCKER_DATA /data
ENV DOCKER_VOLUME /volume1


ENV HOME $DOCKER_DATA
ENV JAVA_OPTS "-DuseGVFS=false -Djava.net.useSystemProxies=false -Dapplication.deployment=docker -Dapplication.dir=$DOCKER_DATA -Duser.home=$DOCKER_DATA -Djava.io.tmpdir=$DOCKER_DATA/tmp -Djava.util.prefs.PreferencesFactory=net.filebot.util.prefs.FilePreferencesFactory -Dnet.filebot.util.prefs.file=$DOCKER_DATA/prefs.properties"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

COPY filebot-watcher /usr/bin/filebot-watcher

ENTRYPOINT ["/usr/bin/filebot-watcher"]
