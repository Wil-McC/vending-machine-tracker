require 'rails_helper'

RSpec.describe SnackMachine do
  describe 'relationships' do
    it { should belong_to :snack }
    it { should belong_to :machine }
  end
end
