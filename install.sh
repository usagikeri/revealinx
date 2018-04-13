if ! docker images | grep 'usagikeri/revealinx' >/dev/null ; then
    docker build -t usagikeri/revealinx .
fi

git clone https://github.com/hakimel/reveal.js

cp src/index.html reveal.js/
mv reveal.js ~/.revealinx
mkdir -p ~/.revealinx/slide

cat README.md > ~/.revealinx/slide/slide.md

chmod 755 ./slide
cp ./slide /usr/local/bin/

if ! docker ps | grep 'revealinx' >/dev/null ; then
    docker run --name revealinx -d -p 8080:80 -v $HOME/.revealinx/:/usr/share/nginx/reveal.js/ usagikeri/revealinx
fi

open http://localhost:8080
