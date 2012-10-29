class FoodJournal < ActiveRecord::Base
  belongs_to :school_info
  belongs_to :user

  validates_numericality_of :week_num, :fruit, :vegetable, :sugary_drink, :water
  validates :student_name, :presence => true
end
