class Member < ApplicationRecord
  belongs_to :school, counter_cache: true
  has_many :managements
end
