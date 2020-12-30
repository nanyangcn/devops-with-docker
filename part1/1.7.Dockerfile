FROM ubuntu:16.04

RUN apt update && apt install -y curl
RUN printf 'echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;' > curler.sh
RUN chmod +x curler.sh
CMD /curler.sh
