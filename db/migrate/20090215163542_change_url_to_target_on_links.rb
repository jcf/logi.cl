class ChangeUrlToTargetOnLinks < ActiveRecord::Migration
  def self.up
    rename_column :links, :url, :target
  end

  def self.down
    rename_column :links, :target, :url
  end
end
