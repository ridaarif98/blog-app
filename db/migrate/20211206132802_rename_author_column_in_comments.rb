class RenameAuthorColumnInComments < ActiveRecord::Migration[6.1]
    def change
      rename_column :comments, :author_id, :user_id
    end
end
