module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出社' if attendance.started_at.nil?
      return '退社' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format('%.2f', (((finish - start) / 60) / 60.0))
  end
  
    # 曜日の数値を受け取り、色をつけてhtml形式で変換する
  def week_color(week)
    color = case week
            when 0 then 'red'
            when 6 then 'blue'
            else '#000000'
            end
    format('<font color=\'%s\'>%s</font>', color, $days_of_the_week[week]).html_safe
  end
  
  # 出勤時間と退勤時間を受け取り、在社時間を４分割に計算して返します。
  def working_quarter_times(start, finish)
    hour = ((finish - start) / 3600).floor
    minute = case (60 + quarter_times(finish).to_i - quarter_times(start).to_i) % 60
             when 0 then 0
             when 15 then 0.25
             when 30 then 0.5
             when 45 then 0.75
             end
    format('%.2f', hour.to_f + minute.to_f)
  end
  
  # 送られてきた時間の分を15分単位に計算して返します。
  def quarter_times(time)
    minute = case (time.to_i / 60) % 60
             when 0..14 then 0
             when 15..30 then 15
             when 31..44 then 30
             when 45..59 then 45
             end
    format('%.2d',minute)
  end
  
end