class AddFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.belongs_to :user
      t.belongs_to :followed_user
      t.index [:user_id, :followed_user_id], unique: true

      t.timestamps null:false
    end

  end
end
