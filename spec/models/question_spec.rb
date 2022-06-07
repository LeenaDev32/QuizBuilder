require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { User.create(name: 'test user', email: 'testuser@yopmail.com', password: 'password') }
  let(:quiz) { Quiz.create(name: 'Quiz new', user_id: user.id) }

  describe 'associations' do
    it { should belong_to(:quiz) }
    it { should have_many(:answers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:question_type) }

    context 'when title is not unique' do
      before { described_class.create!(title: 'How tall are you?', question_type: Question::INPUT_TYPES[0], quiz_id: quiz.id) }
      it { expect(subject).to be_invalid }
    end

    it do
      should validate_inclusion_of(:question_type).
        in_array(Question::INPUT_TYPES)
    end
  end
end
