module Calculater
  module Quote
    def eval_quote(exp, env)
      car(cdr(exp))
    end

    def quote?(exp)
      exp[0] == :quote
    end
  end
end
