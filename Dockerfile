FROM i386/debian:bullseye

RUN apt-get update && apt-get install -y build-essential libpcre3-dev zlib1g-dev libssl-dev wget net-tools python gdb dos2unix
WORKDIR /usr/src/nginx
COPY . .
RUN dos2unix configure && find auto -type f -exec dos2unix {} +
RUN ./configure --with-cc-opt="-fno-stack-protector -g -Wno-error -Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-stringop-overflow -Wno-cast-function-type" --with-ld-opt="" && make
EXPOSE 80
CMD ["objs/nginx", "-g", "daemon off;"]