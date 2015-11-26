#
# Cookbook Name:: php_nginx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# php install
include_recipe 'php::default'

# nginx install
include_recipe 'nginx::default'

# fpm install
node.default['php-fpm']['pools'] = {
  "www" => {
    :enable => "true",
    :max_requests => 5000,
    :php_options => { 'php_admin_flag[log_errors]' => 'on', 'php_admin_value[memory_limit]' => '128M' }
  }
}
include_recipe 'php-fpm::default'



nginx_site 'default' do
  enable true
  template "nginx.erb"
  variables({
    :domain => 'hage.jp',
    :document_root => '/var/www/app',
    :socket => 'unix:/var/run/php-fpm-www.sock'
  })
end
