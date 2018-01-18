class ClassLoader < OpLoader
  def initialize(operation)
    super(operation)
    @class_file = load_file(operation, :classifications)
    load(:actions, :type)
    load(:assets, :type)
  end

  private
    def load(name, *attributes)
      singular_name = name.capitalize.singularize
      if @class_file.include?(singular_name)
        @class_file.fetch(singular_name).each_value { |collection|
          collection.symbolize_keys!.each { |item|
            attributes.each { |attribute|
              if item.include?(attribute)
                instance_variable_get("@#{name}").fetch(item.fetch(:id)).send("#{attribute}=", item.fetch(attribute))
              end
            }
          }
        }
      end
    end
end