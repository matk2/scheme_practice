Dir[File.expand_path('../calculater', __FILE__) << '/*.rb'].each do |file|
  require file
end

include Calculater::Base
include Calculater::Env
include Calculater::List
