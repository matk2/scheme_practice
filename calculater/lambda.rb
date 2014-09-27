module Calculater
  module Lambda
    def lambda?(exp)
      exp[0] == :lambda
    end

    def eval_lambda(exp, env)
      make_closure(exp, env)
    end

    def make_closure(exp, env)
      parameters, body = exp[1], exp[2]
      [:closure, parameters, body, env]
    end

    def lambda_apply(closure, args)
      parameters, body, env = closure_to_parameters_body_env(closure)
      new_env = extend_env(parameters, args, env)
      _eval(body, new_env)
    end

    def closure_to_parameters_body_env(closure)
      [closure[1], closure[2], closure[3]]
    end
  end
end
