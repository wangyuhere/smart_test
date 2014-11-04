module SmartTest
  class Project
    attr_reader :root

    def initialize(root)
      @root = root
    end

    def using_bundle?
      @using_bundle ||= File.exists?(File.join root, "Gemfile")
    end

    def using_git?
      @using_git ||= File.exists?(File.join root, ".git")
    end

    def test_folder
      "spec"
    end

    def test_file_pattern
      "*_#{test_folder}.rb"
    end

    def test_files
      Dir.glob "#{test_folder}/**/#{test_file_pattern}"
    end
  end
end
