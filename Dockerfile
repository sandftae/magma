# STAGE #1: the dashboard build
FROM node:18-alpine AS dashboard-builder

# @description: set workdir
WORKDIR /app

# @description: copy packages
COPY ./source/app-board/package*.json ./

# @description: install project
RUN npm install

# @description: copy react-app itself
COPY ./source/app-board/ ./

# @description: do build
RUN npm run build

# STAGE #2: MAGMA image build
FROM alpine:3.18

WORKDIR /var/www/src

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# @description: this is for bash dialog only, and it is just reduce time delay once the customer press ESC || CTRL + C
ENV ESCDELAY=0

# @description: run upgrade and install bash and ncurses (for tput)
RUN apk update && apk upgrade && \
    apk add --no-cache \
        bash \
        bash-completion \
        ncurses \
        ncurses-terminfo \
        dialog \
        yq;

# @description: copy magma source
COPY ./source .

# @description: copy dashboard app sources
COPY --from=dashboard-builder /app/dist ./assets/env/app-board

RUN chmod +x launcher
RUN chmod +x ./bash/smoke/smoke

CMD ["bash"]