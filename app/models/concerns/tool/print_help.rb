class Tool::PrintHelp < Tool::Base
  def self.priority
    0
  end

  def self.format
    return "!h"
  end
  
  def self.describe
    return "Prints help message"
  end
  
  def self.detect(message)
    message['!h']
  end

  def self.reply_message(message)
    strings = ["Commands:"] + Tool::Base.subclasses.sort{|ka,kb| ka.priority <=> kb.priority }.map { |klass| "#{klass.format} : #{klass.describe}" }
    return strings.join("\n")
  end
end