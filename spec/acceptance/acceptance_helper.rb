require 'rails_helper'

RSpec.configure do |config|

  Capybara.javascript_driver = :webkit

  Capybara::Webkit.configure do |config|
    config.block_unknown_urls
  end
  Capybara.default_max_wait_time = 5

  config.include AcceptanceMacros, type: :feature

  config.use_transactional_fixtures = false
end
