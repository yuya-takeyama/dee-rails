require "dee"
require "dee/rails/loader"
require "dee/rails/railtie" if defined? Rails
require "dee/rails/service_provider"
require "dee/rails/version"

module Dee
  module Rails
    def self.setup!
      ::Dee.extend self
      ::Dee.container = ::Dee::Container.new
      ::Dee::Rails::Loader.load!
    end

    def container=(container)
      @@container = container
    end

    def container
      @@container
    end

    def [](key)
      @@container[key]
    end

    def []=(key, value)
      @@container[key] = value
    end
  end
end
