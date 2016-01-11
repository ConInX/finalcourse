# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




#北京大学
#清华大学
#复旦大学
#上海交通大学
#武汉大学
#浙江大学
#南京大学
#中国人民大学
#吉林大学
#中山大学
#中国科学院大学
t=Time.now
University.create({:universityname=>"北京大学",:location=>"北京",:created=>t})
University.create({:universityname=>"清华大学",:location=>"北京",:created=>t})
University.create({:universityname=>"复旦大学",:location=>"上海",:created=>t})
University.create({:universityname=>"上海交通大学",:location=>"上海",:created=>t})
University.create({:universityname=>"武汉大学",:location=>"湖北",:created=>t})
University.create({:universityname=>"浙江大学",:location=>"浙江",:created=>t})
University.create({:universityname=>"南京大学",:location=>"江苏",:created=>t})
University.create({:universityname=>"中国人民大学",:location=>"北京",:created=>t})
University.create({:universityname=>"吉林大学",:location=>"吉林",:created=>t})
University.create({:universityname=>"中山大学",:location=>"广东",:created=>t})
University.create({:universityname=>"中国科学院大学",:location=>"北京",:created=>t})
