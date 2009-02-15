class CreateSlugs < ActiveRecord::Migration
  def self.up
    create_table :slugs do |t|
      t.string :text
      t.integer :link_id

      t.timestamps
    end
  end

  def self.down
    drop_table :slugs
  end
end
