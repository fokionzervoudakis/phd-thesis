class Hash
  def symbolize_keys!
    keys.each { |key| self[(key.to_sym rescue key)] = delete(key) }
    values.each { |value| value.symbolize_keys! if value.class == Hash }
    self
  end
end