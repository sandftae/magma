# STAGE #1: the dashboard build
FROM node:18-alpine AS dashboard-builder

WORKDIR /app

COPY ./source/app-board/package*.json ./

# Hadolint rule: Use 'npm ci' for automated builds to ensure clean install from lockfile
RUN npm ci

# @description: copy react-app itself
COPY ./source/app-board/ ./

# @description: do build
RUN npm run build

# STAGE #2: MAGMA image build
FROM alpine:3.18

WORKDIR /var/www/src

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    ESCDELAY=0

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

# consolidating chmod commands into one RUN instruction
RUN chmod +x ./bash/launcher ./bash/smoke/smoke

CMD ["bash"]