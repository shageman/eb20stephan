RSpec.describe EngBootcamp2020Stephan do
  it "has a version number" do
    expect(EngBootcamp2020Stephan::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe '.hello_gusto' do
    subject { described_class.hello_gusto }

    it 'can output hello gusto' do
      expect(subject).to eq('hello gusto')
    end

    it 'outputs hello gusto when loaded' do
      pending
      expect(false).to eq(true)
    end
  end

  describe '.hello_gusto_with_env_param' do
    let(:env_param) { 'MY_ENV' }
    subject { described_class.hello_gusto_with_env_param(env_param) }

    it 'can output hello gusto' do
      expect(subject).to eq('hello gusto - ENV MY_ENV')
    end
  end

  describe '.hello_gusto_with_rails_env' do
    subject { described_class.hello_gusto_with_rails_env }

    context 'when Rails is not defined' do
      it 'can output hello gusto when there is no Rails env' do
        expect(subject).to eq('hello gusto')
      end
    end

    context 'when Rails is defined' do
      let(:rails_env) { :TEST }

      before do
        Rails = double()
        allow(Rails).to receive(:env).and_return rails_env
      end

      it 'can output hello gusto with Rails env' do
        expect(subject).to eq('hello gusto - ENV TEST')
      end
    end
  end

  describe '.hello_gusto_with_configured_env' do
    subject { described_class.hello_gusto_with_configured_env }

    let(:configured_env) { nil }

    around(:each) do |example|
      previous_env = EngBootcamp2020Stephan.instance_variable_get(:@env)
      EngBootcamp2020Stephan.env = configured_env
      EngBootcamp2020Stephan.env = previous_env
    end

    context 'when no env is configured' do
      it 'can output hello gusto when no env is configured' do
        expect(subject).to eq('hello gusto')
      end
    end

    context 'when an env is configured' do
      let(:configured_env) { 'CONFIGURED TEST' }

      it 'can output hello gusto with configured env' do
        expect(subject).to eq('hello gusto - ENV CONFIGURED TEST')
      end
    end
  end
end
