class Animal < ApplicationRecord
  validates_presence_of :name, :species, :sex, :birthday
  validate :birthday_valid
  validate :arrival_date_valid
  before_save :confirm_arrival_date

  scope :random, -> { order('RANDOM()').first }
  scope :search, -> (search_term) { where(
    "lower(name) LIKE ? OR lower(description) LIKE ? OR lower(species) LIKE ?",
    "%#{search_term.downcase}%",
    "%#{search_term.downcase}%",
    "%#{search_term.downcase}%"
  ) }
  scope :long_term, -> { where("arrival_date < ?", Date.today - 6.month) }

  def birthday_valid
    if birthday
      unless (birthday < Date.today.next_day)
        errors.add(:birthday, "can't be in the future")
      end
    end
  end

  def arrival_date_valid
    if birthday && arrival_date
      if (arrival_date < birthday)
        errors.add(:arrival_date, "can't be before birthday")
      elsif (arrival_date > Date.today.next_day)
        errors.add(:arrival_date, "can't be in the future")
      end
    end
  end

  def confirm_arrival_date
    self.arrival_date ||= Date.today
  end
end
