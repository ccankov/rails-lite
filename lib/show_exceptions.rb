require 'erb'

class ShowExceptions
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue StandardError => e
      Rack::Response.new(render_exception(e),
                         500,
                         {'Content-Type' => 'text/html'})
    end
  end

  private

  def render_exception(e)

  end
end
