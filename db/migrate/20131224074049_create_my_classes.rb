class CreateMyClasses < ActiveRecord::Migration
  def self.up
    create_table :my_classes do |t|
      t.string :name
      t.integer :size

      t.timestamps
    end
  end

  def self.down
    drop_table :my_classes
  end
end
