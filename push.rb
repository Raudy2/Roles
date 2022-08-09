# frozen_string_literal: true

require 'fileutils'
require 'shellwords'

def run_commands
  commands = [
    'git add .',
    "git commit -m '#{ARGV[0]}'",
    'git push'
  ]
  commands.each do |command|
    puts command
    # know when test in rspec failed
    # unless system(command)
    #   puts 'Test failed'
    #   exit 1
    # end
    # know when branch is not pushed
    branch = `git rev-parse --abbrev-ref HEAD`.chomp
    if ARGV[1] == '--push'
      system("git push --set-upstream origin #{branch}")
    else
      puts 'Branch not pushed'
      puts 'Please push branch manually or use --push flag'
      exit 1
    end
  end
end

run_commands
