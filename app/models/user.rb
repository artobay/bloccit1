class User < ApplicationRecord
  has_many :wikis 
  has_many :amounts
  has_many :collaborators, dependent: :destroy
  has_many :collaborations, through: :collaborators, source: :wiki
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


after_initialize :init

  def init
   self.role ||= :standard
  end

enum role: [:standard, :premium, :admin]
end
