class AddPageToUrls < ActiveRecord::Migration[5.1]
  def change
    add_reference :urls, :page, foreign_key: true
  end
end
