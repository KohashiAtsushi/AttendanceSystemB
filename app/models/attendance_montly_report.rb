class AttendanceMontlyReport < ApplicationRecord
	# 上長に対応する、一ヶ月の勤怠の承認データを取得する
  def self.applying_montly_reports(superior_id)
    where(superior_id: superior_id).order()
  end
end
