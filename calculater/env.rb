module Calculater
  module Env
    def extend_env(parameters, args, env)
      alist = parameters.zip(args)
      h = Hash.new
      alist.each { |k, v| h[k] = v }
      [h] + env
    end

    $primitive_fun_env = {
      :+  => [:prim, lambda{ |x, y| x + y }],
      :-  => [:prim, lambda{ |x, y| x - y }],
      :*  => [:prim, lambda{ |x, y| x * y }]
    }

    $global_env = [$primitive_fun_env]
  end
end
