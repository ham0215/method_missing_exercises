class MyStringInquirer < String
  def method_missing(name)
    if name.to_s.end_with?('?')
      self == name[0..-2]
    else
      super
    end
  end

  def respond_to_missing?(symbol, include_private)
    symbol.to_s.end_with?('?')
  end
end
