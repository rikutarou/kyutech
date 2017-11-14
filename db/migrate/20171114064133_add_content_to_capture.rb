class AddContentToCapture < ActiveRecord::Migration[5.0]
  def change
    add_column :captures, :imgurl, :string
  end
end
