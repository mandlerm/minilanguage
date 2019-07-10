require 'pry'
class Minilang
  attr_accessor :register, :stack, :instructions
  attr_reader :valid_args

  def initialize(command)
    @register = 0
    @stack = []
    @valid_args = %(PUSH ADD SUB MULT DIV MOD POP PRINT)

    if !check_if_valid_args(command.split) || command.empty?
      abort("Abort! Error in program")
    else
      @instructions = command.split.map(&:downcase)
      run_program
    end
  end

  def run_program
    @instructions.each do |command|
      if command.to_i.to_s == command
        @register = command
      else
        send(command)
      end
    end
  end


  def n
  end

  def push
    @stack.push(@register)
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
    puts register
  end

  def check_if_valid_args(arr)
    arr.all? do |element|
      valid_args.include?(element) || element.to_i.to_s == element
    end
  end
end



# Minilang.new('HAPPY 5 PRINT PUSH 3 PRINT ADD PRINT').eval
m = Minilang.new("5 PUSH PRINT 9 PUSH PRINT")
puts m.stack
# Minilang.new('PRINT') #.eval
# 0
#
# Minilang.new('5 PUSH 3 MULT PRINT') #.eval
# # 15
#
# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT') #.eval
# # 5
# # 3
# # 8
#
# Minilang.new('5 PUSH 10 PRINT POP PRINT') #.eval
# # 10
# # 5
#
# Minilang.new('5 PUSH POP POP PRINT') #.eval
# # Empty stack!
#
# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ') #.eval
# # 6
#
# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ') #.eval
# # 12
#
# Minilang.new('-3 PUSH 5 XSUB PRINT') #.eval
# # Invalid token: XSUB
#
# Minilang.new('-3 PUSH 5 SUB PRINT') #.eval
# # 8
#
# Minilang.new('6 PUSH') #.eval
# # (nothing printed; no PRINT commands)
