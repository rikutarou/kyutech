class CreateCaptures < ActiveRecord::Migration[5.1]
  def change
    create_table :captures do |t|
      t.string :imgurl
      t.references :url, foreign_key: true
      t.boolean :star
      t.integer :w
      t.integer :h
      t.integer :zoom

      t.timestamps
    end
  end
end
