class AddPublishedDateToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :published_at, :date
  end

  def self.down
  end
end
