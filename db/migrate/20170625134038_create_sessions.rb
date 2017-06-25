class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
