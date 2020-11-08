require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @season = Season.create!({description: "Young lady find a hunk"})
    @sara = @season.bachelorettes.create!({name: "Sara"})
    @sally = @season.bachelorettes.create!({name: "Sally"})
    @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
    @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "New York City"})
    @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
    @pete = @sally.contestants.create!({name: "Pete", age: 28, hometown: "Madison"})

    @outing1 = @jeff.outings.create({description: "Helicopter Ride", location: "the sky", date: Time.zone.now.to_date})
    @outing2 = @jeff.outings.create({description: "Rollercoaster Ride", location: "amusement park", date: Time.zone.now.to_date})
    @outing3 = @steve.outings.create({description: "Walk on Beach", location: "ocean", date: Time.zone.now.to_date})
  end
  
  describe 'When I visit an outings show page' do
    it 'shows the outings name, location, and date' do
      visit "/outings/#{@outing1.id}"
      expect(page).to have_content(@outing1.description)
      expect(page).to have_content(@outing1.location)
      expect(page).to have_content(@outing1.date)
    end
    it 'shows the total num of contestants on the outing' do
      visit "/outings/#{@outing1.id}"
      expect(page).to have_content("Num of Contestants: #{@outing1.num_of_contestants}")
    end
    it 'show a list of all the contestant names on the outing'
  end
end
