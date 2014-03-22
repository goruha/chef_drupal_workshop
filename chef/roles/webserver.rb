name "webserver"
description "Web server developer configuration"
run_list(
  "recipe[build-essential]",
  "recipe[apt]",
  "recipe[mysql::server]",
  "recipe[nginx]",
  "recipe[php]",
  "recipe[php-fpm]",
  "recipe[drupal]"
)
default_attributes(
  'mysql' => {
    :server_debian_password => "root123",
    :server_repl_password => "root123",
    :server_root_password => "root123"
  }
)