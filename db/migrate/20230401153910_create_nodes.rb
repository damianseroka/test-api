# frozen_string_literal: true

class CreateNodes < ActiveRecord::Migration[7.0]
  def change
    create_table :nodes do |t|
      t.integer :parent_id
      t.timestamps
    end

    add_index :nodes, :parent_id
  end
end
