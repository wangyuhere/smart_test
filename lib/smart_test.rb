require "smart_test/version"
require "smart_test/cli"

module SmartTest
  NotGitRepoError = Class.new StandardError
  NoTestFolderError = Class.new StandardError
end
