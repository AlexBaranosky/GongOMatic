require File.dirname(__FILE__) + '/../src/speaker'
require 'win32/sound'
include Win32

class AudioPlayer
  GONG_WAV = File.dirname(__FILE__) + '/../resources/blong2.wav'

  def initialize(speaker = Speaker.new)
    @speaker = speaker
  end

  def play(practice_routine_segments)
    practice_routine_segments.each do |segment|
      @speaker.speak(segment.message) if segment.has_message?
      wait_then_ring_gong(segment.duration)
    end
  end

  private

  def wait_then_ring_gong(seconds)
    sleep(seconds)
    Sound.play(GONG_WAV)
  end

end