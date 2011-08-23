ir_b
====

irb anywhere by calling 'ir b' (need a whitespace!).

Install
----

    gem install ir_b

Usage
----

    require 'ir_b'
    ...
    ir b # or ir-b

or with [pry](http://pry.github.com/):

    require 'ir_b/pry'
    ...
    ir b

Detail
----

* the method 'ir' is Kernel#ir and start irb session with specified binding
* the method 'b' is an alias of binding
* the method IrB.- start irb session

Copyright
----

Copyright (c) 2010 jugyo. See LICENSE for details.
