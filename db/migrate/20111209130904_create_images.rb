class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :owner
      t.text :description
      t.string :date
      t.string :path

      t.timestamps
    end
  end
end
