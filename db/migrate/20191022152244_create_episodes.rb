class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.integer :season_id
      t.string :name
      t.string :overview
      t.string :air_date

      t.timestamps null:false
    end
  end
end
