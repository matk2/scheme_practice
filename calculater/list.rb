module Calculater
  module List
    def list?(exp)
      exp.is_a?(Array)
    end

    def car(list)
      list[0]
    end

    def cdr(list)
      list[1..-1]
    end

    def null?(list)
      list == []
    end

    def cons(a, b)
      if not list?(b)
        raise "sorry, we haven't implemented yet..."
      else
        [a] + b
      end
    end

    def list(*list)
      list
    end

    def eval_list(exp, env)
      exp.map{ |e| _eval(e, env) }
    end
  end
end
