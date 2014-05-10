# 作业1-4：Ruby元编程
# 定义一个方法 attr_accessor_with_history，它提供与attr_accessor相同的功能，但是还能追踪这个属性曾经有过的值

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      # YOUR CODE HERE
	def #{attr_name}=(value)
	   if #{attr_name}.nil? 
      		@#{attr_name+"_history"} = Array.new
	   end
	  
	   @#{attr_name+"_history"}.push(#{attr_name})
	   @#{attr_name}=value
	end
     }
  end
end
