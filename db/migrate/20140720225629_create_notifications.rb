class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :friend

      t.timestamps
    end
  end
end
