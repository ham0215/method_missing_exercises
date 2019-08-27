require_relative 'my_dynamic_finders'

class User
  extend MyDynamicFinders

  attr_accessor :id, :first_name, :last_name, :age, :sex
  def initialize(id, first_name, last_name, age, sex)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @age = age
    @sex = sex
  end
end
