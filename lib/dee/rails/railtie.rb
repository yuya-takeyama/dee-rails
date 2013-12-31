module Dee
  module Rails
    class Railtie < ::Rails::Railtie
      config.to_prepare do
        ::Dee::Rails.setup!
      end
    end
  end
end
