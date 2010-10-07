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
