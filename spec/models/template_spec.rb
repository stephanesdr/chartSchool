# frozen_string_literal: true

# == Schema Information
#
# Table name: templates
#
#  id          :bigint           not null, primary key
#  description :text
#  resource    :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  person_id   :bigint
#
# Indexes
#
#  index_templates_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#

require 'rails_helper'

RSpec.describe Template, type: :model do
  let(:template) { FactoryBot.build(:template) }

  describe 'Model instantiation' do
    subject(:new_template) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:resource).of_type(:text) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
    end
  end

  describe 'Connexion' do
    it { is_expected.to belong_to :person }
  end
end
