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

    def letrec?(exp)
      exp[0] == :letrec
    end

    def eval_letrec(exp, env)
      parameters, args, body = letrec_to_parameters_args_body(exp)
      tmp_env = Hash.new
      parameters.each do |parameter|
        tmp_env[parameter] = :dummy
      end
      ext_env = extend_env(tmp_env.keys(), tmp_env.values(), env)
      args_val = eval_list(args, ext_env)
      set_extend_env!(parameters, args_val, ext_env)
      new_exp = [[:lambda, parameters, body]] + args
      _eval(new_exp, ext_env)
    end

    def letrec_to_parameters_args_body(exp)
      let_to_parameters_args_body(exp)
    end

    def letnamed?(exp)
      exp[0] == :letnamed
    end

    def eval_letnamed(exp, env)
      eval_letrec(letnamed_to_exp_for_letrec(exp), env)
    end

    def letnamed_to_exp_for_letrec(exp)
      parameter = exp[1][0]
      args = [:lambda, exp[1][1].map{ |elem| elem[0] }, exp[2]]
      body = [parameter] + exp[1][1].map{ |elem| elem[1] }
      [exp[0], [[parameter, args]], body]
    end

    def letstar?(exp)
      exp[0] == :letstar
    end

    def eval_letstar(exp, env)
      exp[1].each do |parameter, arg|
        set_extend_env!([parameter], [arg], env)
      end
      eval_let(exp, env)
    end
  end
end
