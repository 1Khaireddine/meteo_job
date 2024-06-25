class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers, id: :uuid do |t|
      t.string :title
      t.text :description
      t.date :expired_date
      t.date :limit_date
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :admin, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
