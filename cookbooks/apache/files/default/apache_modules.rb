Ohai.plugin(:Apache) do
  provides 'apache/modules'

  collect_data do
    apache(Mash.new)
    command = shell_out('apachectl -t -D DUMP_MODULES')
    # TODO: Clean up the large string of output into
    #  a hash which contains static and shared modules
    #  listed as an array.
    apache[:modules] = command.stdout
  end
end
