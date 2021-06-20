class ChangeColumnToAttendanceMonthlyReport < ActiveRecord::Migration[5.1]
  def up
    change_column :attendance_monthly_reports, :decision, :integer, null: false, default: 0
  end
  def down
    change_column :attendance_monthly_reports, :decision, :integer, null: true, default: 0
  end
end
