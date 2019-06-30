
# 下記機能をテストしています。

* Active Admin
* Active Storage
* Basic Authentication
* Sidekiq

# How to run

## Only execute when run at first

1. Clone Git repository
    ```
    git clone https://github.com/ryu-sato/rails5_2_sample_app.git
    ```
1. Install GEMs
    ```
    cd rails5_2_sample_app
    bundle install
    ```
1. Initialize DB
    ```
    rails db:create db:migrate db:seed
    ```
1. Install redis-server
    * For Ubuntu
        ```
        sudo apt-get -y update && sudo apt-get install -y redis-server
        ```

## Execute every time

1. Change current directory to top of local repository
1. (Only execute when Gemfile is updated) Initialize or update DB schema and seeds
    ```
    rails db:migrate
    ```
1. Execute Redis
    ```
    sudo systemctl start redis-server
    ```
1. Execute Sidekiq
    ```
    cd /path/to/repository/of/rails5_2_sample_app
    bundle exec sidekiq
    ```
1. Execute Rails
    ```
    cd /path/to/repository/of/rails5_2_sample_app
    rails s
    ```

# User Account

|Target|User name|Password|
| --- | --- | --- |
|Active Admin|`admin@a.a`|`password`|
|Basic Authentication|`test`|`password`|
