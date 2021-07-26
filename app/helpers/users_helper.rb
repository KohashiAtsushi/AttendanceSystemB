module UsersHelper

  # 勤怠基本情報を指定のフォーマットで返します。  
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end
  def approval_result(superiors, report)
    result_text = case report.decision
                  when 0 then "所属長承認　未提出"
                  when 1 then "申請中"
                  when 2, 3
                    result_text = "所属長承認【
                    #{superiors.find{|user| user[:id] == @attendance_monthly_report.superior_id}.name }
                    から#{decision_to_display(report.decision)}済】"
                  end
  end
end