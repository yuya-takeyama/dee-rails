module Dee
  module Rails
    class Railtie < ::Rails::Railtie
      initializer 'dee.rails.load' do
        ::Dee.extend ::Dee::Rails
        ::Dee.container = ::Dee::Container.new
        ::Dee::Rails::Loader.load!
      end
    end
  end
end
