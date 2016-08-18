class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :given_name
      t.string :surname
      t.string :email
      t.string :location
      t.string :region
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
