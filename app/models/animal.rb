class Animal < ApplicationRecord
  validates_presence_of :name, :species, :gender, :dob
  validate :dob_valid
  validate :arrival_date_valid
  before_save :save_arrival_date

  scope :random, -> { order('RANDOM()').first }
  scope :search, -> (search_term) { where(
    "lower(name) LIKE ? OR lower(description) LIKE ? OR lower(species) LIKE ?",
    "%#{search_term.downcase}%",
    "%#{search_term.downcase}%",
    "%#{search_term.downcase}%"
  ) }
  scope :long_term, -> { where("arrival_date < ?", Date.today - 6.month) }

  def dob_valid
    if dob
      unless (dob < Date.today.next_day)
        errors.add(:dob, "can't be in the future")
      end
    end
  end

  def arrival_date_valid
    if (dob && arrival_date)
      if (arrival_date < dob)
        errors.add(:arrival_date, "Not a valid arrival date")
      elsif (arrival_date > Date.today.next_day)
        errors.add(:arrival_date, "Not a valid arrival date")
      end
    end
  end

  def save_arrival_date
    self.arrival_date ||= Date.today
  end
end
