class CreateGlasses < ActiveRecord::Migration
  def self.up
    create_table :glasses do |t|
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :glasses
  end
end
