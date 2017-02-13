class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  belongs_to :school, foreign_key: :school_id, counter_cache: true
  has_many :managements

  validates_uniqueness_of       :email,    :case_sensitive => false,          :allow_blank => true, :if => :email_changed?
  validates_format_of           :email,    :with  => Devise.email_regexp,     :allow_blank => true, :if => :email_changed?
  validates_confirmation_of     :password, :on=>:create
  validates_length_of           :password, :within => Devise.password_length, :allow_blank => true

  def self.order_by_school
    joins(:school).merge(School.order(:name))
  end
end
