require 'rails_helper'

describe ContestantOuting, type: :model do
  describe 'relationships' do
    it {should belong_to :outing}
    it {should belong_to :contestant}
  end
end
