require_relative 'base_class_for_data_classes'
require_relative '../requests/project_details_get'
class Error_details < BaseClassForDataClasses
    attr_accessor :code,
                  :kind,
                  :error,
                  :general_problem

    def initialize(values = {})
      super(values)
    end
    def field_valid(field, value)
      case
        when field == :kind
          KIND_VALUES.include?(value.to_s)
        when field == :code

          ProjectDetailsGet.validate_word_type(value.to_s) && ERROR_VALUES.include?(value)
        when field == :error
           value.to_s
          ProjectDetailsGet.validate_word_type(value.to_s) && ERROR_VALUES.include?(value)
        when field == :general_problem
          value.to_s
          ProjectDetailsGet.validate_word_type(value.to_s) && ERROR_VALUES.include?(value)
        else
          puts '%s field was not found ' % field
          false
      end

    end
end