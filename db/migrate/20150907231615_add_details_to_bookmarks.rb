class AddDetailsToBookmarks < ActiveRecord::Migration
  def change
    change_table :bookmarks do |t|
      #define foreign keys for associated models
      t.belongs_to :user
      t.belongs_to :resource
    end
  end
end
