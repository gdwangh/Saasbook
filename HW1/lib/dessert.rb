# 作业1-2：用基本的面向对象编程编写Dessert 
class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    # return true only when calories<200
    @calories<200
  end

  def delicious?
    # return true for any dessert
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(flavor)
    @flavor = flavor

    # jellyBean is a kind of dessert, 
    # with name flavor + "jelly bean" and initial calories=5
    super(flavor+" jelly bean", 5)
  end

  def delicious?
    # return false for flavor and true for other
   flavor!='licorice'
  end
end
