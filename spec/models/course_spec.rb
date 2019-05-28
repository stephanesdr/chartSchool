# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  description :text
#  end_time    :datetime
#  resource    :text
#  start_time  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :bigint
#
# Indexes
#
#  index_courses_on_teacher_id  (teacher_id)
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:course) { FactoryBot.build(:course) }

  describe 'Model instantiation' do
    subject(:new_course) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:resource).of_type(:text) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:start_time).of_type(:datetime) }
      it { is_expected.to have_db_column(:end_time).of_type(:datetime) }
    end
  end

  describe 'Connexion' do
    it { is_expected.to have_many :attendances }
  end
  #
  # context 'when validation is ok' do
  #   it { expect(build(:course)).to be_valid }
  # end
end
