class CreateSessionsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions_users do |t|
      t.references :user, foreign_key: true
      t.references :session, foreign_key: true
    end
  end
end
