class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
      t.text :user_agent
      t.integer :clicks
      t.string :remote_addr

      t.timestamps
    end
  end

  def self.down
    drop_table :visitors
  end
end
