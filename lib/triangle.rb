require 'pry'

class Triangle
  
  attr_accessor :a, :b, :c, :tri
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c 
    @tri = [@a, @b, @c]  
  end 

  ####### HELPER METHODS ########

  def valid?
    @a + @b > @c && @a + @c > @b && @b + @c > @a
  end 

  def has_zeros
    @tri.find{|num| num == 0}
  end 

  def negative
    @tri.find{|num| num < 0}
  end 

  def equ
    @a == @b && @a == @c
  end

  def iso
    (@a == @b && @a != @c) || (@b == @c && @b != @a) || (@a == @c && @a != @b)
  end 

  def sca
    (@a != @b && @a != @c) && @b != @c
  end 
  
  ###### IMPORTANT METHOD #######

  def kind 

    if !self.valid?
      raise TriangleError

    elsif self.has_zeros
      raise TriangleError

    elsif self.negative
      raise TriangleError

    else
      if self.equ
        :equilateral
      elsif self.iso
        :isosceles
      else 
        :scalene
      end
    end  
  end 

  ####### ERROR CLASS #######

  class TriangleError < StandardError
    def message
      "This is not a proper triangle."
    end 

  end 
end



# equ = Triangle.new(5, 5, 5)
# iso = Triangle.new(10, 10, 2)
# sca = Triangle.new(15, 1, 4)
# err = Triangle.new(5, 6, 0)
# err2 = Triangle.new(20, 1, -1)


# binding.pry