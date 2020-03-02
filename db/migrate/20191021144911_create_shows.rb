class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :overview
      t.integer :num_of_seasons
      t.string :poster_path
      t.integer :vote_avg

      t.timestamps
    end
  end
end
