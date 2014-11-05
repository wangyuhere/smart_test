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

    def diff(str)
      raise NotGitRepoError unless project.using_git?
      `git diff #{str} --name-only`.split("\n").select { |file| project.test_file? file }
    end
  end
end
