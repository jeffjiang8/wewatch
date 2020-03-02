class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.integer :show_id
      t.string :name
      t.integer :episode_count
      t.string :overview

      t.timestamps
    end
  end
end
