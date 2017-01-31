#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::ohai_apache_modules' do
  context 'When all attributes are default, on CentOS 6.7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs the application' do
      expect(chef_run).to include_recipe('apache::default')
    end

    it 'creates the ohai plugin apache_modules' do
      expect(chef_run).to create_ohai_plugin('apache_modules')
    end
  end
end
