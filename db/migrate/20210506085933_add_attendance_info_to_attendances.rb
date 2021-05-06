class AddAttendanceInfoToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_at, :time
    add_column :attendances, :description, :string
    add_column :attendances, :superior_sign, :string
  end
end
