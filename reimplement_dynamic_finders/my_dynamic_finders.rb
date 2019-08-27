module MyDynamicFinders
  def method_missing(name, *args)
    if name.to_s =~ /find_by_(.+)/
      return super unless User.method_defined?($1)

      $DATABASE.find {|u| u.public_send($1) == args[0] }
    else
      super
    end
  end

  def respond_to_missing?(symbol, include_private)
    if name.to_s =~ /find_by_(.+)/
      return super unless User.method_defined?($1)
      true
    else
      false
    end
  end
end
