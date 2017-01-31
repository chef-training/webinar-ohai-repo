#
# Cookbook Name:: apache
# Recipe:: ohai_apache_modules
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'apache::default'
ohai_plugin 'apache_modules'
