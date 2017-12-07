class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :name
      t.string :url
      t.integer :x
      t.integer :y
      t.integer :w
      t.integer :h
      t.integer :px
      t.integer :py
      t.integer :pw
      t.integer :ph
      t.integer :zoom
      t.boolean :autoup
      t.time :captime
      t.integer :hour
      t.integer :minute
      t.boolean :visible
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
