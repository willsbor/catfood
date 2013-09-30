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
    category1 = base_class.create!(condition)
  else
    result[0]
  end
end

category1 = check_and_create(Category, :name => "罐頭")
category2 = check_and_create(Category, :name => "乾飼料")
category3 = check_and_create(Category, :name => "化毛膏")
category4 = check_and_create(Category, :name => "貓砂")

loc1 = check_and_create(Location, :name => "Costco")
loc2 = check_and_create(Location, :name => "好狗命")
loc3 = check_and_create(Location, :name => "Yahoo 購物中心")
loc4 = check_and_create(Location, :name => "露天拍賣")

cap = [
  check_and_create(Capacity, {:amount => 2, :unit => "kg"}),   #0
  check_and_create(Capacity, {:amount => 4, :unit => "kg"}),   #1
  check_and_create(Capacity, {:amount => 10, :unit => "kg"}),  #2 
  check_and_create(Capacity, {:amount => 24, :unit => "can"}),  #3
  check_and_create(Capacity, {:amount => 100, :unit => "g"}),   #4
  check_and_create(Capacity, {:amount => 220, :unit => "g"}),   #5
  check_and_create(Capacity, {:amount => 20, :unit => "lb"}),   #6
  check_and_create(Capacity, {:amount => 42, :unit => "lb"}),   #7
  check_and_create(Capacity, {:amount => 30, :unit => "lb"}),   #8
  check_and_create(Capacity, {:amount => 7, :unit => "lb"}),   #9
  check_and_create(Capacity, {:amount => 40, :unit => "lb"}),   #10
]

product_array = []

p = check_and_create(ProductInfo, {:name => "鮪魚+雞肉+蔬菜", :vendor => "靖", :category_id => category1.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc3})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc4})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[3]})
p.save!
product_array << p # 0

p = check_and_create(ProductInfo, {:name => "鮪魚+雞肉+起司", :vendor => "靖", :category_id => category1.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc3})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc4})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[3]})
p.save!
product_array << p # 1

p = check_and_create(ProductInfo, {:name => "皇家室內成貓", :vendor => "法國皇家", :category_id => category2.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc4})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[0]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[1]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[2]})
p.save!
product_array << p # 2

p = check_and_create(ProductInfo, {:name => "皇家幼母貓", :vendor => "法國皇家", :category_id => category2.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc4})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[0]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[1]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[2]})
p.save!
product_array << p # 3

p = check_and_create(ProductInfo, {:name => "皇家理想體態貓", :vendor => "法國皇家", :category_id => category2.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[0]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[1]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[2]})
p.save!
product_array << p # 4

p = check_and_create(ProductInfo, {:name => "皇家絕育貪嘴貓", :vendor => "法國皇家", :category_id => category2.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[0]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[1]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[2]})
p.save!
product_array << p # 5

p = check_and_create(ProductInfo, {:name => "麥芽化毛膏 ", :vendor => "德國竣寶 GIMPET", :category_id => category3.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[4]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[5]})
p.save!
product_array << p # 6

p = check_and_create(ProductInfo, {:name => "銀鑽全效型貓砂", :vendor => "Scoop Away", :category_id => category4.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc1})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[6]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[7]})
p.save!
product_array << p # 7

p = check_and_create(ProductInfo, {:name => "Litter Purrfect檸檬香貓砂", :vendor => "Costco", :category_id => category4.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc1})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[8]})
p.save!
product_array << p # 8

p = check_and_create(ProductInfo, {:name => "藍鑽系列貓砂", :vendor => "EVER CLEAN", :category_id => category4.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc3})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc4})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[7]})
p.save!
product_array << p # 9

p = check_and_create(ProductInfo, {:name => "綜合罐頭", :vendor => "靖", :category_id => category1.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc3})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc4})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[3]})
p.save!
product_array << p # 10

p = check_and_create(ProductInfo, {:name => "松樹砂貓砂", :vendor => "Feline pine 健康班比", :category_id => category1.id})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc2})
check_and_create(ProductInfoLocationship, {:product_info => p, :location => loc3})

check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[9]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[6]})
check_and_create(ProductInfoCapacityship, {:product_info => p, :capacity => cap[10]})
p.save!
product_array << p # 11

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
    :capacity_id => cap[2].id, 
    :product_info_id => product_array[2].id, 
    :location_id => loc2.id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 2340, 
    :log_date => "2012-07-04".to_date, 
    :capacity_id => cap[5].id, 
    :product_info_id => product_array[6].id, 
    :location_id => loc2.id,
    :amount => 1
    )

  fake_user.price_logs << PriceLog.create!(
    :price => 495, 
    :log_date => "2012-08-09".to_date, 
    :capacity_id => cap[6].id, 
    :product_info_id => product_array[11].id, 
    :location_id => loc2.id,
    :amount => 2
    )
end
