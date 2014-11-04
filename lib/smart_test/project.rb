module SmartTest
  class Project
    attr_reader :root, :test_folder

    def initialize(root, test_folder = "spec")
      @root = root
      @test_folder = test_folder
      raise NoTestFolderError unless File.exists? File.join(root, test_folder)
    end

    def using_bundle?
      @using_bundle ||= File.exists?(File.join root, "Gemfile")
    end

    def using_git?
      @using_git ||= File.exists?(File.join root, ".git")
    end

    def test_files
      Dir.glob "#{test_folder}/**/*_#{test_folder}.rb"
    end

    def test_file?(file)
      file =~ /\A#{test_folder}\/.*#{test_folder}\.rb\Z/i
    end
  end
end
