class AttendanceMonthlyReportsController < ApplicationController
  before_action :set_report, only: :update

  def create
    if AttendanceMonthlyReport.new(**report_params, decision: "1").save
      flash[:success] = '送信しました。'
      redirect_to user_url(id: params[:user_id], date: report_params[:month])
    else
      # render :new
    end
  end
  
	def update
    if @report.update_all(**report_params, decision: "2")
      flash[:success] = '送信しました。'
      redirect_to user_url(id: params[:user_id], date: report_params[:month])
    else
      # render :new
    end
	end

  def update_all
    
	end


  def set_report
    @report = AttendanceMonthlyReport.where(user_id: params[:id], month: report_params[:month])
  end

	private
	
		def report_params
      # モデルを渡してるから階層構造になっているため.require(:attendance_mounthly_report)を仲介させる
      # .mergeによりuser_idを紐つける
      params.require(:attendance_monthly_report).permit(:month, :superior_id, :user_name).merge(user_id: params[:user_id])
		end
end