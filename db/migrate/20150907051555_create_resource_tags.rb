class CreateResourceTags < ActiveRecord::Migration
  def change
    create_table :resource_tags do |t|

      t.timestamps null: false

      #define foreign keys for associated models
      t.belongs_to :resource 
      t.belongs_to :tag 
    end
  end
end
