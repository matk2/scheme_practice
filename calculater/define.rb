module Calculater
  module Define
    def define?(exp)
      exp[0] == :define
    end

    def eval_define(exp, env)
      if define_with_parameter?(exp)
        var, val = define_with_parameter_var_val(exp)
      else
        var, val = define_var_val(exp)
      end
      var_ref = lookup_var_ref(var, env)
      if var_ref != nil
        var_ref[var] = _eval(val, env)
      else
        extend_env!([var], [_eval(val, env)], env)
      end
      nil
    end

    def define_with_parameter?(exp)
      list?(exp[1])
    end

    def define_with_parameter_var_val(exp)
      var = car(exp[1])
      parameters, body = cdr(exp[1]), exp[2]
      val = [:lambda, parameters, body]
      [var, val]
    end

    def define_var_val(exp)
      [exp[1], exp[2]]
    end

    def lookup_var_ref(var, env)
      env.find{ |alist| alist.key?(var) }
    end
  end
end
