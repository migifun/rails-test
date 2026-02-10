class Reception < ApplicationRecord
  PURPOSES = %w[meeting interview delivery other].freeze

  validates :name, presence: true
  validates :company, presence: true
  validates :purpose, presence: true, inclusion: { in: PURPOSES }
end
