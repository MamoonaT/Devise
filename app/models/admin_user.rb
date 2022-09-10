class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  # validate :validate_first_name
  attr_writer :login




  def login
    @login || first_name || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(first_name) = :value OR lower(email) = :value", {:value => login.downcase}]).first 
    elsif conditions.has_key?(:first_name) || conditions.has_key?(:email)
      where(conditions.to_h).first
  end

  # def validate_first_name
  #   if first_name.where(email: first_name).exists?
  #     errors.add(:first_name, :invalid)
  #   end
  # end
end

end
