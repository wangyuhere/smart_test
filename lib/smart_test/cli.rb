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

Usage: smart_test -d GIT_DIFF_PARAM
       smart_test [-s|-b]
       smart_test -n NUM
        EOS

        opt.on("-v", "--version", "Show version") do
          puts VERSION
          exit
        end

        opt.on("-n", "--number [NUM]", Integer, "Number of files") do |num|
          options[:type] = :mtime
          options[:param] = num || 1
        end

        opt.on("-s", "--show", "Show test files only") do
          options[:show] = true
        end

        opt.on("-d", "--diff [STR]", "Diff param") do |str|
          options[:type] = :diff
          options[:param] = str
        end

        opt.on("-b", "--branch", "Branch test") do
          options[:type] = :diff
          options[:param] = "master"
        end
      end

      opts.parse! args

      if options.empty? && args.size > 0
        arg = args.join ' '
        if arg =~ /\d+/
          options = { type: :mtime, param: arg.to_i }
        else
          options= { type: :diff, param: arg }
        end
      end

      @runner = SpecRunner.new(Dir.pwd, options)

      if @runner.files.empty?
        puts "No test files to run!"
        return
      end

      if options[:show]
        show_test_files
      else
        run
      end
    rescue NotGitRepoError
      puts "Not a git repository!"
    rescue NoTestFolderError
      puts "No test folder found here. PWD: #{Dir.pwd}"
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
