class AddWebsiteToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :url, :string
  end

  def self.down
  end
end
