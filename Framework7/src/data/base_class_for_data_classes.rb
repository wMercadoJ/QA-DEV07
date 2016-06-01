class BaseClassForDataClasses
  KIND_VALUES=%w(account workspace account_summary)
  STATUS_VALUES=%w(active inactive)
  PLAN_VALUES=['Free', 'Pro M', 'Enterprise Unlimited (Invoiced)']
  def initialize(values)
    case
      when values.respond_to?(:each_pair)
        # Hash of values for accessors.
        values.each_pair do |key, value|
          send("#{key}=", value)
        end
      else
        raise ArgumentError.new(values.inspect)
    end
    nil
  end

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat vars
    # noinspection RubySuperCallWithoutSuperclassInspection
    super(*vars)
  end

  def self.attributes
    @attributes
  end

  def attributes
    self.class.attributes
  end
  def to_hash
    hash = self.instance_variables.each_with_object({}) { |var, hash|
      hash[var.to_s.delete('@')] = self.instance_variable_get(var)
    }
    hash
  end
  def to_hash_of_symbols
    symbol_hash = self.instance_variables.each_with_object({}) { |var, hash|
      hash[var.to_s.delete('@').to_sym] = self.instance_variable_get(var)
    }
    symbol_hash
  end
  def validate_field
    validate_status=true
    object_hash=self.to_hash
    object_hash.each_pair do |key,value|
      validate_status=self.field_valid(key,value) && validate_status
    end
    validate_status
  end
end
class String
  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.empty? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end