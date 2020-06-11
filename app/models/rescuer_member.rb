class RescuerMember < ApplicationRecord
  include StringNormalizer

  before_validation do
    self.rescue_station = normalize_as_name(rescue_station)
    self.representative = normalize_as_name(representative)
    self.rescue_station_kana = normalize_as_furigana(rescue_station_kana)
    self.representative_kana = normalize_as_furigana(representative_kana)
  end

  before_save { self.email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false },
                    'valid_email_2/email': true

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :rescue_station, presence: true
  validates :rescue_station_kana, presence: true,
    format: {with: KATAKANA_REGEXP, allow_blank: true}

  validates :representative, presence: true
  validates :representative_kana, presence: true,
    format: {with: KATAKANA_REGEXP, allow_blank: true}

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :post_code, length: { is: 7 }
  validates :home_address, presence: true
  validates :comment, length: { in: 50..70 }, allow_blank: true

  has_secure_password

  has_many :rescuestation_items
  has_many :items, through: :rescuestation_items
end