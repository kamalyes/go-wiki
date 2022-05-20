FROM alpine/git

ENV TZ=Asia/Shanghai

WORKDIR /app

RUN git clone https://github.com/kamalyes/go-wiki.git


FROM golang:1.81.1-alpine

COPY --from=0 /app/go-wiki /app/go-wiki

WORKDIR /app/go-wiki

# 如果国内网络不好，可添加以下环境
# RUN go env -w GO111MODULE=on
# RUN go env -w GOPROXY=https://goproxy.cn,direct
# RUN export GO111MODULE=on
# RUN export GOPROXY=https://goproxy.cn

RUN mkdir /opt/go-wiki && ls /app/go-wiki
RUN go build -o /opt/go-wiki/go-wiki ./ \
    && cp -r ./conf/ /opt/go-wiki \
    && cp -r ./install/ /opt/go-wiki\
    && cp ./scripts/run.sh /opt/go-wiki\
    && cp -r ./static/ /opt/go-wiki\
    && cp -r ./views/ /opt/go-wiki\
    && cp -r ./logs/ /opt/go-wiki\
    && cp -r ./docs/ /opt/go-wiki
CMD ["/opt/go-wiki/go-wiki", "--conf", "/opt/go-wiki/conf/go-wiki.conf"]