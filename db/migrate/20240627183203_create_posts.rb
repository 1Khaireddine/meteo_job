class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :offer, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
