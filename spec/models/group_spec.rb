# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.build(:group) }

  describe 'Model instantiation' do
    subject(:new_group) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end
  end

  describe 'Connexion' do
    it { is_expected.to have_many :group_students }
    it { is_expected.to have_many :students }
  end

  context 'when validation is ok' do
    it { expect(build(:group)).to be_valid }
  end
end
