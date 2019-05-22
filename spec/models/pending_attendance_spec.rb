# frozen_string_literal: true

# == Schema Information
#
# Table name: pending_attendances
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#
# Indexes
#
#  index_pending_attendances_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

require 'rails_helper'

RSpec.describe PendingAttendance, type: :model do
  let(:pending_attendance) { FactoryBot.build(:pending_attendance) }

  describe 'Model instantiation' do
    subject(:new_pending_attendance) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:email).of_type(:string) }
    end
  end

  describe 'Connexion' do
    it { is_expected.to belong_to :course }
  end

  context 'when validation is ok' do
    it { expect(build(:pending_attendance)).to be_valid }
  end
end
