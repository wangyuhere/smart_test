require "optparse"
require "smart_test/version"
require "smart_test/spec_runner"

module SmartTest
  class CLI
    def parse!(args)
      options = {}
      opts = OptionParser.new do |opt|
        opt.banner = <<-EOS
Run test smartly

Usage: smart_test [-b|-c|-d]
       smart_test -v
       smart_test NUM
        EOS

        opt.on("-V", "--version", "Show version") do
          puts VERSION
          exit
        end

        opt.on("-n", "--number [NUM]", Integer, "Number of files") do |num|
          options[:number] = num || 1
        end
      end

      opts.parse! args

      start_runner options
    end

    def start_runner(options)
      runner = SpecRunner.new(Dir.pwd, options)

      puts runner.cmd
      runner.run
    end
  end
end
