class ProjectsController < ApplicationController
  before_action :logged_in_user

   def new
	  @project = Project.new
	  strnow = "KLIC"+ Time.now.strftime('%Y')+Time.now.strftime('%M')
	  if Project.find(:code,include?strnow)
		  @last = Project.last
		  str = @last.code
		  str1 = str[0,9]
		  str2 = str[11,13]
		  @m = str1.to_i

		  @s = str2.to_i
		  @s = @s + 1
	  else
		  @s = 0
	  end
   end
   
   def index
    @projects = Project.paginate(page: params[:page])
  end
  
  def create
    @project = Project.new(project_params)
	if @project.save
      flash[:success] = "项目新建成功!"
      redirect_to projects_url
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end   
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "项目已修改！"
      redirect_to projects_url
    else
      render 'edit'
    end
  end
 
  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "删除成功！"
    redirect_to projects_url
  end
 
 
  private

    def project_params
      params.require(:project).permit(:name, :code, :ProjectType_id,
                                   :user_id,:ProjectStatus_id,:start_time,:end_time)
    end
	
    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "请登录."
        redirect_to login_url
      end
    end
	
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
