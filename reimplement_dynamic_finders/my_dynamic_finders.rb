module MyDynamicFinders
  def method_missing(name, *args)
    if name.to_s =~ /^find_by_(.+)$/
      hit = $1.end_with?('!')
      str = hit ? $1.delete('!') : $1
      cols = str.split('_and_')
      return super unless cols.all? {|c| User.method_defined?(c) }

      u = $DATABASE.find do |u|
        i = -1
        cols.all? do |c|
          i += 1
          u.public_send(c) == args[i]
        end
      end
      raise if u.nil? && hit
      u
    else
      super
    end
  end

  def respond_to_missing?(symbol, include_private)
    if name.to_s =~ /^find_by_(.+)$/
      hit = $1.end_with?('!')
      str = hit ? $1.delete('!') : $1
      cols = str.split('_and_')
      return super unless cols.all? {|c| User.method_defined?(c) }
      true
    else
      false
    end
  end
end
