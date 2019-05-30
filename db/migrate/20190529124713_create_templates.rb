# frozen_string_literal: true

class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :title
      t.text :resource
      t.text :description
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
