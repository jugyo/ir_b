begin
  require 'ir_b'
  require 'pry'
  IrB.pry = true
rescue LoadError => e
  warn "LoadError: please install pry => `gem install pry`"
end
