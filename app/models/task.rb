class Task < ApplicationRecord
  validates :title,     presence: true
  validates :content,   presence: true
  validates :deadline,  presence: true
  validate  :date_should_be_future

  def date_should_be_future
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "今日より前の日付は入力できません")
    end
  end
end
