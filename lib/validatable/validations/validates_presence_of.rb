module Validatable 
  class ValidatesPresenceOf < ValidationBase #:nodoc:
    def valid?(instance)
      value = instance.send(self.attribute)
      return true if allow_nil && value.nil?
      return true if allow_blank && value.blank?
      
      return false if value.nil? || value.blank?
      value.respond_to?(:strip) ? value.strip.length != 0 : true
    end
    
    def message(instance)
      super || "can't be empty"
    end
  end
end

