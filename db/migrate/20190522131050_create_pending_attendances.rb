# frozen_string_literal: true

class CreatePendingAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :pending_attendances do |t|
      t.string :email
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
