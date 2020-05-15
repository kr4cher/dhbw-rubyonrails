class Doctor < ApplicationRecord
  belongs_to :laboratory
  has_many :patients

  validates :laboratory, presence: {message: 'Laboratory must exist'}
  validates :name, format: {with: /.*[ ].*/, message: 'does not contain a space'}
end
