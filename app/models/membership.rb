class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, uniqueness: { scope: :gym_id, message: "Can only signup once for this gym"}
  validates :charge, numericality: { only_integer: true }
end
