#  Сделать хеш, содеращий месяцы и количество дней в месяце. В цикле выводить те месяцы, 
#у которых количество дней ровно 30
# 20.08.2016

months = { "January" => 31, "February" => 29, "March" => 31, "April" => 30, "May" => 31, "June" => 30, "July" => 31,
  "August" => 31, "September" => 30, "October" => 31, "November" => 30, "December" => 31}

months.each do |month,days|
  puts month if days == 30
end     
