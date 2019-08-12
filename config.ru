require './config/environment'


use Rack::MethodOverride
use SessionsController
use ComicsController
run ApplicationController
