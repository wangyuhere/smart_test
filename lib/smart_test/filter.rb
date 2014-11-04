module SmartTest
  class Filter
    attr_reader :project

    def initialize(project)
      @project = project
    end

    def mtime(num)
      project.test_files.map { |file| [file, File.mtime(file)] }.
        sort_by(&:last).
        last(num).
        map &:first
    end

    def diff
      check_git
      raise "to be implemented"
    end

    def commit
      check_git
      raise "to be implemented"
    end

    def branch
      check_git
      raise "to be implemented"
    end

    private

    def check_git
      raise "Not a git project" unless project.using_git?
    end
  end
end
