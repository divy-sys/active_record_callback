class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 100}

  # before validation method
  before_validation :set_title 

  private 

  def set_title 
    self.title = "Title created"
  end

  before_save :update_book 
  # Before save method 
  def update_book 
    self.name.upcase!

  end


end
