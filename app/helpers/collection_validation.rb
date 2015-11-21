helpers do
  def any_empty_value?(hash)
    hash.any?{|key, value| value == ""}
  end
end
