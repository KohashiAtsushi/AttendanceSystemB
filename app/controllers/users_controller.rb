class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :admin_or_correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info, :index]
  before_action :set_one_month, only: :show

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def import
    User.import(params[:file])
    flash[:success] = 'ユーザー情報を追加しました。'
    redirect_to action: :index
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザー情報を更新しました。'
      redirect_to @user
    else
      render :edit      
    end
  end

  def index_to_update
    user = User.find(params[:user_id])
    if user.update_attributes(user_params)
      flash[:success] = 'ユーザー情報を更新しました。'
      redirect_to action: :index
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'データを削除しました。'
    redirect_to users_url
  end
  
  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = '#{@user.name}の基本情報を更新しました。'
    else
      flash[:danger] = '#{@user.name}の更新は失敗しました。<br>' + @user.errors.full_messages.join('<br>')
    end
    redirect_to users_url
  end

  def index_working
    @users = Array.new
    User.all.each do |user|
      if Attendance.working_now?(user.id)
        @users.push(user)
      end
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :affiliation, :employee_number, :uid, :password, :password_confirmation,
                                   :basic_work_time ,:designated_work_start_time, :designated_work_end_time)
    end
    
    def basic_info_params
      params.require(:user).permit(:affiliation, :basic_work_time, :work_time)
    end
    
end