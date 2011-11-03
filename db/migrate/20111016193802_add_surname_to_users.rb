class AddSurnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :img, :string
    add_column :users, :active, :boolean
  end
end
