# frozen_string_literal: true

require "open3"

module Git
  module Cop
    module Branches
      module Environments
        # Provides Travis CI build environment feature branch information.
        class TravisCI
          def initialize environment: ENV, shell: Open3
            @environment = environment
            @shell = shell
          end

          def name
            pull_request_branch.empty? ? ci_branch : pull_request_branch
          end

          def shas
            prepare_project

            shell.capture2e(%(git log --pretty=format:"%H" origin/master..#{name}))
                 .then { |result, _status| result.split "\n" }
          end

          private

          attr_reader :environment, :shell

          def prepare_project
            slug = pull_request_slug

            unless slug.empty?
              shell.capture2e "git remote add -f original_branch https://github.com/#{slug}.git"
              shell.capture2e "git fetch original_branch #{name}:#{name}"
            end

            shell.capture2e "git remote set-branches --add origin master"
            shell.capture2e "git fetch"
          end

          def ci_branch
            environment["TRAVIS_BRANCH"]
          end

          def pull_request_branch
            environment["TRAVIS_PULL_REQUEST_BRANCH"]
          end

          def pull_request_slug
            environment["TRAVIS_PULL_REQUEST_SLUG"]
          end
        end
      end
    end
  end
end
