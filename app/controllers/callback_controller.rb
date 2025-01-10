class CallbackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    bot = Bot.find_by(name: params[:botname], platform: "line")
    line_client = LineClient.new(bot.line_client_token.as_json)

    messages = line_client.callback_to_message_object(params)

    messages.each do |message|
      # DEMO ECHO BACK
      # line_client.reply_to_message(message.line_reply_token, [message.content])

      active_tool = Tool::Base.subclasses.select{ |tool| tool.detect(message.content) }.first
      if active_tool
        reply_message = active_tool.reply_message(message.content)
        line_client.reply_to_message(message.line_reply_token, [reply_message])
      end
    end

    render json: { status: "ok" }
  end

  def telegram
  end
end
