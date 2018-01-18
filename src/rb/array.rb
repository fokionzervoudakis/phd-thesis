class Array
  def symbolize_keys!
    self.each { |item| item.symbolize_keys! if item.class == Hash }
    self
  end
end