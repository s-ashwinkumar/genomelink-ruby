RSpec.describe Genomelink::Base do
  subject { Genomelink::Base }
  let(:obj) { double("dummy object", body: "{\"test\":\"testing\"}") }

  context 'service' do
    it 'should create Faraday object' do
      expect(Faraday).to receive(:new)
      subject.send(:service, "token")
    end
  end

  context 'get' do
    it 'should get service object, call get on it and parse response' do
      expect(subject).to receive(:service).and_return(obj)
      expect(obj).to receive(:get).and_return(obj)
      result = subject.get("path", "token")
      expect(result["test"]).to eq('testing')
    end
  end

  context 'initialize' do
    class Test < Genomelink::Base
      attr_accessor :test1, :test2
    end
    it 'should initialize the isntance variables' do
      data = { test1: "test 1",
        test2: {
          testing: "test2"
        }
      }
      result = Test.new(data)
      expect(result.test1).to eq("test 1")
      expect(result.test2[:testing]).to eq("test2")
    end
  end
end
