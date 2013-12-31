module Dee
  module Rails
    class Railtie < ::Rails::Railtie
      config.to_prepare do
        ::Dee::Rails.setup!
      end

      generators do
        require 'dee/rails/generators/service_provider_generator'
      end
    end
  end
end
