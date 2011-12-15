class ChangeColumnType < ActiveRecord::Migration
  def up
  	change_column :images, :user_id, :integer
  end

  def down
  end
end
