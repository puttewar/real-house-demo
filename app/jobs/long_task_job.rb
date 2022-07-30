class LongTaskJob < ApplicationJob
  queue_as :default

  def perform(real_estate_id, user_id)
    # Do something later
    sleep 60
    true # the task was completed correctly
    RealEstateMailer.send_confirmation_email(real_estate_id, user_id).deliver_now
  end
end
