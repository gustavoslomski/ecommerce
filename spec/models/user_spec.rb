require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when try save a record' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }

    it 'must grants uniq emails' do
      user1 = create(:user)
      user2 = build(:user, email: user1.email)

      user2.valid?

      expect(user2.errors.messages[:email]).not_to be_blank
    end
  end
end
