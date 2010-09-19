module SuperString
  def blank?
    strip == ''
  end

  def comment?
    match(/^\s*#/)
  end
end

class String
  include SuperString
end

