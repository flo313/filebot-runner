FROM rednoah/filebot

COPY filebot-watcher /usr/bin/filebot-watcher

ENTRYPOINT ["/usr/bin/filebot-watcher"]
