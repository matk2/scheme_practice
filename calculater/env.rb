module Calculater
  module Env
    $primitive_fun_env = {
      :+  => [:prim, lambda{ |x, y| x + y }],
      :-  => [:prim, lambda{ |x, y| x - y }],
      :*  => [:prim, lambda{ |x, y| x * y }]
    }
  end
end
