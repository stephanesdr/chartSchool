# frozen_string_literal: true

class CreateGroupPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :group_people do |t|
      t.references :group, foreign_key: true
      t.references :attendee, index: true, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
