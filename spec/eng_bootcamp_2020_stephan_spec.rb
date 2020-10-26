RSpec.describe EngBootcamp2020Stephan do
  it "has a version number" do
    expect(EngBootcamp2020Stephan::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it 'can output hello gusto' do
    expect(EngBootcamp2020Stephan.hello_gusto).to eq('hello gusto')
  end

  it 'outputs hello gusto when loaded' do
    pending
    expect(false).to eq(true)
  end
end
