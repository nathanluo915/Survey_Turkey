helpers do
  def invalid_collection?(hash)
    hash.any?{|key, value| value == ""} || hash.length() < 1
  end
end
