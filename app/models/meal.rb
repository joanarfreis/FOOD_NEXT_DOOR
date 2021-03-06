class Meal < ApplicationRecord

  include PgSearch
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }

    pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

  scope :price_cents, -> (max_price) { where("price_cents < ?", max_price) }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  has_many :items, dependent: :destroy
  has_many :users, through: :items
  has_many :reviews, dependent: :destroy
  has_many :line_items, dependent: :destroy
  has_many :week_days
  belongs_to :cook, class_name: 'User', optional: true
  monetize :price_cents
end
