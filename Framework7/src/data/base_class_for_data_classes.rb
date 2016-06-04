class BaseClassForDataClasses

  KIND_VALUES = %w(me account workspace project error account_summary label epic)
  WEEK_DAY = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
  ERROR_VALUES = ["invalid_parameter",
                  "One or more request parameters was missing or invalid.",
                  "Cannot parse the JSON-encoded request body.",
                  "could_not_parse_body",
                  "unfound_resource",
                  "The object you tried to access could not be found.",
                  "It may have been removed by another user, you may be using the ID of another object type, or you may be trying to access a sub-resource at the wrong point in a tree.",
                  "The object you tried to access could not be found.  It may have been removed by another user, you may be using the ID of another object type, or you may be trying to access a sub-resource at the wrong point in a tree.",
                  "route_not_found",
                  "The path you requested has no valid endpoint.",
                  "Name can't be blank",
                  "You cannot add project id 0 to your workspace, either you are not a member or the project doesn't exist.",
                  "'week_start_day' must be one of: sunday, monday, tuesday, wednesday, thursday, friday, saturday"]
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

  def validate_fields
      validate_status = true
      object_hash = self.to_hash
      object_hash.each_pair do |key, value|
        validate_status = self.field_valid(key, value) && validate_status
      end
    validate_status
  end

  def validate_fields_symbol
    validate_status = true
    object_hash = self.to_hash_of_symbols
    object_hash.each_pair do |key, value|
      validate_status = self.field_valid(key, value) && validate_status
    end
    validate_status
  end

  def convert_array_json_to_hash(array_json)

    objArray = JSON.parse(array_json)
    hashArray = Array.new()
    objArray.each do |object|
      hashArray.push(object.to_hash)
    end
  end

end
