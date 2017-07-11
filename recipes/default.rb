#
# Cookbook Name:: openresty-test
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'openresty'
include_recipe 'openresty::luarocks'

node.default['openresty']['lua_package_path'] = '"/usr/share/lualib/resty/core/?.lua;;"'

openresty_site 'test' do
  template 'nginx/test.conf.erb'
end

openresty_luarock 'lua-resty-jwt' do
  action :install
end

cookbook_file '/usr/share/luajit/share/lua/5.1/luajwt.lua' do
  source 'luajwt.lua'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
