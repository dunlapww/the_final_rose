require 'rails_helper'

describe 'As a visitor' do
  describe "When i visit the bachelorette's show page ('/bachelorettes/:id')" do
    before :each do
      @season = Season.create!({description: "Young lady find a hunk"})
      @sara = @season.bachelorettes.create!({name: "Sara"})
      @jeff = @sara.contestants.create!({name: "Jeff", age: 25, hometown: "Boulder"})
      @steve = @sara.contestants.create!({name: "Steve", age: 30, hometown: "New York City"})
      @eric = @sara.contestants.create!({name: "Eric", age: 28, hometown: "Madison"})
    end
    it "I see the bachelorettes Name, season number, description of season" do
      visit "/bachelorettes/#{@sara.id}"
      within("#b-details") do
        expect(page).to have_content(@sara.name)
        expect(page).to have_content(@sara.season.id)
        expect(page).to have_content(@sara.season.description)
      end
    end
    it "i see a link to see the bachelorette's contestants ('/bachelorettes/:bachelorette_id/contestants/')" do
      visit "/bachelorettes/#{@sara.id}"
      click_on "Contestants"
      expect(current_path).to eq("/bachelorettes/#{@sara.id}/contestants")
    end
  end
end
