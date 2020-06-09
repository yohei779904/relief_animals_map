class SupportMember < ApplicationRecord
  include StringNormalizer

  before_validation do
    self.name = normalize_as_name(name)
    self.name_kana = normalize_as_furigana(name_kana)
  end

  before_save { self.email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false },
                    'valid_email_2/email': true

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :name, presence: true
  validates :name_kana, presence: true,
    format: {with: KATAKANA_REGEXP, allow_blank: true}

  has_secure_password

end
