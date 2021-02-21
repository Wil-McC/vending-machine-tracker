require 'rails_helper'

RSpec.describe 'the machine show page' do
  before :each do
    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @pop   = @dons.snacks.create!(name: 'Zoom Pop', price: 2.15)
    @zim   = @dons.snacks.create!(name: 'Zim Gum', price: 1.35)
  end
  it 'shows associated snacks with price' do
    visit "/machines/#{@dons.id}"

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content('Zoom Pop: $2.15')
    expect(page).to have_content('Zim Gum: $1.35')
  end
  it 'shows average price of stocked snacks' do
    visit "/machines/#{@dons.id}"

    expect(page).to have_content('Average Price: $1.75')
  end
end
