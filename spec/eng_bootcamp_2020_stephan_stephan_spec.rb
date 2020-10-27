RSpec.describe EngBootcamp2020Stephan do
  subject { described_class }

  it "has a version number" do
    expect(subject::VERSION).not_to be nil
  end

  describe '.hello_gusto' do
    it 'can output hello gusto' do
      expect(subject.hello_gusto).to eq('hello gusto')
    end

    it 'outputs hello gusto when loaded' do
      pending
      expect(false).to eq(true)
    end
  end

  describe '.hello_gusto_with_env_param' do
    it 'can output hello gusto' do
      expect(subject.hello_gusto_with_env_param('MY_ENV')).to eq('hello gusto - ENV MY_ENV')
    end
  end

  describe '.hello_gusto_with_rails_env' do
    it 'can output hello gusto when there is no Rails env' do
      expect(subject.hello_gusto_with_rails_env).to eq('hello gusto')
    end

    it 'can output hello gusto with Rails env' do
      Rails = double()
      allow(Rails).to receive(:env).and_return 'TEST'

      expect(subject.hello_gusto_with_rails_env).to eq('hello gusto - ENV TEST')

      Object.send(:remove_const, "Rails")
    end
  end

  describe '.hello_gusto_with_configured_env' do
    before { subject.env = nil }
    after { subject.env = nil }

    it 'can output hello gusto without configured env' do
      expect(subject.hello_gusto_with_configured_env).to eq('hello gusto')
    end

    it 'can output hello gusto with configured env' do
      subject.env = 'CONFIGURED TEST'

      expect(subject.hello_gusto_with_configured_env).to eq('hello gusto - ENV CONFIGURED TEST')
    end
  end
end
