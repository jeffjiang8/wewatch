class AddEpisodeNumber < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :episode_number, :integer
  end
end
