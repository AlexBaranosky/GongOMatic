class String

  def blank?
    strip == ''
  end

  def comment?
    match(/^\s*#/)
  end

end