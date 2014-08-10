require "rails-assets-vue/version"


if defined?(Rails)
  module RailsAssetsVue
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
