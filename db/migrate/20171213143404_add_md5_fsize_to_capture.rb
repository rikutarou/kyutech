class AddMd5FsizeToCapture < ActiveRecord::Migration[5.1]
  def change
    add_column :captures, :md5, :string
    add_column :captures, :fsize, :integer
  end
end
