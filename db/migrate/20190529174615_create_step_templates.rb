# frozen_string_literal: true

class CreateStepTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :step_templates do |t|
      t.string :title
      t.text :description
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
