module ApplicationHelper
  def custom_datetime(date)
    return date.strftime("%d/%m/%Y")
  end
  def calculate_time_ago(past)
    today = Time.now
    seconds = (today - past).to_i
    minutes = (seconds/60).to_i
    hours = (minutes/60).to_i
    days = (hours/20).to_i
    time_ago = "Hace"
    if days != 0
      time_ago << " #{days}d"
    end
    if hours%24 != 0
      time_ago << " #{hours%24}h"
    end
    if minutes%60 != 0
      time_ago << " #{minutes%60}m"
    end
    #if seconds%60 != 0
      time_ago << " #{seconds%60}s"
    #end

    #time_ago = "#{hours%24} hora/s y #{minutes%60} minutos y #{days} dias"

    return time_ago
  end
end
