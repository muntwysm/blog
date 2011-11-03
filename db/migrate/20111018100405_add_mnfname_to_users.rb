class AddMnfnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mnfname, :string
  end
end
