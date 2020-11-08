require 'rails_helper'

describe Season, type: :model do
  describe 'relationships' do
    it {should have_many :bachelorettes}
  end
end
