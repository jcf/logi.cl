class CreateLinksVisitors < ActiveRecord::Migration
  def self.up
    create_table :links_visitors, :force => true do |t|
      t.integer :link_id
      t.integer :visitor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :links_visitors
  end
end
