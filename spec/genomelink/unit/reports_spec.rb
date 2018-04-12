RSpec.describe Genomelink::Report do
  subject { Genomelink::Report }
  let(:obj) { double("dummy object for client") }

  context 'fetch' do
    it 'should call get on the URL to get trait' do
      expect(subject).to receive(:get).with("/v1/reports/testing?population=european", "token").and_return("result")
      expect(subject).to receive(:new).with("result").and_return("result")
      subject.fetch("testing","token")
    end
  end
end
