This is the Blog application that is built by following the [Ruby on Rails Getting Started](https://guides.rubyonrails.org/v6.0/getting_started.html) guide.

Instead of using SQLite, this version uses MySQL.

It was built with the following command:

```shell
rails new rails-6-getting-started-blog --minimal --database mysql
```

If you have trouble installing the mysql2 gem, try installing openssl and building with these options.

```shell
brew install openssl

gem install mysql2 -v '0.5.3' -- --with-cflags="-I/usr/local/opt/openssl/include" --with-ldflags="-L/usr/local/opt/openssl/lib"
```
