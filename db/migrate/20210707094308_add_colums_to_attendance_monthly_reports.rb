class AddColumsToAttendanceMonthlyReports < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_monthly_reports, :change_flag, :boolean, default: false, null: false
  end
end
