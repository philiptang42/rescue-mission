class User < ActiveRecord::Base
  has_many :answers
  has_many :questions

  validates :name, presence: true
end
