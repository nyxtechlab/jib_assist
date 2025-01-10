class LineClient
  attr_accessor :client_token

  def initialize(client_token)
    self.client_token = client_token
  end

  def callback_to_message_object(params)
    botname = params['bot_name']

    messages = []

    events = params['events']
    events.each do |event|
      source = event['source']
      channel_id = source['groupId']
      user_id = source['userId']
      timestamp = event['timestamp'].to_i
      sent_at = DateTime.strptime((timestamp / 1000.0).to_s, '%s')
      reply_token = event['replyToken']

      if event['type'] == 'message'
        message = event['message']

        message_id = message['id']
        message_type = message['type']

        quoted_message_id = message['quotedMessageId']

        if message_type == 'text'
          text = message['text']
        elsif message_type == 'sticker'
          text = message['keywords'].sample
        else
          text = message_type
        end

        message = Message.find_or_create_by(botname: botname, platform: 'line', message_id: message_id, user_id: user_id, channel_id: channel_id) do |m|
          m.content = text
          m.message_type = message_type
          m.sent_at = sent_at
          m.line_reply_token = reply_token
        end
        messages << message
      end
    end

    return messages
  end

  def reply_to_message(reply_token,messages)
    body = {
      "replyToken" => reply_token,
      "messages" => messages.map{ |x| {"type" => "text", "text" => x} }
    }
    response = RestClient.post('https://api.line.me/v2/bot/message/reply', body.to_json, {
      content_type: :json,
      authorization: "Bearer #{client_token}"
    })
    response
  end
end