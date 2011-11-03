class AddGameDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :game_date, :date
  end
end
