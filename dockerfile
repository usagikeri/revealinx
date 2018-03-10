FROM nginx

RUN apt-get update && apt-get install -y git 
WORKDIR /usr/share/nginx/
RUN git clone https://github.com/hakimel/reveal.js
WORKDIR /usr/share/nginx/reveal.js/
RUN mkdir slide
COPY ./src/index.html /usr/share/nginx/reveal.js/
COPY ./src/default.conf /etc/nginx/conf.d/
