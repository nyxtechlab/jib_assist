class CallbackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    bot = Bot.find_by(name: params[:botname])
    line_client = LineClient(bot.line_client_token)
  end

  def telegram
  end
end
