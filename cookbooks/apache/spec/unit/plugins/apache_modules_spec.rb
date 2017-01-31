require 'spec_helper'

describe_ohai_plugin :Apache do
  let(:plugin_file) { 'files/default/apache_modules.rb' }

  it 'provides apache/modules' do
    expect(plugin).to provides_attribute('apache/modules')
  end

  let(:command) { double('Fake Command', stdout: 'OUTPUT') }

  it 'correctly captures output' do
    allow(plugin).to receive(:shell_out).with(
      'apachectl -t -D DUMP_MODULES').and_return(command)
    expect(plugin_attribute('apache/modules')).to eq('OUTPUT')
  end
end
