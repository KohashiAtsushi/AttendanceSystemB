class CreateAttendanceLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_logs do |t|
      t.time :attendances_on
      t.time :before_started_at
      t.time :after_started_at
      t.time :before_finished_at
      t.time :after_finished_at
      t.string :user_id
      t.string :superior
      t.time :approval_on

      t.timestamps
    end
    add_index :attendance_logs, :user_id
  end
end
