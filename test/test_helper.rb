ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper
end


# note: rspecのテストコマンド
# dc exec web bundle exec rspec --profile 10

# note : 結合テスト
# dc exec web bundle exec rspec spec/system/static_pages_spec.rb