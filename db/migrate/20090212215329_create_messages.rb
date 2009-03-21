class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|

      t.string :name
      t.string :email
      t.string :website
      t.text :body
      t.string :remote_address

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
