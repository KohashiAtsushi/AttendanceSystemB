class BasePointsController < ApplicationController	
  before_action :set_current_user
  before_action :set_base_point, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]


	def index
    @base_points = BasePoint.all
  end

  def new
    @base_point = BasePoint.new
  end

  def create
    @base_point = BasePoint.new(base_point_params)
    if @base_point.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to base_points_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @base_point.update_attributes(base_point_params)
      flash[:success] = '拠点登録完了しました'
      redirect_to base_points_url
    else
      render :edit      
    end
  end

  def destroy
    flash[:success] = @base_point.point_name + 'のデータを削除しました。'
    @base_point.destroy
    redirect_to base_points_url
  end

  private

    def set_current_user
      @user = current_user
    end

    def set_base_point
      @base_point = BasePoint.find(params[:id])
    end

    def base_point_params
      params.require(:base_point).permit(:point_name, :point_number, :point_type)
    end

end
