class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  after_initialize do
    build_profile if new_record? && profile.blank?
  end

  delegate :name, to: :profile, allow_nil: true
end
