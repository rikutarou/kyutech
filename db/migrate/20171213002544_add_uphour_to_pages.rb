class AddUphourToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :uphour, :string, default: '8-20'
  end
end
