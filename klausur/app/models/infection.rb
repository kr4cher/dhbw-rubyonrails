class Infection < ApplicationRecord
  belongs_to :patient

  validates_presence_of :name
end
