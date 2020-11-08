class Bachelorette <ApplicationRecord
  has_many :contestants
  belongs_to :season  

  def avg_contestant_age
    contestants.average(:age)
  end
end
