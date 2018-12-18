class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :google_token, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  has_many  :parkings

end
