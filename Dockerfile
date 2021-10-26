FROM ruby:3.0.2

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y build-essential \
                                         nodejs \
                                         yarn \
                                         vim \
                                         --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir /app
WORKDIR /app
COPY Gemfile ./
RUN gem install bundler
RUN bundle install
COPY . .

RUN rake assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
