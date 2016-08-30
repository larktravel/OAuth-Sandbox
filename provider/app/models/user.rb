class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  scope :admins,         -> { joins(:roles).where('roles.name = ?', 'admin') }
  scope :agents,         -> { joins(:roles).where('roles.name = ?', 'agent') }
  scope :evengelists,    -> { joins(:roles).where('roles.name = ?', 'evengelists') }
  scope :guests,         -> { joins(:roles).where('roles.name = ?', 'guest') }

  has_attached_file :avatar,
    :path => "user_images/:id/:style/:filename",
    :styles => {
      :medium => "360x360^",
      :small => "240x240^" ,
      :thumb => "120x120^"
    },
    :convert_options => {
      :medium => "-strip",
      :small => "-strip",
      :thumb => "-strip"
    },
    :default_url => "/user_images/default/:style/missing.png"

  do_not_validate_attachment_file_type :avatar

  def name
    first_name.blank? || last_name.blank? ? email : "#{first_name} #{last_name}".strip
  end

  def admin?
    roles.any?{|r| r.name == 'admin'}
  end

  def editor?
    admin? || roles.any?{|r| r.name == 'editor'}
  end

  def agent?
    admin? || roles.any?{|r| r.name == 'agent'}
  end

  def evangelist?
    agent? || roles.any?{|r| r.name == 'evangelist'}
  end

  def guest?
    roles.any?{|r| r.name == 'guest'}
  end
end
