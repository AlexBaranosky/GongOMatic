module Resourceful
  def reource(file_name)
    File.join(File.dirname(__FILE__), '..', 'resources', file_name)
  end
end
