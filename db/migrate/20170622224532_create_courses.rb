class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :content
      t.decimal :price

      t.timestamps
    end
  end
end
