module Calculater
  module Base
    def _eval(exp)
      if not list?(exp)
        if immediate_val?(exp)
          exp
        else
          lookup_primitive_fun(exp)
        end
      else
        fun = _eval(car(exp))
        args = eval_list(cdr(exp))
        apply_primitive_fun(fun, args)
      end
    end

    def immediate_val?(exp)
      num?(exp)
    end

    def num?(exp)
      exp.is_a?(Numeric)
    end

    def lookup_primitive_fun(exp)
      $primitive_fun_env[exp]
    end

    def apply_primitive_fun(fun, args)
      fun_val = fun[1]
      fun_val.call(*args)
    end
  end
end
