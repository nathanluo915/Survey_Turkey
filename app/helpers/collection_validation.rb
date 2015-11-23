helpers do
  def invalid_collection?(hash)
    hash.any?{|key, value| value == ""} || hash.length() < 1
  end

  def invalid_content?(str)
    str == ""
  end
end
