module Calculater
  module Env
    def extend_env(parameters, args, env)
      alist = parameters.zip(args)
      h = Hash.new
      alist.each { |k, v| h[k] = v }
      [h] + env
    end

    def set_extend_env!(parameters, args_val, ext_env)
      parameters.zip(args_val).each do |parameter, arg_val|
        ext_env[0][parameter] = arg_val
      end
    end

    $primitive_fun_env = {
      :+  => [:prim, lambda{ |x, y| x + y }],
      :-  => [:prim, lambda{ |x, y| x - y }],
      :*  => [:prim, lambda{ |x, y| x * y }],
      :>  => [:prim, lambda{ |x, y| x > y }],
      :>= => [:prim, lambda{ |x, y| x >= y }],
      :<  => [:prim, lambda{ |x, y| x < y }],
      :<= => [:prim, lambda{ |x, y| x <= y }],
      :== => [:prim, lambda{ |x, y| x == y }]
    }

    $boolean_env = {
      :true  => true,
      :false => false
    }

    $global_env = [$primitive_fun_env, $boolean_env]
  end
end
