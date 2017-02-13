class Master::BaseController < HomeController
  before_action :authenticate_user!, :authorize_user!
end
