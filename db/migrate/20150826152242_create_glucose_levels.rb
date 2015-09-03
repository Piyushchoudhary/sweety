class CreateGlucoseLevels < ActiveRecord::Migration
  def change
    create_table :glucose_levels do |t|
      t.integer     :user_id,         null: false
      t.integer     :level,           null: false
      t.date        :registered_date, null: false

      t.timestamps null: false
    end
  end
end
