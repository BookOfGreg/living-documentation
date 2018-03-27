# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
# rubocop:disable ExpandPathArguments
require File.expand_path('../../config/environment', __FILE__)
# rubocop:enable ExpandPathArguments
require 'rails/test_help'

# rubocop:disable ClassAndModuleChildren
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
# rubocop:enable ClassAndModuleChildren
