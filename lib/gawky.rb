require 'gawky/version'
require 'github_api'
require 'status'
require 'json'


module Gawky

  class Runner

    def initialize
      @date_now = Date.today
      configuration = JSON.load(IO.read(ENV['HOME'] + '/.gawky.json'))
      @github = Github.new oauth_token: configuration['token']
      @acceptable = configuration['maxElapsedDays']
    end


    def run
      issues = @github.issues.list(:org => ARGV[0], :filter => 'all', :auto_pagination => true, :sort => 'created')
      issues.each do |issue|
        if issue['pull_request']
          date = DateTime.parse(issue.created_at)
          if elapsed_time(date) > @acceptable
            puts Status.new(date, issue).warning
          else
            puts Status.new(date, issue).green
          end
        end
      end
    end

    private
    def elapsed_time(date)
      (@date_now - date).to_i
    end
  end
end
