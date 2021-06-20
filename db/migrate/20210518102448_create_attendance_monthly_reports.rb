class CreateAttendanceMonthlyReports < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_monthly_reports do |t|
      t.integer :user_id
      t.date :month
      t.integer :decision
      t.integer :superior_id

      t.timestamps
    end
  end
end
