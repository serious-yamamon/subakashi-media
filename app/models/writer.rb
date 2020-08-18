class Writer < ApplicationRecord
  has_many :posts, dependent: :nullify
end
