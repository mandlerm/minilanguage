require 'pry'
class Minilang
  attr_accessor :register, :stack
  attr_reader :valid_args

  def initialize(command)
    @register = 0
    @stack = []
    @valid_args = %(PUSH ADD SUB MULT DIV MOD POP PRINT)

    check_if_valid_args(command.split)
  end

  def push
  end

  def add
  end

  def sub
  end

  def mult
  end

  def div
  end

  def mod
  end

  def pop
  end

  def print
  end

  def check_if_valid_args(arr)
    arr.all? do |element|
      valid_args.include?(element) || element.to_i.to_s == element
    end
  end
end



Minilang.new('HAPPY 5 PRINT PUSH 3 PRINT ADD PRINT').eval
# Minilang.new('PRINT').eval
# 0
#
# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15
#
# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8
#
# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5
#
# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!
#
# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6
#
# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12
#
# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB
#
# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8
#
# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
