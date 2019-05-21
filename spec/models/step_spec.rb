# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :bigint           not null, primary key
#  description   :text
#  teacher_check :boolean          default(FALSE)
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Step, type: :model do
  let(:step) { FactoryBot.build(:step) }

  describe 'Model instantiation' do
    subject(:new_step) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:teacher_check).of_type(:boolean) }
    end
  end

  describe 'Connexion' do
    it { is_expected.to have_many :step_students }
    it { is_expected.to have_many :students }
  end

  context 'when validation is ok' do
    it { expect(build(:step)).to be_valid }
  end
end
