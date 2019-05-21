# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.boolean :teacher_check, default: false

      t.timestamps
    end
  end
end
