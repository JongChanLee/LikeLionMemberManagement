class Master::SchoolsController < Master::BaseController
  def index
    @schools = School.order(:name).all.paginate(page: params[:page], per_page: 15)
  end

  def new
  end

  def create
    count = 0;
    fails = Array.new
    schools = params[:schools].split
    schools.each do |school|
      s = School.new(name: school)
      if s.save
        count = count + 1
      else
        fails.push(school)
      end
    end
    if count == schools.length
      redirect_to master_schools_path, success: "모든 학교를 등록하는데 성공했습니다."
    elsif count == 0
      redirect_to master_schools_path, error: "모든 학교를 등록하지 못했습니다."
    else
      redirect_to master_schools_path, success: "총 #{schools.length - count}의 학교는 등록에 실패했습니다.#{"<br>".html_safe} #{fails.each {|f| f}}"
    end
  end

  def show
    @school = School.find(params[:id])
  end

end
