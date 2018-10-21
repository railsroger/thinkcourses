module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :checks

    def validate(*arg)
      arg ||= []
      self.checks ||= []
      self.checks << arg
    end
  end

  module InstanceMethods

    def validate!
      self.class.checks.each do |value|
        v = instance_variable_get("@#{value[0]}".to_sym)
        send value[1].to_sym, v, value[2]
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

      def format(value, options)
        raise 'Error, wrong format' if value !~ options
      end

      def type(value, options)
        raise 'Error, wrong type' if value.is_a?(options)
      end
  end
end
