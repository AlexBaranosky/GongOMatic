class PracticeRoutinePart
  attr_reader :duration, :message

  def initialize(duration, message)
    @duration, @message = duration, message
  end

  def scale_duration_by(multiplier)
    @duration *= multiplier
  end

  def has_message?
    true if message
  end

  def to_s
    "d: #{@duration.to_i}, m: #{@message}"
  end
end