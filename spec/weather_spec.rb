class WeatherSpec

  include Weather

  describe WeatherSpec do

    it 'weather status will read either sunny or stormy' do
      weather_states = ['sunny', 'stormy']
      expect(weather_states).to include subject.weather
    end

  end

end