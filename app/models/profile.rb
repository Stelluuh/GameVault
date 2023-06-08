class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, numericality: { only_integer: true }
  validates :bio, length: { maximum: 250 }

end
