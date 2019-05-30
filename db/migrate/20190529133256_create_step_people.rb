# frozen_string_literal: true

class CreateStepPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :step_people do |t|
      t.references :step, foreign_key: true
      t.references :attendee, index: true, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
