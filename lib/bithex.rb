require 'active_record'

require 'bithex/type'
require 'bithex/active_record'
require 'bithex/version'

ActiveRecord::Base.include Bithex::ActiveRecord
