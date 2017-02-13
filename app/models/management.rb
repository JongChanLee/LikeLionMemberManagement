class Management < ApplicationRecord
  belongs_to :member, counter_cache: true
  belongs_to :user
end
