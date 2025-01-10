class Tool::Base
  def self.priority
    10
  end

  def self.format
    raise "Not implemented"
  end

  def self.describe
    raise "Not implemented"
  end

  def self.detect(message)
    raise "Not implemented"
  end

  def self.reply_message(message)
    raise "Not implemented"
  end

  def self.subclasses
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end