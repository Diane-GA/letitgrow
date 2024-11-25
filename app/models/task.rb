class Task < ApplicationRecord
  belongs_to :culture
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :order, presence: true

  CATEGORY = []
  TASK_STATUS = ["A faire", "En cours", "Valider"]
end
