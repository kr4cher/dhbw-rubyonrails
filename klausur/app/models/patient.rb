class Patient < ApplicationRecord
  belongs_to :doctor
  has_many :infections
  has_one :laboratory, :through => :doctor

  validates_presence_of :name
  validates_presence_of :email
end
