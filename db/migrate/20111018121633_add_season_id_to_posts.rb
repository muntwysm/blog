class AddSeasonIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :season_id, :integer
  end
end
