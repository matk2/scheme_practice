module Calculater
  module Base
    def _eval(exp, env)
      if not list?(exp)
        if immediate_val?(exp)
          exp
        else
          lookup_var(exp, env)
        end
      else
        if lambda?(exp)
          eval_lambda(exp, env)
        else
          fun = _eval(car(exp), env)
          args = eval_list(cdr(exp), env)
          apply(fun, args)
        end
      end
    end

    def immediate_val?(exp)
      num?(exp)
    end

    def num?(exp)
      exp.is_a?(Numeric)
    end

    def lookup_var(var, env)
      alist = env.find{ |alist| alist.key?(var) }
      if alist == nil
        raise "couldn't find value to variable: '#{var}'"
      end
      alist[var]
    end

    def apply(fun, args)
      if primitive_fun?(fun)
        apply_primitive_fun(fun, args)
      else
        lambda_apply(fun, args)
      end
    end

    def primitive_fun?(exp)
      exp[0] == :prim
    end

    def apply_primitive_fun(fun, args)
      fun_val = fun[1]
      fun_val.call(*args)
    end
  end
end
