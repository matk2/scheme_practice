module Calculater
  module Let
    def let?(exp)
      exp[0] == :let
    end

    def eval_let(exp, env)
      parameters, args, body = let_to_parameters_args_body(exp)
      new_exp = [[:lambda, parameters, body]] + args
      _eval(new_exp, env)
    end

    def let_to_parameters_args_body(exp)
      [exp[1].map{ |e| e[0] }, exp[1].map{ |e| e[1] }, exp[2]]
    end
  end
end
