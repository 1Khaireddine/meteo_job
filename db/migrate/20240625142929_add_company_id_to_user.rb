class AddCompanyIdToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :company, null: true, foreign_key: true, type: :uuid
  end
end
