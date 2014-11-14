class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :username
      t.string :password
      t.boolean :default
      t.timestamps
    end
  end
end
