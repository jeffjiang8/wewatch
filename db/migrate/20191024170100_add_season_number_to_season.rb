class AddSeasonNumberToSeason < ActiveRecord::Migration[6.0]
  def change
    add_column :seasons, :season_number, :integer
    add_column :seasons, :has_episodes_loaded, :boolean, default: false
  end
end
