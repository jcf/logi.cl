class AddSlugToLink < ActiveRecord::Migration
  def self.up
    add_column :links, :slug, :string
  end

  def self.down
    remove_column :links, :slug
  end
end
