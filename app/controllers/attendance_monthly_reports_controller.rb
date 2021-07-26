class AttendanceMonthlyReportsController < ApplicationController
  before_action :set_report, only: :update

  def create
    if AttendanceMonthlyReport.new(**report_params, decision: 1).save
      debugger
      flash[:success] = '送信しました。'
      redirect_to user_url(id: params[:user_id], date: report_params[:month])
    else
      # render :new
    end
  end
  
	def update
    if @report.update_attributes(decision: 1)
      flash[:success] = '送信しました。'
      redirect_to user_url(id: params[:user_id], date: Date.current.beginning_of_month)
    else
      # render :new
    end
	end

  def update_all
    approval_report_params.each do |i, item|
      if !item[:change_flag].nil? && item[:change_flag]
        report = AttendanceMonthlyReport.find(i)
        report.update_attributes(decision: $decision_word.index(item[:decision]))
      end
    end
    redirect_to user_url(id: params[:id], date: Date.current.beginning_of_month)
	end


  def set_report
    @report = AttendanceMonthlyReport.where(user_id: params[:user_id], month: report_params[:month]).first
  end

	private
	
		def report_params
      # モデルを渡してるから階層構造になっているため.require(:attendance_mounthly_report)を仲介させる
      # .mergeによりuser_idを紐つける
      params.require(:attendance_monthly_report).permit(:month, :superior_id, :user_name).merge(user_id: params[:user_id])
		end

    def approval_report_params
      # モデルを渡してるから階層構造になっているため.require(:attendance_mounthly_report)を仲介させる
      # .mergeによりuser_idを紐つける
      # params.require(:user).permit(attendances: [:started_at, :finished_at, :note])[:attendances]
      params.require(:user).permit(approvals: [:decision, :change_flag])[:approvals]
		end
end