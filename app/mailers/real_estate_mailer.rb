class RealEstateMailer < ApplicationMailer

	default from: 'test@example.com'

  def send_confirmation_email(real_estate_id, user_id)
    @user = User.find_by_id(user_id)
    @real_estate = RealEstate.find_by_id(real_estate_id)
    mail(:to => @user.email, :subject => "Successfully purchased real-estate!")
  end
end
