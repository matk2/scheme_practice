module Calculater
  module Parse
    def parse(exp)
      program = exp.strip().
        gsub(/[a-zA-Z\+\-\*><=][0-9a-zA-Z\+\-=!*]*/, ':\\0').
        gsub(/\s+/, ', ').
        gsub(/\(/, '[').
        gsub(/\)/, ']')
      eval(program)
    end
  end
end
