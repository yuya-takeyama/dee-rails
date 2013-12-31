require "dee"
require "dee/rails/loader"
require "dee/rails/railtie" if defined? Rails
require "dee/rails/service_provider"
require "dee/rails/version"

module Dee
  module Rails
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
