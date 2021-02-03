class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
