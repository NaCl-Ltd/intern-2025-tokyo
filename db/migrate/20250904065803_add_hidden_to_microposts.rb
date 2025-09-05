class AddHiddenToMicroposts < ActiveRecord::Migration[8.0]
  def change
    add_column :microposts, :hidden, :boolean
  end
end
