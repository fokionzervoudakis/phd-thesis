class Module
  def defensive_copy *method_names
    method_names.each { |name|
      define_method(name) {
        var = instance_variable_get("@#{name}")
        Array.new(var.class == Array ? var : var.values)
      }
    }
  end
end