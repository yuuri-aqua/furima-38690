class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  validates :nickname,         presence: true
  validates :family_name,      presence: true
  validates :first_name,       presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana,  presence: true
  validates :birth_date,       presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'}
  
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶー－\p{Han}]+\z/.freeze
  validates :family_name, format: { with: VALID_ZENKAKU_REGEX, message: 'is invalid. Input full-width characters'}
  validates :first_name, format: { with: VALID_ZENKAKU_REGEX, message: 'is invalid. Input full-width characters'}

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :family_name_kana, format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters'}
  validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters'}
end
