class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :logo
      t.time :time

      t.timestamps
    end
  end
end
