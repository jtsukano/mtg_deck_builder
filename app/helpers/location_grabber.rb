helpers do
  def ip_grabber
    request.remote_ip
    @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
  end

  def convert_ip
  # app/models/user.rb
  geocoded_by ip_grabber,
    :latitude => :lat, :longitude => :lon
  after_validation @geocode
  end
end
