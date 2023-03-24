module Bithex
  # It is supposed to be included in ActiveRecord::Base
  module ActiveRecord
    extend ActiveSupport::Concern

    # Bithex attributes are defined like this:
    #   class Upload < ActiveRecord::Base
    #     bithex :foo, :bar, :baz
    #   end
    module ClassMethods
      def bithex(*definitions)
        definitions.each do |name|
          attr = attribute_alias?(name) ? attribute_alias(name) : name
          if ::ActiveRecord.version >= ::Gem::Version.new('6.1.0')
            decorate_attribute_type(attr.to_s) do |subtype|
              Bithex::Type.new(attr, subtype)
            end
          else
            decorate_attribute_type(attr, :bithex) do |subtype|
              Bithex::Type.new(attr, subtype)
            end
          end
        end
      end
    end
  end
end
