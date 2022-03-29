class AddAttendeesToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :max_of_attendees, :string
  end
end
