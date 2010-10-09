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
    def -(_binding)
      file = _binding.eval '__FILE__'
      ir_b_line = _binding.eval '__LINE__'
      puts "#{file}:#{ir_b_line} \e[90mtxmt://open/?url=file://#{ File.expand_path(file).sub(File.expand_path('~'), '~') }&line=#{ ir_b_line }\e[0m"

      File.open(file).each_with_index do |line, index|
        line_n = index + 1
        next unless line_n > (ir_b_line - 6)
        break if line_n > (ir_b_line + 5)
        if line_n == ir_b_line
          puts "\e[100m =>#{line_n.to_s.rjust(3)}: #{line.chomp} \e[0m"
        else
          puts "\e[90m#{line_n.to_s.rjust(6)}: #{line.chomp} \e[0m"
        end
      end

      IRB.start_session(_binding)
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
