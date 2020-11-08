require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a contestants show page' do
    before :each do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @sally = @season.bachelorettes.create!({name: "Sally"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "New York City"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
      @pete = @sally.contestants.create!({name: "Pete", age: 28, hometown: "Madison"})

      @outing1 = 
    end

    it 'i see the contestants name, season, and season description' do
      visit "/contestants/#{@jeff.id}"
      expect(page).to have_content(@jeff.name)
      expect(page).to have_content(@jeff.bachelorette.season.id)
      expect(page).to have_content(@jeff.bachelorette.season.description)
    end

    it 'i see a list of the contestants outings' do
      visit "/contestants/#{@jeff.id}"

    end
    it "when I click on an outing, i'm directed to the outings show page"
  end
end
