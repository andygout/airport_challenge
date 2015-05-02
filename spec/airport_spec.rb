require 'airport'

describe Airport do

  let(:plane) { double :plane, takeoff: true, land: true }

  context 'taking off and landing' do

    it 'a plane can land' do
      allow(subject).to receive(:weather).and_return('sunny')
      subject.receive plane
      planes = subject.planes
      expect(planes.include? plane).to be true
    end

    it 'a plane can take off' do
      allow(subject).to receive(:weather).and_return('sunny')
      subject.receive plane
      subject.launch plane
      planes = subject.planes
      expect(planes.include? plane).to be false
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      allow(subject).to receive(:weather).and_return('sunny')
      subject.capacity.times { subject.receive plane }
      expect { subject.receive plane }.to raise_error 'airport cannot receive planes when at capacity'
    end

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:weather).and_return('stormy')
        expect { subject.launch plane }.to raise_error 'plane cannot take off when storm brewing'
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:weather).and_return('stormy')
        expect { subject.receive plane }.to raise_error 'plane cannot land when storm brewing'
      end

      it 'weather report states either sunny or stormy' do
        weather_states = ['sunny', 'stormy']
        expect(weather_states.include? subject.weather).to be true
      end

    end

  end

  context 'airport capacity' do

    it 'airports commission instructs amend to airport capacity' do
      expect(subject.capacity = 50).to eq 50
    end

  end

end
