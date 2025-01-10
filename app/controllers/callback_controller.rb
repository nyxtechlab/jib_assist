class CallbackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    bot = Bot.find_by(name: params[:botname])
    line_client = LineClient.new(bot.line_client_token.as_json)

    messages = line_client.callback_to_message_object(params)

    render json: { status: "ok" }
  end

  def telegram
  end
end
