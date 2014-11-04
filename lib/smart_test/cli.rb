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
       smart_test -s
       smart_test NUM
        EOS

        opt.on("--version", "Show version") do
          puts VERSION
          exit
        end

        opt.on("-n", "--number [NUM]", Integer, "Number of files") do |num|
          options[:number] = num || 1
        end

        opt.on("-s", "--show", "Show test files only") do
          options[:show] = true
        end
      end

      opts.parse! args

      @runner = SpecRunner.new(Dir.pwd, options)
      if options[:show]
        show_test_files
      else
        run
      end
    end

    private

    def run
      puts @runner.cmd
      @runner.run
    end

    def show_test_files
      puts "Found test files:"
      @runner.files.each do |file|
        puts "  #{file}"
      end
    end
  end
end
