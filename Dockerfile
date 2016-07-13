FROM elixir

WORKDIR /code

RUN apt-get update \
    && apt-get install -y curl inotify-tools \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

