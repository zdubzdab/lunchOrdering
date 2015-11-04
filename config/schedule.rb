every :day, at: '4am' do
  # specify the task name as a string
  rake 'delete:yesterday_carts'
end