# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Profile.create(
  name: 'Rochelle Nemrow',
  location: 'Boston, MA',
  picture: File.new("#{Rails.root}/app/assets/images/sample_profile.jpg"),
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  title: 'Founder & CEO',
  industry: 'Technology',
  company: 'FamilyID, Inc.',
  website: 'http://www.familyid.com',
  twitter: 'https://twitter.com/rochellenemrow',
  linkedin: 'https://www.linkedin.com/pub/rochelle-nemrow/5/35a/426'
)