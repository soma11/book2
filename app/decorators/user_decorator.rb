module UserDecorator
  def show_name
    "#{name} (#{nickname})"
  end

  def thumbnail_image
    "#{image}&s=40"
  end
end
