FROM ruby:2.6.5
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client yarn
# 作業ディレクトリの作成、設定（ここはfish-reviewで無くてもよい。イメージ上の作業ディレクトリなので）
RUN mkdir /fish-review 
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /fish-review 
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . $APP_ROOT

# Add a script to be executed every time the container starts.　公式から引用
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
