include_recipe "drush"
include_recipe "php::module_gd"
include_recipe "php::module_mysql"

drupal_root = "/var/www/drupal"

directory "/var/www" do
  user "www-data"
  group "www-data"
  recursive true
end

resource_name = "vhost_drupal"

template "#{node['nginx']['dir']}/sites-available/#{resource_name}" do
  source "nginx-drupal.conf.erb"
  mode 0644
  variables(
    :server_name => "drupal.dev",
    :root => drupal_root,
    :php_fpm_socket => '127.0.0.1:9001',
    :access_log => '/var/log/nginx/drupal.log'
  )
  notifies :reload, 'service[nginx]'
end

nginx_site resource_name do
  enable true
end