require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TimeTracker
  class Application < Rails::Application
    config.load_defaults 5.1

    # Addition
    config.autoload_paths << Rails.root.join("lib")
  end
end
