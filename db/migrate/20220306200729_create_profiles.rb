class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :bio
      t.string :profile_pic
      t.string :display_name
      t.integer :user_id

      t.timestamps
    end
  end
end
