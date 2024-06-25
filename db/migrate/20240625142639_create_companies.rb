class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.string :subdomain
      t.string :website

      t.timestamps
    end
  end
end
