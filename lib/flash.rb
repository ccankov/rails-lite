require 'json'

class Flash
  attr_reader :now

  def initialize(req)
    if req.cookies['_rails_lite_app_flash']
      @now = JSON.parse(req.cookies['_rails_lite_app_flash'],
                        symbolize_names: true)
    else
      @now = {}
    end
    @flash = {}
  end

  def [](key)
    merged_flash = @now.merge(@flash)
    merged_flash[key.to_sym]
  end

  def []=(key, val)
    @flash[key.to_sym] = val
  end

  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', path: '/', value: @flash.to_json)
  end
end
