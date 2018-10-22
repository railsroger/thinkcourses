module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :checks

    def validate(name, type, *args)
      self.checks ||= {}
      self.checks << args
    end
  end

  module InstanceMethods

    def validate!
      self.class.checks.each do |value|
        v = instance_variable_get("@#{value[:name]}".to_sym)
        send(value[:type].to_sym, v, value[:args])
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

      def presence(value, options)
        raise 'Error, value cannot be empty' if value.empty?
      end

      def format(value, format)
        raise 'Error, wrong format' if value !~ format
      end

      def type(value, class_name)
        raise 'Error, wrong type' if value.is_a?(class_name)
      end
  end
end
