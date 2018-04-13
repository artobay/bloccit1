class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators
  scope :visible_to, -> (user) { user ? where(private: false) : 'There was an error.' }

end


