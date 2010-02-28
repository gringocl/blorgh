class AddUrlToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :url, :string
  end

  def self.down
  end
end
