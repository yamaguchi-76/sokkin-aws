FROM ruby:2.7.7
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

ENV APP_PATH /work
WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/
ENV BUNDLE_JOBS=4
RUN bundle install

COPY package.json $APP_PATH
COPY postcss.config.js $APP_PATH
COPY yarn.lock $APP_PATH
COPY . $APP_PATH
RUN npm install
RUN bin/yarn install
RUN mkdir -p tmp/pids
RUN bundle exec rails webpacker:compile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
