FROM ubuntu

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential nodejs git ruby-dev zlib1g-dev curl libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/* && curl -o- -L https://yarnpkg.com/install.sh | bash && \
    gem install bundler

ENV PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

RUN mkdir /app
WORKDIR /app
ADD Gemfile* package.json yarn.lock /app/

RUN bundle install && $HOME/.yarn/bin/yarn install
CMD ["bundle", "exec", "rails", "test"]