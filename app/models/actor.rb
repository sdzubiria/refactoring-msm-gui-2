# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  validates(:name, presence: true)

  has_many(:characters)
  has_many(:movies, through: :characters, source: :movie)

  has_many :filmography, through: :characters, source: :movie

  def filmography
    self.movies
  end
end
