require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the bachelorette contestants index page' do
    before :each do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @sally = @season.bachelorettes.create!({name: "Sally"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "Raleigh"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
      @pete = @sally.contestants.create!({name: "Pete", age: 28, hometown: "Madison"})
    end
    it 'I see all the contestants details' do

      visit "/bachelorettes/#{@sara.id}/contestants"

      within "#contestant-#{@jeff.id}" do
        expect(page).to have_link(@jeff.name)
        expect(page).to have_content(@jeff.age)
        expect(page).to have_content(@jeff.hometown)
      end
      within "#contestant-#{@steve.id}" do
        expect(page).to have_link(@steve.name)
        expect(page).to have_content(@steve.age)
        expect(page).to have_content(@steve.hometown)
      end
      within "#contestant-#{@eric.id}" do
        expect(page).to have_link(@eric.name)
        expect(page).to have_content(@eric.age)
        expect(page).to have_content(@eric.hometown)
      end

      expect(page).to_not have_content(@pete.name)
    end
    it "when I click on a contestants name, I'm directed to their show page" do
      visit "/bachelorettes/#{@sara.id}/contestants"
      click_on "Jeff"
      expect(current_path).to eq("/contestants/#{@jeff.id}")
    end
    it "I see a unique list of contestants hometowns" do
      visit "/bachelorettes/#{@sara.id}/contestants"
      expect(page).to have_content("These contestants are from: Boulder, Raleigh, Madison#")
    end
  end
end
