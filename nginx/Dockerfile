FROM nginx:alpine

# Remove default nginx configs
RUN rm /etc/nginx/conf.d/default.conf && \
    apk add --no-cache openssl && \
    openssl req -x509 -newkey rsa:2048 -nodes \
        -keyout server.key \
        -out server.crt \
        -days 365 \
        -subj "/C=NO/ST=./L=./O=./OU=./CN=localhost" && \
    mv server.key /etc/nginx/ && \
    mv server.crt /etc/nginx/

# copy custom
COPY nginx.conf /etc/nginx/nginx.conf