require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe 'relationships' do
    it { should have_many :snack_machines }
    it { should have_many(:snacks).through(:snack_machines)}
  end
  describe 'instance methods' do
    before :each do
      @owner = Owner.create!(name: "Sam's Snacks")
      @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
      @pop   = @dons.snacks.create!(name: 'Zoom Pop', price: 2.15)
      @zim   = @dons.snacks.create!(name: 'Zim Gum', price: 1.35)
    end
    describe '#price_avg' do
      it 'returns average price' do
        expect(@dons.price_avg).to eq(1.75)
      end
    end
    describe '#snack_count' do
      it 'returns count of stocked snack types' do
        expect(@dons.snack_count).to eq(2)
      end
    end
  end
end
