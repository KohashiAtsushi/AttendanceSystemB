class AttendanceMonthlyReport < ApplicationRecord
  belongs_to :user
  validates :month, presence: true
  validates :superior_id, presence: true

  # 該当月の申請レコードを取得する
  def self.get_monthly_report(user_id, month)
    return this_monthly_report = where(user_id: user_id, month: month).first.nil? ?
    AttendanceMonthlyReport.new() :  where(user_id: user_id, month: month).first
  end
  
	# 上長に対応する、一ヶ月の勤怠の承認データを取得する
  def self.applying_monthly_reports(superior_id)
    where(superior_id: superior_id).order()
  end

	# ユーザーごとに承認データを配列で取得する
  def self.get_approvals(superior_id)
    grouping_user_approvals = Array.new
    approvals = where(superior_id: superior_id, decision: 1).order(user_id: :asc, month: :asc)
    approvals.group("user_id").count.each do |user_id, count|
      grouping_user_approvals.push(approvals.where(user_id: user_id))
    end
    return grouping_user_approvals
  end
end