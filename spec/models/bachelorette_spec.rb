require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
    it {should belong_to :season}
  end

  describe 'instance methods' do
    it '#avg_contestant_age' do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "New York City"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
  
      expect(@sara.avg_contestant_age.round(0)).to eq(28)
    end

    it "hometowns" do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @larry = @sara.contestants.create!({name: "Larry", age: 30, hometown: "Raleigh"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "Raleigh"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})

      expect(@sara.contestant_hometowns).to eq(%w(Boulder Madison Raleigh))
    end
  end
end
