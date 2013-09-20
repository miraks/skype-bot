module SkypeBot
  class Command
    attr_reader :matcher

    def initialize matcher, &actions
      @matcher = matcher
      @actions = actions
    end

    def run! message, bot
      @actions.call message, bot
    end

    def run message, bot
      run! message, bot if match? message
    end

    protected

    def match? message
      body = message.body
      case matcher
      when Regexp then matcher =~ body
      when Proc then matcher.call body
      end
    end
  end
end