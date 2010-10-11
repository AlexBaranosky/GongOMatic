require File.dirname(__FILE__) + '/../src/speaker'
require 'win32/sound'
include Win32

class AudioPlayer
  GONG_WAV = File.dirname(__FILE__) + '/../resources/blong2.wav'

  def initialize
    @speaker = Speaker.new
  end

  def play(routine_parts)
    routine_parts.each do |p|
      @speaker.speak(p.message) if p.has_message?
      wait_then_ring_gong(p.duration)
    end
  end

  private

  def wait_then_ring_gong(seconds)
    sleep(seconds)
    Sound.play(GONG_WAV)
  end

end