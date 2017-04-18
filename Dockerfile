FROM ubuntu:latest

WORKDIR /usr/local/

RUN apt-get update \
    && apt-get install -y git curl python ffmpeg

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl

RUN curl -o go1.8.1.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz

ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH /usr/local/YTSpectrogram/

RUN git clone https://github.com/samling/YTSpectrogram.git /usr/local/YTSpectrogram \
    && cd /usr/local/YTSpectrogram \
    && go get github.com/mdlayher/waveform \
    && go build YTSpectrogram

COPY ./entrypoint.sh /usr/local/entrypoint.sh

ENTRYPOINT ["/usr/local/entrypoint.sh"]
