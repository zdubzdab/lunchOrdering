module PersonsHelper
  def week_calendar_td_options
    ->(start_date, current_calendar_date) {
      today = Time.zone.now.to_date
      td_class = ["day"]

      td_class = ["day"]
      td_class << "today"  if today == current_calendar_date
      td_class << "past"   if today > current_calendar_date
      td_class << "future" if today < current_calendar_date
      td_class << "prev-month"    if start_date.month != current_calendar_date.month && current_calendar_date < start_date
      td_class << "next-month"    if start_date.month != current_calendar_date.month && current_calendar_date > start_date
      td_class << "current-month" if start_date.month == current_calendar_date.month
      td_class << "wday-#{current_calendar_date.wday.to_s}"

      { class: td_class.join(" "), data: {day: current_calendar_date} }
    }
  end

  def total_price(first_course, second_course, drink_course)
    if first_course
      first = first_course.price
    else
      first = 0
    end
    if second_course
      second = second_course.price
    else
      second = 0
    end
    if drink_course
      drink = drink_course.price
    else
      drink = 0
    end
    number_to_currency(first + second + drink)
  end

  def show_desired_button(first_course, second_course, drink_course)
    if @first_course && @second_course && @drink
      button_to t('.b_order123'), orders_path(first_course_id: @first_course.id, second_course_id: @second_course.id, drink_id: @drink.id), remote: true, class: "btn btn-warning"
    elsif @first_course && @second_course
      button_to t('.b_order12'), orders_path(first_course_id: @first_course.id, second_course_id: @second_course.id), remote: true, class: "btn btn-warning"
    elsif @first_course && @drink
      button_to t('.b_order13'), orders_path(first_course_id: @first_course.id, drink_id: @drink.id), remote: true, class: "btn btn-warning"
    elsif @second_course && @drink
      button_to t('.b_order23'), orders_path(second_course_id: @second_course.id, drink_id: @drink.id), remote: true, class: "btn btn-warning"
    elsif @first_course
      button_to t('.b_order1'), orders_path(first_course_id: @first_course.id), remote: true, class: "btn btn-warning"
    elsif @second_course
      button_to t('.b_order2'), orders_path(second_course_id: @second_course.id), remote: true, class: "btn btn-warning"
    elsif @drink
      button_to t('.b_order3'), orders_path(drink_id: @drink.id), remote: true, class: "btn btn-warning"
    else
      button_to t('.b_order0'), orders_path, remote: true, class: "btn btn-warning"
    end
  end
end
