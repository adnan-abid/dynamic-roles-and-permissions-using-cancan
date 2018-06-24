class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessor :email, :password, :password_confirmation, :remember_me, :role_id, :name

  belongs_to :role

  def super_admin?
    self.role.name == "Super Admin"
  end
  def traveler?
    self.role.name == "Traveler"
  end
  def agent?
    self.role.name == "Agent"
  end

end