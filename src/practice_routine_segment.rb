class PracticeRoutineSegment
  attr_reader :duration, :message

  def initialize(duration, message)
    @duration, @message = duration, message
  end

  def has_message?
    true if message
  end

  def to_s
    "d: #{@duration}, m: #{@message}"
  end
end