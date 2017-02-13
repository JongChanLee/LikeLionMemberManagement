class HomeController < ApplicationController
  def index
    unless user_signed_in?
      render 'devise/sessions/new'
    else
      if current_user.status == "block"
        render partial: 'partial/block'
      else
        if current_user.instance_of? Master
          redirect_to master_dashboard_path
        else
          redirect_to organizer_dashboard_path
        end
      end
    end
  end

end
