class AddCommentableToComments < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    # add_index :comments, [:commentable_id, :commentable_type]
    # ideally, loop through all post ids and stick them into
    # commentable_id, type: 'post'
    remove_column :comments, :post_id
  end

  def down
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
    # remove_index :comments, [:commentable_id, :commentable_type]
    # ideally change all post type comments back to post_id's
    add_column :comments, :post_id, :integer
  end
end
