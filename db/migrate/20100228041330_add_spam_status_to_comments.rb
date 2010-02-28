class AddSpamStatusToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :spam_status, :string, :default => "ham"
  end

  def self.down
  end
end
