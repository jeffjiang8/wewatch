class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.integer :user_id
      t.integer :episode_id
      t.boolean :watched

      t.timestamps
    end
  end
end
