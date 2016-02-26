require_relative "../obj/application"

Before do |scenario|
  @app ||= Application.new
end
