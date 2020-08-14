if defined?(::Rails::Railtie)
  module ActiveRecord
    module Mysql
      module Enum
        class Railtie < Rails::Railtie
          initializer 'active_record-mysql-enum.initialize', :after => 'active_record.initialize_database' do |app|
            ActiveSupport.on_load :active_record do
              require 'enum/mysql_adapter'
              require 'enum/enum_type'
              require 'enum/enum_adapter'
              require 'enum/enum_column_adapter'
              require 'enum/schema_definitions'
              require 'enum/quoting'
              require 'enum/validations'
            end

            ActiveSupport.on_load :action_view do
              require 'enum/active_record_helper'
            end
          end
        end
      end
    end
  end
end
