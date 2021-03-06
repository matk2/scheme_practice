Dir[File.expand_path('../calculater', __FILE__) << '/*.rb'].each do |file|
  require file
end

include Calculater::Base
include Calculater::Condition
include Calculater::Define
include Calculater::Env
include Calculater::Lambda
include Calculater::Let
include Calculater::List
include Calculater::Parse
include Calculater::Quote
include Calculater::Repl
