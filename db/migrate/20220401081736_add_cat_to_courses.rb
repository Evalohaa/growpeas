class AddCatToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :cat, :string
  end
end
