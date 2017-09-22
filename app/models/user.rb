class User < ApplicationRecord

  belongs_to :role
  has_many :questions, :dependent => :delete_all
  has_many :lists, :dependent => :delete_all
  has_many :results, :dependent => :delete_all

  before_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :on => :create, :message => "can't be blank"
  validates_presence_of :last_name, :on => :create, :message => "can't be blank"

  private
  def set_default_role
    self.role_id ||= Role.find_by_id(Integer(params[:role_id]))
  end
end
