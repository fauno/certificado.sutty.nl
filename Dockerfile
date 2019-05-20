FROM sutty/builder:2.5.5
MAINTAINER "f <f@sutty.nl>"

RUN yarn
RUN bundle --path ./vendor --production
# Esto es para que las gemas binarias pesen menos y usen menos RAM,
# acelerando la compilación
RUN find ./vendor --name "*.so" | xargs -r strip --strip-unneeded
RUN bundle exec jekyll build
