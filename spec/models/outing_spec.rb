require 'rails_helper'

describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe 'instance methods' do
    it '#num_of_contestants' do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @sally = @season.bachelorettes.create!({name: "Sally"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "New York City"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
      @pete = @sally.contestants.create!({name: "Pete", age: 28, hometown: "Madison"})

      @outing1 = @jeff.outings.create({description: "Helicopter Ride", location: "the sky", date: Time.zone.now.to_date})
      @outing2 = @jeff.outings.create({description: "Rollercoaster Ride", location: "amusement park", date: Time.zone.now.to_date})
      ContestantOuting.create(contestant_id: @steve.id, outing_id: @outing2.id)
      
      expect(@outing1.num_of_contestants).to eq(1)
      expect(@outing2.num_of_contestants).to eq(2)
    end
  end
end
