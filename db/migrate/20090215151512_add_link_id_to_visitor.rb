class AddLinkIdToVisitor < ActiveRecord::Migration
  def self.up
    add_column :visitors, :link_id, :integer
  end

  def self.down
    remove_column :visitors, :link_id
  end
end
