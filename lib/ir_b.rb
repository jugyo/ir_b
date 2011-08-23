# coding: utf-8
require 'irb'

module IRB
  def self.start_session(binding)
    unless @__irb_initialized
      args = ARGV.dup
      ARGV.clear
      IRB.setup(nil)
      ARGV.replace(args)
      @__irb_initialized = true
    end

    workspace = WorkSpace.new(binding)

    irb = Irb.new(workspace)

    @CONF[:IRB_RC].call(irb.context) if @CONF[:IRB_RC]
    @CONF[:MAIN_CONTEXT] = irb.context

    catch(:IRB_EXIT) do
      irb.eval_input
    end
  end
end

module IrB
  class << self
    attr_accessor :pry

    def -(_binding)
      if pry
        require 'pry'
        _binding.pry
      else
        file = _binding.eval '__FILE__'
        ir_b_line = _binding.eval '__LINE__'
        puts "#{file}:#{ir_b_line}"

        File.open(file).each_with_index do |line, index|
          line_n = index + 1
          next unless line_n > (ir_b_line - 6)
          break if line_n > (ir_b_line + 5)
          if line_n == ir_b_line
            puts " =>#{line_n.to_s.rjust(3)}: #{line.chomp}"
          else
            puts "#{line_n.to_s.rjust(6)}: #{line.chomp}"
          end
        end

        IRB.start_session(_binding)
      end
    end
  end
end

module Kernel
  alias_method :b, :binding
  def ir(_binding = nil)
    if _binding
      IrB-_binding
    else
      IrB
    end
  end
end
