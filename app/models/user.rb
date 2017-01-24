class User < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # all of these being mass assigned isn't good, so I need to look into how to protect some of these from being hacked asap.
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name, :last_name
  attr_accessible :bio, :house_id, :mail_address, :mail_city, :mail_state, :mail_zip, :mail_country, :mail_check_name
  attr_accessible :avatar, :avatar_file_name, :phone, :alumni, :rank, :staff, :board, :mhwow, :active
  
  validates_presence_of :first_name, :last_name, :role
  
  belongs_to :house
  has_many :receipts
  belongs_to :level
  has_many :programs, :foreign_key => "submitter_id"
  
  has_attached_file :avatar, :styles => {:thumb => '120x120>', :large => '640x480>' },
                    :default_style => :thumb,
                    :url => "/assets/images/:class/:id/:style/:basename.:extension"

  def first_name=(first_name)
    write_attribute(:first_name, first_name.strip.titleize)  
  end
  
  def last_name=(last_name)
    write_attribute(:last_name, last_name.strip.titleize)  
  end

  def email=(email)
    unless email.nil?
      write_attribute(:email, email.strip.downcase)
    end
  end

  def phone=(phone)
    write_attribute(:phone, number_to_phone(phone.gsub("-", "").gsub(" ", "").gsub("(", "").gsub(")", ""), :area_code => true)) if phone  
  end

  def fullname
    "#{self.last_name}, #{self.first_name}"
  end

  def firstlast
    "#{self.first_name} #{self.last_name}"
  end
  
  def avatar_legacy
    if self.avatar.to_s.include? "missing.png"
      "http://moishehouse.org/data/photos/residents/#{self.id}.jpg"
    else
      self.avatar
    end
  end
end
