class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|

      t.timestamps null: false
      t.belongs_to :user
      t.belongs_to :resource
      
    end
  end
end
