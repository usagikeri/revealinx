if ! docker images | grep 'usagikeri/revealinx' >/dev/null ; then
    docker build -t usagikeri/revealinx .
fi

mkdir -p ~/.slide
cat README.md > ~/.slide/slide.md

if ! docker ps | grep 'revealinx' >/dev/null ; then
    docker run --name revealinx -d -p 8080:80 -v $HOME/.slide/:/usr/share/nginx/reveal.js/slide/ usagikeri/revealinx
fi

open http://localhost:8080
