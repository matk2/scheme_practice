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

    $list_env = {
      :nil   => [],
      :null? => [:prim, lambda{ |list| null?(list) }],
      :cons  => [:prim, lambda{ |a, b| cons(a, b) }],
      :car   => [:prim, lambda{ |list| car(list) }],
      :cdr   => [:prim, lambda{ |list| cdr(list) }],
      :list  => [:prim, lambda{ |*list| list(*list) }]
    }

    $global_env = [$list_env, $primitive_fun_env, $boolean_env]
  end
end
