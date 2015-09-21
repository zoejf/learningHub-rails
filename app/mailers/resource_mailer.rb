class ResourceMailer < ApplicationMailer
  default from: "zoefoss.dev@gmail.com"
  default to: "zoefoss.dev@gmail.com"

  def resource_email(message)
    @message = message
    mail(subject: @message.name)
  end

end
