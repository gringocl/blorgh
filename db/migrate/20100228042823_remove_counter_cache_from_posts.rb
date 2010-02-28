class RemoveCounterCacheFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :comments_count
  end

  def self.down
  end
end
