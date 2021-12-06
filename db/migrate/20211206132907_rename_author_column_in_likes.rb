class RenameAuthorColumnInLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :author_id, :user_id 
  end
end
