namespace :delete do
  desc 'Delete all yesterday carts'
  task yesterday_carts: :environment do
    Cart.delete_all('created_at < ?', 5.hours.ago)
  end
end