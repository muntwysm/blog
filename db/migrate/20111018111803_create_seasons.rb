class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
