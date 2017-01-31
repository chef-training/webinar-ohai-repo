#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  context 'When all attributes are default, on Centos 6.7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs the necessary packages' do
      expect(chef_run).to install_package('httpd')
    end

    it 'writes out the new home page' do
      expect(chef_run).to render_file('/var/www/html/index.html')
    end

    it 'starts the necessary services' do
      expect(chef_run).to start_service('httpd')
    end

    it 'enables the necessary services' do
      expect(chef_run).to enable_service('httpd')
    end
  end
end
