class User < ApplicationRecord
  validates :name, presence: true
  validates :type, inclusion: { in: %w(Users::Coach Users::Student) }, presence: true
end
