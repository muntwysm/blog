class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.boolean :mom
      t.references :post
      t.references :user
      t.references :score

      t.timestamps
    end
    add_index :participants, :post_id
    add_index :participants, :user_id
    add_index :participants, :score_id
  end
end
