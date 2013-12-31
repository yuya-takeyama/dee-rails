module Dee
  module Rails
    module Generators
      class ServiceProviderGenerator < ::Rails::Generators::Base
        source_root File.expand_path('../templates', __FILE__)
        namespace 'dee:service_provider'

        argument :name, :type => :string

        def create_service_provider
          template 'service_provider.rb', File.join('app', 'providers', service_provider_name + ".rb")
        end

        private
          def class_name
            ::ActiveSupport::Inflector.classify(service_provider_name)
          end

          def service_provider_name
            name + "_service_provider"
          end
      end
    end
  end
end
