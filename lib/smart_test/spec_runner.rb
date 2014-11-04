require "smart_test/project"
require "smart_test/filter"

module SmartTest
  class SpecRunner
    def initialize(root, options={})
      @project = Project.new root
      @filter = Filter.new @project
      @options = {
        type: :mtime,
        param: 1
      }.merge! options
    end

    def files
      @files ||= @filter.send @options[:type], @options[:param]
    end

    def run
      system cmd
    end

    def cmd
      @cmd ||= "bundle exec rspec #{files.join(' ')}"
    end
  end
end
