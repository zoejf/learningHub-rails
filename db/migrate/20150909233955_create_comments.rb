class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body

      t.belongs_to :resource 
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
