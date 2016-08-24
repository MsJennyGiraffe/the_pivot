namespace :scheduler do
  desc "TODO"
  task check_status: :environment do
   Item.where("expiration_time <= ?", Time.now).update_all(bid_status: "Closed")
  end
end
