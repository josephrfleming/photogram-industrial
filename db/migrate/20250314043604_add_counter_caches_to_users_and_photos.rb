class AddCounterCachesToUsersAndPhotos < ActiveRecord::Migration[7.0]
  def change
    # The following lines are commented out because the columns already exist:
    # add_column :users, :comments_count, :integer, default: 0
    # add_column :users, :likes_count,    :integer, default: 0
    # add_column :photos, :comments_count, :integer, default: 0
    # add_column :photos, :likes_count,    :integer, default: 0
  end
end
