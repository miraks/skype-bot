module SkypeBot
  class Bot
    attr_reader :chat
    attr_accessor :commands

    MONITOR_INTERVAL = 5

    def initialize topic
      @chat = Skype.chats.find { |chat| chat.topic == topic }
      raise ArgumentError, "Can't find chat room with topic: #{topic}" if @chat.nil?
      self.commands = []
      yield self if block_given?
    end

    def say message
      @chat.post message
    end

    def monitor!
      monitor = Thread.new(self) do |bot|
        last_check = Time.now
        loop do
          new_messages = bot.chat.messages.select { |message| message.time > last_check }
          new_messages.each do |message|
            bot.commands.each { |command| command.run message, bot }
          end
          last_check = Time.now
          sleep MONITOR_INTERVAL
        end
      end
      monitor.join
    end
  end
end