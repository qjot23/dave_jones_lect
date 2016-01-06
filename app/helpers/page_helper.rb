module PageHelper

  

  def calendar(year, month)
    days = %w(mon tue wed thu fri sat sun)
    current_date = Date.new(year, month, 1)
    day_of_week = current_date.strftime("%u").to_i
    last_day = Date.new(year, month,-1)
    days_of_month = last_day.day
    last_day_week = last_day.strftime("%u").to_i
    name_of_month = current_date.strftime("%B")

    prev_month = month - 1
    prev_year = year

    next_month = month + 1
    next_year = year

    if (prev_month <= 0)
      prev_month = 12
      prev_year -= 1
    end

    if (next_month > 12)
      next_month = 1
      next_year += 1
    end

    retstring = "<table class = \"tab\">\n\t<tr><td colspan =\"7\">#{year}</td></tr><tr><td colspan = \"7\">"
    #retstring += link_to "<< ", page_calendar_path + "?year=#{prev_year}&month=#{prev_month}"
    retstring += link_to "<< ", calendar_path(year: prev_year, month: prev_month)
    retstring += "#{name_of_month}"
    #retstring += link_to " >>", page_calendar_path + "?year=#{next_year}&month=#{next_month}"
    retstring += link_to " >>", calendar_path(year: next_year, month: next_month)
    retstring += "</td></tr><tr>\n"
    
    days.each do | day |
      retstring += "\t\t<td>#{day}</td>\n"
    end
    retstring += "</tr><tr>"
    (day_of_week - 1).times do
      retstring += "<td>&nbsp;</td>"
    end
    (8 - day_of_week).times do | day |
      retstring +="<td>#{day + 1}</td>"
    end
    
    retstring += "</tr><tr>"
    start = 8 - day_of_week
    array = Array.new(3){ |i| Array.new(7){ |j| start += 1 }}
    
    array.each do | row |
        row.each do |cell|
          retstring += "<td>#{cell}</td>"
        end
      retstring += "</tr><tr>"
    end

    i = array[2].last + 1
    
    (i..days_of_month).each_with_index do |day, index|
        index == 7 ? retstring += "</tr><tr><td>#{day}</td>" : retstring += "<td>#{day}</td>"
    end
      
    retstring += "</tr></table><br />"
     
    return retstring
end
end
