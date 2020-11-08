class Bachelorette <ApplicationRecord
  has_many :contestants
  belongs_to :season  
end
