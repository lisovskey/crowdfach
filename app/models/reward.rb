class Reward < ApplicationRecord
  monetize :price_cents

  belongs_to :project
end
