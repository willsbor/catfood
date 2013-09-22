# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category1 = Category.create!(:name => "罐頭")
category2 = Category.create!(:name => "乾飼料")
category3 = Category.create!(:name => "化毛膏")
category4 = Category.create!(:name => "貓砂")

ProductInfo.create!(:name => "鮪魚+雞肉+蔬菜", :vendor => "靖", :category_id => category1.id)
ProductInfo.create!(:name => "鮪魚+雞肉+起司", :vendor => "靖", :category_id => category1.id)

ProductInfo.create!(:name => "皇家室內成貓", :vendor => "法國皇家", :category_id => category2.id)
ProductInfo.create!(:name => "皇家幼母貓", :vendor => "法國皇家", :category_id => category2.id)
ProductInfo.create!(:name => "皇家理想體態貓", :vendor => "法國皇家", :category_id => category2.id)
ProductInfo.create!(:name => "皇家絕育貪嘴貓", :vendor => "法國皇家", :category_id => category2.id)

ProductInfo.create!(:name => "麥芽化毛膏 ", :vendor => "德國竣寶 GIMPET", :category_id => category3.id)

ProductInfo.create!(:name => "銀鑽全效型貓砂", :vendor => "Scoop Away", :category_id => category4.id)
ProductInfo.create!(:name => "Litter Purrfect檸檬香貓砂", :vendor => "Costco", :category_id => category4.id)
ProductInfo.create!(:name => "藍鑽系列貓砂", :vendor => "EVER CLEAN", :category_id => category4.id)
