class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :password_digest
      t.string :phone_number

      t.timestamps
    end
  end
end
