FROM nginx:latest

LABEL project="vprofile"
LABEL maintainer="Emeka Umejiofor"
LABEL description="Nginx web server for vprofile project"
LABEL Author="Emeka Umejiofor"

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginvproapp.conf /etc/nginx/conf.d/vproapp.conf