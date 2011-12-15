class ChangeColumnName < ActiveRecord::Migration
  def up
  	 rename_column :images, :owner, :user_id
  end

  def down
  end
end
