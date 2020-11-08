require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the bachelorette contestants index page' do
    before :each do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @sally = @season.bachelorettes.create!({name: "sally"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "New York City"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
      @pete = @sally.contestants.create!({name: "Pete", age: 28, hometown: "Madison"})
    end
    it 'I see all the contestants details' do

      visit "/bachelorettes/#{@sara.id}/contestants"

      within "#contestant-#{@jeff.id}" do
        expect(page).to have_content(@jeff.name)
      end
      within "#contestant-#{@steve.id}" do
        expect(page).to have_content(@steve.name)
      end
      within "#contestant-#{@eric.id}" do
        expect(page).to have_content(@eric.name)
      end

      expect(page).to_not have_content(@pete.name)
    end
  end
end
