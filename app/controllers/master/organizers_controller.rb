class Master::OrganizersController < Master::BaseController
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order_by_school.paginate(page: params[:page], per_page: 15)
    @join_users_count = User.where(status: "join").count
  end

  def create
    schools = params[:school_id]

    schools.length.times do |i|
      names = params[:name][i].split
      names.each do |name|
        Organizer.create(name: name, school_id: schools[i])
      end
    end
    redirect_to master_organizers_path
  end

  def new
    # 중앙 운영진(master)가 새로운 학교별 운영진을 등록하는 페이지로 이동
    # 한명씩 등록하는 것이 아닌 원하는 만큼 등록할 수 있도록 dynamic form을 추가 함?
  end

  def show
  end

  def update
    if @organizer.status != "block"
      @organizer.update(status: "block")
      redirect_to master_organizers_path
    else
      if @organizer.email
        @organizer.update(status: "join")
        redirect_to master_organizers_path
      else
        @organizer.update(status: "ready")
        redirect_to master_organizers_path
      end
    end
  end

  def destroy
    @organizer.destroy
    redirect_to master_organizers_path, success: "삭제에 성공했습니다."
  end

  private
  def set_organizer
    @organizer = Organizer.find(params[:id])
  end


end
