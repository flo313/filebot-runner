FROM rednoah/filebot

RUN apt-get update && apt-get install -y mutt

COPY filebot-runner /usr/bin/filebot-runner

RUN chmod +x /usr/bin/filebot-runner

ENTRYPOINT ["/usr/bin/filebot-runner"]
