RSpec.describe EngBootcamp2020Stephan do
  it "has a version number" do
    expect(EngBootcamp2020Stephan::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe '.hello_gusto' do
    it 'can output hello gusto' do
      expect(EngBootcamp2020Stephan.hello_gusto).to eq('hello gusto')
    end

    it 'outputs hello gusto when loaded' do
      pending
      expect(false).to eq(true)
    end
  end

  describe '.hello_gusto_with_env_param' do
    it 'can output hello gusto' do
      expect(EngBootcamp2020Stephan.hello_gusto_with_env_param('MY_ENV')).to eq('hello gusto - ENV MY_ENV')
    end
  end

  describe '.hello_gusto_with_rails_env' do
    it 'can output hello gusto when there is no Rails env' do
      expect(EngBootcamp2020Stephan.hello_gusto_with_rails_env).to eq('hello gusto')
    end

    it 'can output hello gusto with Rails env' do
      Rails = double()
      allow(Rails).to receive(:env).and_return :TEST

      expect(EngBootcamp2020Stephan.hello_gusto_with_rails_env).to eq('hello gusto - ENV TEST')
    end
  end

  describe '.hello_gusto_with_configured_env' do
    before do
      EngBootcamp2020Stephan.env = nil
    end

    it 'can output hello gusto when no env is configured' do
      expect(EngBootcamp2020Stephan.hello_gusto_with_configured_env).to eq('hello gusto')
    end

    it 'can output hello gusto with configured env' do
      EngBootcamp2020Stephan.env = 'CONFIGURED TEST'
      expect(EngBootcamp2020Stephan.hello_gusto_with_configured_env).to eq('hello gusto - ENV CONFIGURED TEST')
    end
  end
end
