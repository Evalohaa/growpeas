class ChangerStartingTime < ActiveRecord::Migration[6.1]
  def change
    change_column :courses, :starting_time, :time
  end
end
