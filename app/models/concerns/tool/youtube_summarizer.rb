class Tool::YoutubeSummarizer < Tool::Base
  def self.format
    "!yt [url]"
  end

  def self.describe
    "(TODO) Summarizes a YouTube video"
  end
  
  def self.detect(message)
    # message.include?("youtube.com")
    false
  end

  def self.reply_message(message)
    # video_id = message.match(/v=([^&]+)/)[1]
    # video = Yt::Video.new id: video_id
    # video.title
    nil
  end
end