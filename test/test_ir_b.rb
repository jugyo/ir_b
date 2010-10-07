require 'helper'

class TestIrB < Test::Unit::TestCase
  should "do ir b" do
    _binding = b
    mock(IRB).start_session(_binding)
    ir _binding
  end

  should "do ir-b" do
    _binding = b
    mock(IRB).start_session(_binding)
    ir-_binding
  end
end
