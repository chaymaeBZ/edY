class CreateCoursesSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_sessions do |t|
      t.references :course, foreign_key: true
      t.references :session, foreign_key: true
    end
  end
end
