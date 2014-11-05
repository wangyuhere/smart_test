# SmartTest

Run tests based on file last modifed at and git diff.

Now only rspec is supported!

## Installation

    $ gem install smart_test

## Usage

Under the root of a project with test files, you can run:


Run latest modified test file

    $ smart_test

Run latest modified 3 test files

    $ smart_test 3

Run test files based on git diff, -d can be skipped if it has param

    $ smart_test -d
    $ smart_test -d master
    $ smart_test HEAD~2
    $ smart_test GIT_HASH

Show the test files which will be running

    $ smart_test -d master -s


## Contributing

1. Fork it ( https://github.com/[my-github-username]/smart_test/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
