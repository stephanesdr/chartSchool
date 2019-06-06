# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_people_on_email                 (email) UNIQUE
#  index_people_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'Model instantiation' do
    subject(:new_person) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
      it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
    end
  end

  context 'when validation is ok' do
    it { expect(build(:person)).to be_valid }
  end

  context 'when name is missing' do
    let(:person) { build(:person, email: "paul@email.com", password: "azerty") }

    it { expect(person).not_to be_valid }
  end

  context 'when email is missing' do
    let(:person) { build(:person, name: "Paul", password: "azerty") }

    it { expect(person).not_to be_valid }
  end
end
