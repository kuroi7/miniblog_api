FROM ruby:3.0.2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /api
WORKDIR /miniblog/api
COPY Gemfile /miniblog/api/Gemfile
COPY Gemfile.lock /miniblog/api/Gemfile.lock
RUN bundle install
COPY . /miniblog/api

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000

CMD ["rails", "server", "-b", "0.0.0.0"]
