module Dee
  module Rails
    class Loader
      class << self
        def load!
          Dir.glob(providers_glob_path).each do |file|
            load file
          end
        end

        private
          def providers_path
            File.join(::Rails.root, 'app', 'providers')
          end

          def providers_glob_path
            File.join(providers_path, '*_service_provider.rb')
          end
      end
    end
  end
end
