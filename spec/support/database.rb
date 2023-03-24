# frozen_string_literal: true

ActiveRecord::Migration.suppress_messages do
  ActiveRecord::Migration.verbose = true
  ActiveRecord::Base.logger = Logger.new(nil)

  ActiveRecord::Base.configurations = {
    'postgresql' => {
      'adapter' => 'postgresql',
      'host' => ENV.fetch('DB_HOST', 'localhost'),
      'username' => ENV['DB_USER'],
      'password' => ENV['DB_PASS'],
      'database' => 'bithex_test'
    },
    'postgresql_master' => {
      'adapter' => 'postgresql',
      'host' => ENV.fetch('DB_HOST', 'localhost'),
      'username' => ENV['DB_USER'],
      'password' => ENV['DB_PASS'],
      'database' => 'template1',
      'schema_search_path' => 'public'
    }
  }

  ActiveRecord::Base.establish_connection(:postgresql_master)
  ActiveRecord::Base.connection.recreate_database('bithex_test')

  ActiveRecord::Base.establish_connection(:postgresql)

  ActiveRecord::Base.connection.instance_eval do
    create_table :uploads, if_not_exists: true do |t|
      t.bit 'uid', limit: 16
    end
  end

  class BaseEntity < ActiveRecord::Base
    self.abstract_class = true

    extend Bithex::ActiveRecord
  end

  class Upload < BaseEntity
    bithex :uid
  end
end
