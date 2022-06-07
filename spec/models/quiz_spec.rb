require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:user) { User.create(name: 'test user', email: 'testuser@yopmail.com', password: 'password') }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:questions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    context 'when name is not unique' do
      before { described_class.create!(name: 'Quiz 1', user_id: user.id) }
      it { expect(subject).to be_invalid }
    end
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:questions)}
  end
end
