class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.integer :user_id
      t.integer :show_id
      t.string :status, default: "Not Watching"

      t.timestamps
    end
  end
end
