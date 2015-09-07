class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :website
      t.text :description
      t.string :image
      t.string :price

      t.timestamps null: false
    end
  end
end
