# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def check_and_create(base_class, condition)
  result = base_class.where(condition)
  if result.blank?
    base_class.create!(condition)
  else
    result[0]
  end
end

category = {}

category["罐頭"] = check_and_create(Category, :name => "罐頭")
category["乾飼料"] = check_and_create(Category, :name => "乾飼料")
category["化毛膏"] = check_and_create(Category, :name => "化毛膏")
category["貓砂"] = check_and_create(Category, :name => "貓砂")

loc = {}
loc["Costco"] = check_and_create(Location, :name => "Costco")
loc["好狗命"] = check_and_create(Location, :name => "好狗命")
loc["Yahoo 購物中心"] = check_and_create(Location, :name => "Yahoo 購物中心")
loc["露天拍賣"] = check_and_create(Location, :name => "露天拍賣")

capbase = {}
capbase["1can80g"] = check_and_create(Capacity, {:amount => 80, :unit => "g"})
capbase["1can185g"] = check_and_create(Capacity, {:amount => 185, :unit => "g"})
capbase["1kg1000g"] = check_and_create(Capacity, {:amount => 1000, :unit => "g"})
capbase["1lb453g"] = check_and_create(Capacity, {:amount => 453.59237, :unit => "g"})
capbase["1l1000ml"] = check_and_create(Capacity, {:amount => 1000, :unit => "ml"})

cap = {}
cap["2kg"] = check_and_create(Capacity, {:amount => 2, :unit => "kg", :sub_capacity_id => capbase["1kg1000g"].id})
cap["4kg"] = check_and_create(Capacity, {:amount => 4, :unit => "kg", :sub_capacity_id => capbase["1kg1000g"].id})
cap["10kg"] = check_and_create(Capacity, {:amount => 10, :unit => "kg", :sub_capacity_id => capbase["1kg1000g"].id})
cap["15kg"] = check_and_create(Capacity, {:amount => 15, :unit => "kg", :sub_capacity_id => capbase["1kg1000g"].id})
cap["25kg"] = check_and_create(Capacity, {:amount => 25, :unit => "kg", :sub_capacity_id => capbase["1kg1000g"].id})

cap["24can"] = check_and_create(Capacity, {:amount => 24, :unit => "can", :sub_capacity_id => capbase["1can80g"].id})
cap["24can185g"] = check_and_create(Capacity, {:amount => 24, :unit => "can", :sub_capacity_id => capbase["1can185g"].id})

cap["100g"] = check_and_create(Capacity, {:amount => 100, :unit => "g"})   #4
cap["120g"] = check_and_create(Capacity, {:amount => 120, :unit => "g"})
cap["220g"] = check_and_create(Capacity, {:amount => 220, :unit => "g"})   #5

cap["20lb"] = check_and_create(Capacity, {:amount => 20, :unit => "lb", :sub_capacity_id => capbase["1lb453g"].id})   #6
cap["42lb"] = check_and_create(Capacity, {:amount => 42, :unit => "lb", :sub_capacity_id => capbase["1lb453g"].id})   #7
cap["30lb"] = check_and_create(Capacity, {:amount => 30, :unit => "lb", :sub_capacity_id => capbase["1lb453g"].id})   #8
cap["7lb"] = check_and_create(Capacity, {:amount => 7, :unit => "lb", :sub_capacity_id => capbase["1lb453g"].id})   #9
cap["40lb"] = check_and_create(Capacity, {:amount => 40, :unit => "lb", :sub_capacity_id => capbase["1lb453g"].id})   #10

cap["5l"] = check_and_create(Capacity, {:amount => 5, :unit => "l", :sub_capacity_id => capbase["1l1000ml"].id})


product_array = {}

