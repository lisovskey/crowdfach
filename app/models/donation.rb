class Donation < ApplicationRecord
  has_bitcoin_payments

  belongs_to :project
  
  validates_presence_of :amount, :project_id  
  validates :amount, numericality: { greater_than: 0.0001, less_than: 10000 }

  after_create :create_payment

  def to_param
    self.bitcoin_payments.first.address
  end

  protected
    def create_payment
      self.bitcoin_payments.create!(reason: 'donation', price: self.amount)
    end

    def bitcoin_payment_paid
      self.update(status: 'received')
    end
end
