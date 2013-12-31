module Dee
  module Rails
    class ServiceProvider
      class << self
        def provide(&block)
          Dee.container.instance_eval &block
        end
      end
    end
  end
end
