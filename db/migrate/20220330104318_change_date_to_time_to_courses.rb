class ChangeDateToTimeToCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :starting_time
    add_column :courses, :starting_time, :time
  end
end
