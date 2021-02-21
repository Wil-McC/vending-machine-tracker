require 'rails_helper'

RSpec.describe 'the snack show page' do
  before :each do
    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @beep  = @owner.machines.create!(location: "The Beep Shack")

    @pop = Snack.create!(name: 'Zoom Pop', price: 2.15)
    @zim = Snack.create!(name: 'Zim Gum', price: 1.35)

    @dons.snacks << @pop
    @dons.snacks << @zim

    @beep.snacks << @pop
  end
  it 'shows name and price information' do
    visit "/snacks/#{@pop.id}"

    expect(page).to have_content('Zoom Pop')
    expect(page).to have_content('Price: $2.15')
  end
  it 'shows location information' do
    visit "/snacks/#{@pop.id}"

    within('.location-info') do
      expect(page).to have_content("Don's Mixed Drinks (2 kinds of snacks, average price of $1.75)")
      expect(page).to have_content("The Beep Shack (1 kinds of snacks, average price of $2.15)")
    end
  end
end
