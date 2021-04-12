class CreateBasePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :base_points do |t|
      t.string :point_name
      t.string :point_number
      t.string :point_type

      t.timestamps
    end
  end
end
