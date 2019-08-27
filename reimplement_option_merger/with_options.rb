require_relative 'my_option_merger'

class Object
  def with_options(options, &block)
    option_merger = MyOptionMerger.new(self, options)
    block.arity.zero? ? option_merger.instance_eval(&block) : block.call(option_merger)
  end
end
