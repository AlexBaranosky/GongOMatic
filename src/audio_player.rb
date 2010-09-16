require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\speaker'
require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\path_making'
require 'win32/sound'
include Win32
include PathMaking

class AudioPlayer
  GONG_WAV = 'blong2.wav'

  def initialize(speaker = Speaker.new)
    @speaker = speaker
  end

  def play(practice_routine_segments)
    practice_routine_segments.each do |segment|
      @speaker.speak(segment.message) if segment.message
      wait_then_ring_gong(segment.duration)
    end
  end

  private

  def wait_then_ring_gong(seconds)
    sleep(seconds)
    Sound.play(resource_path(GONG_WAV))
  end

end