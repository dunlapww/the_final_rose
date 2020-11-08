class Bachelorette <ApplicationRecord
  has_many :contestants
  belongs_to :season  

  def avg_contestant_age
    contestants.average(:age)
  end

  def contestant_hometowns
    contestants.select(:hometown).distinct.pluck(:hometown)
  end

end
