# official racket image
FROM racket/racket:8.3

# set working dir
WORKDIR /usr/src/app

# copy current dir into the container
COPY . /usr/src/app

# install package manager for racket and other tools
RUN raco pkg install --auto --batch

# install entr to watch files and restart the app when they change
RUN apt-get update && \
    apt-get install -y entr

# expose a port for the app
EXPOSE 8080

# env vars
ENV PLTSTDERR info

# run the app
CMD find . -name '*.scm' | entr -r racket your-scheme-file.scm

