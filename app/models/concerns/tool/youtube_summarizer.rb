require 'uri'
require 'base64'

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
    yturl = message.split("!yt ").last.split(" ").first
    
    unless yturl =~ URI::regexp
      return "Invalid URL"
    end

    language = 'en'

    # STEP 1 - Download the subtitles
    puts "STEP 1 - Downloading the subtitles"

    unique_id = Base64.encode64(yturl)

    sub_format = "srt" # srt|ass|vtt|lrc
    sub_prefix = "#{Rails.roots.join('storage','ytdl')}/rawsubs/" + unique_id + ".#{sub_format}"
    sub_filename = sub_prefix + ".#{language}.vtt"

    # Execute the youtube-dl command
    dlcommand = "yt-dlp --write-auto-sub --convert-subs #{sub_format} -k --sub-langs #{language} -o #{sub_prefix} --skip-download #{url}"
    puts dlcommand

    system(dlcommand)

    # STEP 2 - Convert the subtitles to plaintext
    puts "STEP 2 - Converting the subtitles to plaintext"

    plaintext = clean_srt(sub_filename)

    cleansub_filename = sub_filename.gsub("rawsubs", "cleansubs")
    file = open(sub_filename.gsub("rawsubs","cleansubs"), "w")
    file.write(plaintext)
    file.close


    # STEP 3 - Pass plaintext to ollama for summarization
    puts "STEP 3 - Summarizing the text"

    initial_prompts = {
      "en" => "Summarize this as briefly as possible into bullet points"
    }

    prompt = "#{initial_prompts[language] || initial_prompts['en']} \n\n #{plaintext.gsub("\n", " ")}"

    # puts prompt

    headers = {
      content_type: :json,
      accept: :json
    }

    json_data = {
      model: "llama3.2",
      stream: use_stream,
      prompt: prompt
    }.to_json

    
    # Execute curl command using system
    response = RestClient.post("http://host.docker.internal:11434/api/generate", json_data, headers)

    # puts response.body

    puts "----------------------"
    puts JSON.parse(response.body)['response']
    puts "----------------------"

    return JSON.parse(response.body)['response']
  end

  # INNER WORKINGS

  def self.clean_srt(file_path)
    clean_text = ""
    
    start = false
    File.open(file_path, "r").each_line do |line|
      # Skip the line if it is a sequence number or timestamp
      start = true if line.match(/\d{2}:\d{2}:\d{2}.\d{3} --> \d{2}:\d{2}:\d{2}.\d{3}/)
      next if line.match(/^\d+$/) || line.match(/\d{2}:\d{2}:\d{2}.\d{3} --> \d{2}:\d{2}:\d{2}.\d{3}/)
      next if !start
      
      # Add the line to the clean_text unless it is empty
      clean_text += line.strip + " " unless line.strip.empty?
    end
    
    clean_text.gsub(/<[^>]*>/, '')
  end
end