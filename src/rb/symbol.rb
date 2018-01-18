require 'active_support/inflector'

class Symbol
  def include?(sym)
    to_s.include?(sym.to_s)
  end

  def singularize
    to_s.singularize.intern
  end

  def to_c
    Kernel.const_get(self)
  end
end