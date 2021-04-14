from ubuntu:latest

COPY ./hello.txt ./

CMD ["cat hello.txt"]
