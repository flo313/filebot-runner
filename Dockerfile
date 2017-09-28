FROM rednoah/filebot

RUN apt-get update && apt-get install -y mutt

COPY filebot-watcher /usr/bin/filebot-watcher

RUN chmod +x /usr/bin/filebot-watcher

ENTRYPOINT ["/usr/bin/filebot-watcher"]
