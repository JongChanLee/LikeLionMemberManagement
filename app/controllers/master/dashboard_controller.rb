class Master::DashboardController < Master::BaseController

  def index
    @schools_organizers = School.find(current_user.school_id).users
    @schools_count = School.count
    @users_count = User.count
    @join_users_count = User.where(status: "join").count
    @members_count = Member.count
    @notices_count = Notice.count
    @managements_count = Management.count
  end

end
