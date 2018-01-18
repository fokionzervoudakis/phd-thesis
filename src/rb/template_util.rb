require './util'

autoload :Asset, './asset'
autoload :ClassLoader, './class_loader'

module ActionUtil
  def self.respondent *method_names
    method_names.each { |name|
      define_method("is_#{name}_action?") { self.class.superclass.name == "#{name.capitalize}Action" }
    }
  end

  respondent :kinetic, :sensor
end

module TypeUtil
  attr_reader :type

  def type=(type)
    @type = type.to_sym
  end
end

class Action; include ActionUtil end

class Asset;
  include TypeUtil

  def self.reader *method_names
    method_names.each { |name|
      temp = "#{name}_actions"
      define_method(temp) {
        unless instance_variable_defined?("@#{temp}")
          instance_variable_set("@#{temp}", Array.new(@actions).delete_if { |action|
            !action.send("is_#{name}_action?")
          })
        end
        instance_variable_get("@#{temp}")
      }
    }
  end

  attr_reader :id
  reader :kinetic, :sensor
end

class KineticAction < Action
  include TypeUtil
  attr_reader :id
end