require 'rails_helper'

RSpec.describe Snack do
  describe 'relationships' do
    it { should have_many :snack_machines }
    it { should have_many(:machines).through(:snack_machines) }
  end
end
