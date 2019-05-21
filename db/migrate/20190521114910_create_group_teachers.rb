# frozen_string_literal: true

class CreateGroupTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_teachers do |t|
      t.references :group, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
