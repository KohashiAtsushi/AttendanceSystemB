module ApplicationHelper
  
  # ページごとにタイトルを返す
  def full_title(page_name = "")
    base_title = "AttendanceApp"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  def decision_to_display(decision_number = 0, super_user_id = "")
    $decision_word[decision_number]
  end

  def week_color(week)
    color = case week
            when 0 then 'red'
            when 6 then 'blue'
            else '#000000'
            end
    format('<font color=\'%s\'>%s</font>', color, $days_of_the_week[week]).html_safe
  end
end
