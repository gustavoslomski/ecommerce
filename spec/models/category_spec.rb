require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'when try save a record' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:position) }
  end
end
