class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def price_avg
    price_total / snack_count
  end

  def price_total
    snacks.sum do |snack|
      snack.price
    end
  end

  def snack_count
    snacks.count
  end
end
