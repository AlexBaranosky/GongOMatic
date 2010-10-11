require 'win32/sapi5'
include Win32

class Speaker
  def initialize
    @voice = SpVoice.new
    @voice.Volume  = 100
  end

  def speak(string)
    @voice.Speak(string)
  end
end