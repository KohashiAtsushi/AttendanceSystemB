class AddNameToAttendanceMonthlyReports < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_monthly_reports, :user_name, :string
  end
end
