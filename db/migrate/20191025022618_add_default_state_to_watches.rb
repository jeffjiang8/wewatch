class AddDefaultStateToWatches < ActiveRecord::Migration[6.0]
  def change
    remove_column :watches, :watched
    add_column :watches, :watched, :boolean, default: false
  end
end