p = check_and_create(ProductInfo, {:name => "鮪魚+雞肉+蔬菜", :vendor => "靖", :category_id => category["罐頭"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Yahoo 購物中心"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["露天拍賣"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["24can"]})
p.save!
product_array["鮪魚+雞肉+蔬菜"] = p

p = check_and_create(ProductInfo, {:name => "鮪魚+雞肉+起司", :vendor => "靖", :category_id => category["罐頭"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Yahoo 購物中心"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["露天拍賣"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["24can"]})
p.save!
product_array["鮪魚+雞肉+起司"] = p

p = check_and_create(ProductInfo, {:name => "皇家室內成貓", :vendor => "法國皇家", :category_id => category["乾飼料"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["露天拍賣"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["2kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["4kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["10kg"]})
p.save!
product_array["皇家室內成貓"] = p

p = check_and_create(ProductInfo, {:name => "皇家幼母貓", :vendor => "法國皇家", :category_id => category["乾飼料"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["露天拍賣"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["2kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["4kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["10kg"]})
p.save!
product_array["皇家幼母貓"] = p

p = check_and_create(ProductInfo, {:name => "皇家理想體態貓", :vendor => "法國皇家", :category_id => category["乾飼料"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["2kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["4kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["15kg"]})
p.save!
product_array["皇家理想體態貓"] = p

p = check_and_create(ProductInfo, {:name => "皇家絕育貪嘴貓", :vendor => "法國皇家", :category_id => category["乾飼料"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["2kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["4kg"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["10kg"]})
p.save!
product_array["皇家絕育貪嘴貓"] = p

p = check_and_create(ProductInfo, {:name => "麥芽化毛膏", :vendor => "德國竣寶 GIMPET", :category_id => category["化毛膏"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["100g"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["220g"]})
p.save!
product_array["德國竣寶 GIMPET 麥芽化毛膏"] = p

p = check_and_create(ProductInfo, {:name => "銀鑽全效型貓砂", :vendor => "Scoop Away", :category_id => category["貓砂"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Costco"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["20lb"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["42lb"]})
p.save!
product_array["Scoop Away銀鑽全效型貓砂"] = p

p = check_and_create(ProductInfo, {:name => "Litter Purrfect檸檬香貓砂", :vendor => "Costco", :category_id => category["貓砂"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Costco"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["30lb"]})
p.save!
product_array["Litter Purrfect檸檬香貓砂"] = p

p = check_and_create(ProductInfo, {:name => "藍鑽系列貓砂", :vendor => "EVER CLEAN", :category_id => category["貓砂"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Yahoo 購物中心"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["露天拍賣"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["42lb"]})
p.save!
product_array["藍鑽系列貓砂"] = p

p = check_and_create(ProductInfo, {:name => "綜合罐頭", :vendor => "靖", :category_id => category["罐頭"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Yahoo 購物中心"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["露天拍賣"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["24can"]})
p.save!
product_array["靖 綜合罐頭"] = p

p = check_and_create(ProductInfo, {:name => "松樹砂貓砂", :vendor => "Feline pine 健康班比", :category_id => category["貓砂"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Yahoo 購物中心"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["7lb"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["20lb"]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["40lb"]})
p.save!
product_array["Feline pine 健康班比 松樹砂貓砂"] = p

p = check_and_create(ProductInfo, {:name => "高效能環保木屑砂", :vendor => "德國JRS", :category_id => category["貓砂"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["25kg"]})
p.save!
product_array["德國JRS 高效能環保木屑砂"] = p

p = check_and_create(ProductInfo, {:name => "《貓用》化毛膏", :vendor => "美國8in1", :category_id => category["化毛膏"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["120g"]})
p.save!
product_array["美國8in1《貓用》化毛膏"] = p


p = check_and_create(ProductInfo, {:name => "豆腐砂", :vendor => "日本LION", :category_id => category["貓砂"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["好狗命"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["5l"]})
p.save!
product_array["日本LION 豆腐砂"] = p


p = check_and_create(ProductInfo, {:name => "特選銀罐系列 禮盒裝", :vendor => "PURINA貓倍麗", :category_id => category["罐頭"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Costco"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["24can"]})
p.save!
product_array["PURINA貓倍麗 特選銀罐系列 禮盒裝"] = p

p = check_and_create(ProductInfo, {:name => "貓罐(嫩雞 小牛肉配方)", :vendor => "Gourmet", :category_id => category["罐頭"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Costco"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["24can185g"]})
p.save!
product_array["Gourmet 貓罐(嫩雞 小牛肉配方)"] = p

p = check_and_create(ProductInfo, {:name => "體重管理飼料", :vendor => "KS", :category_id => category["乾飼料"].id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc["Costco"]})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap["20lb"]})
p.save!
product_array["KS 體重管理飼料"] = p

# fake data for develop
result = User.where(:email => "willsbor@hotmail.com")
if result.blank?
  fake_user = User.create!(:email => "willsbor@hotmail.com", :password => "a12345678", :password_confirmation => "a12345678")
else
  fake_user = result[0]
end

if fake_user.price_logs.blank?
  fake_user.price_logs << PriceLog.create!(
    :price => 2340, 
    :log_date => "2012-06-25".to_date, 
    :capacity_id => cap["10kg"].id, 
    :product_info_id => product_array["皇家室內成貓"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 690, 
    :log_date => "2012-07-04".to_date, 
    :capacity_id => cap["220g"].id, 
    :product_info_id => product_array["德國竣寶 GIMPET 麥芽化毛膏"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 495, 
    :log_date => "2012-08-09".to_date, 
    :capacity_id => cap["20lb"].id, 
    :product_info_id => product_array["Feline pine 健康班比 松樹砂貓砂"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 2
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 690, 
    :log_date => "2012-09-08".to_date, 
    :capacity_id => cap["220g"].id, 
    :product_info_id => product_array["德國竣寶 GIMPET 麥芽化毛膏"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 690, 
    :log_date => "2012-10-29".to_date, 
    :capacity_id => cap["220g"].id, 
    :product_info_id => product_array["德國竣寶 GIMPET 麥芽化毛膏"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 515, 
    :log_date => "2012-10-29".to_date, 
    :capacity_id => cap["24can"].id, 
    :product_info_id => product_array["靖 綜合罐頭"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 2640, 
    :log_date => "2012-11-18".to_date, 
    :capacity_id => cap["15kg"].id, 
    :product_info_id => product_array["皇家理想體態貓"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )
  
  fake_user.price_logs << PriceLog.create!(
    :price => 999, 
    :log_date => "2013-01-14".to_date, 
    :capacity_id => cap["25kg"].id, 
    :product_info_id => product_array["德國JRS 高效能環保木屑砂"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 330, 
    :log_date => "2013-03-18".to_date, 
    :capacity_id => cap["120g"].id, 
    :product_info_id => product_array["美國8in1《貓用》化毛膏"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 495, 
    :log_date => "2013-03-18".to_date, 
    :capacity_id => cap["5l"].id, 
    :product_info_id => product_array["日本LION 豆腐砂"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 2
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 2340, 
    :log_date => "2013-04-13".to_date, 
    :capacity_id => cap["10kg"].id, 
    :product_info_id => product_array["皇家室內成貓"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 539, 
    :log_date => "2013-04-15".to_date, 
    :capacity_id => cap["24can"].id, 
    :product_info_id => product_array["靖 綜合罐頭"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 690, 
    :log_date => "2013-05-14".to_date, 
    :capacity_id => cap["220g"].id, 
    :product_info_id => product_array["德國竣寶 GIMPET 麥芽化毛膏"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 690, 
    :log_date => "2013-06-01".to_date, 
    :capacity_id => cap["220g"].id, 
    :product_info_id => product_array["德國竣寶 GIMPET 麥芽化毛膏"].id, 
    :location_id => loc["好狗命"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 499, 
    :log_date => "2013-06-09".to_date, 
    :capacity_id => cap["24can"].id, 
    :product_info_id => product_array["PURINA貓倍麗 特選銀罐系列 禮盒裝"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 549, 
    :log_date => "2013-06-09".to_date, 
    :capacity_id => cap["42lb"].id, 
    :product_info_id => product_array["Scoop Away銀鑽全效型貓砂"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 299, 
    :log_date => "2013-08-06".to_date, 
    :capacity_id => cap["30lb"].id, 
    :product_info_id => product_array["Litter Purrfect檸檬香貓砂"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )
  
  fake_user.price_logs << PriceLog.create!(
    :price => 299, 
    :log_date => "2013-08-06".to_date, 
    :capacity_id => cap["24can185g"].id, 
    :product_info_id => product_array["Gourmet 貓罐(嫩雞 小牛肉配方)"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 599, 
    :log_date => "2013-08-06".to_date, 
    :capacity_id => cap["20lb"].id, 
    :product_info_id => product_array["KS 體重管理飼料"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 499, 
    :log_date => "2013-09-11".to_date, 
    :capacity_id => cap["24can"].id, 
    :product_info_id => product_array["PURINA貓倍麗 特選銀罐系列 禮盒裝"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 539, 
    :log_date => "2013-09-29".to_date, 
    :capacity_id => cap["42lb"].id, 
    :product_info_id => product_array["Scoop Away銀鑽全效型貓砂"].id, 
    :location_id => loc["Costco"].id,
    :amount => 1
    )

end

fake_user.save!

