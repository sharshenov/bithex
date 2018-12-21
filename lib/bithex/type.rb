module Bithex
  # Serializes hex string to bit string and vice versa
  class Type < ActiveRecord::Type::Value
    attr_reader :attr,
                :subtype

    def initialize(attr, subtype)
      @attr     = attr
      @subtype  = subtype
      validate_subtype
    end

    def deserialize(value)
      return if value.blank?

      format("%0#{hex_value_length}x", value.to_i(2))
    end

    def serialize(value)
      return if value.blank?

      [value.to_s].pack('H*').unpack1('B*')
    end

    def assert_valid_value(value)
      return if value.blank?

      validate_format(value)
      validate_length(value)
    end

    private

    def hex_value_length
      subtype.limit / 4
    end

    def validate_subtype
      return if subtype.is_a?(::ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Bit)

      raise ::ActiveRecord::SerializationTypeMismatch,
            "Expected '#{attr}' to be a bit string. Check DB column type."
    end

    def validate_format(value)
      return if value.match?(/\h+/)

      raise ArgumentError,
            "Expected '#{value}' to be a hex string"
    end

    def validate_length(value)
      return if value.to_s.length == hex_value_length

      raise ArgumentError,
            "Expected length of '#{value}' to be equal to #{hex_value_length}"
    end
  end
end
