# frozen_string_literal: true

# == Schema Information
#
# Table name: step_templates
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  template_id :bigint
#
# Indexes
#
#  index_step_templates_on_template_id  (template_id)
#
# Foreign Keys
#
#  fk_rails_...  (template_id => templates.id)
#

require 'rails_helper'

RSpec.describe StepTemplate, type: :model do
  let(:step_template) { FactoryBot.build(:step_template) }

  describe 'Model instantiation' do
    subject(:new_step_template) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
    end
  end

  context "when Model is associated" do
    describe "Step" do
      it { expect(step_template).to belong_to(:template) }
    end
  end

  context 'when validation is ok' do
    it { expect(build(:step_template)).to be_valid }
  end

  context 'when title is missing' do
    let(:step_template) { build(:step, title: nil) }

    it { expect(step_template).not_to be_valid }
  end
end
