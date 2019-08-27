module MyDynamicFinders
  def method_missing(name, *args)
    if name.to_s =~ /find_by_(.+)/
      cols = $1.split('_and_')
      return super unless cols.all? {|c| User.method_defined?(c) }

      $DATABASE.find do |u|
        i = -1
        cols.all? do |c|
          i += 1
          u.public_send(c) == args[i]
        end
      end
    else
      super
    end
  end

  def respond_to_missing?(symbol, include_private)
    if name.to_s =~ /find_by_(.+)/
      cols = $1.split('_and_')
      return super unless cols.all? {|c| User.method_defined?(c) }
      true
    else
      false
    end
  end
end
