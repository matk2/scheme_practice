module Calculater
  module Condition
    def if?(exp)
      exp[0] == :if
    end

    def eval_if(exp, env)
      cond, true_clause, false_clause = if_to_cond_true_false(exp)
      if _eval(cond, env)
        _eval(true_clause, env)
      else
        _eval(false_clause, env)
      end
    end

    def if_to_cond_true_false(exp)
      [exp[1], exp[2], exp[3]]
    end
  end
end
