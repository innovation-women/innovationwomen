class Profile < ActiveRecord::Base
  has_one :user
  
  has_attached_file :picture, :styles => { :medium => "240x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end