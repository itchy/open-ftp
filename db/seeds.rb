# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(:email => '7.scott.j@gmail.com', :sms_number => '214-668-0255', :box_auth_token => 'r6eehg2tjhgccru3n72m76fu85fq5njt', :password => 'abc123')
u.save