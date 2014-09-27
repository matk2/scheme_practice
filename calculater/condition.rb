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

    def cond?(exp)
      exp[0] == :cond
    end

    def eval_cond(exp, env)
      if_exp = cond_to_if(cdr(exp))
      eval_if(if_exp, env)
    end

    def cond_to_if(cond_exp)
      if cond_exp == []
        ''
      else
        e = car(cond_exp)
        p, c = e[0], e[1]
        if p == :else
          p = :true
        end
        [:if, p, c, cond_to_if(cdr(cond_exp))]
      end
    end
  end
end
