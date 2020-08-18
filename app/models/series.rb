class Series < ApplicationRecord
  has_many :posts, dependent: :nullify
end
