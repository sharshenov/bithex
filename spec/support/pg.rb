require 'active_record/connection_adapters/postgresql_adapter'

def bit_subtype(limit: 16)
  ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Bit.new(limit: limit)
end

def integer_subtype
  ActiveModel::Type::Integer.new
end
