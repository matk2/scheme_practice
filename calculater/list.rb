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

    def eval_list(exp)
      exp.map{ |e| _eval(e) }
    end
  end
end
