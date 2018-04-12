require 'byebug'
RSpec.describe Genomelink::Report do
  subject { Genomelink::Report }
  let(:obj) { double("dummy object for client") }
  let(:scores) {[
    { "score"=>0, "text"=>"Tend to not have brown eyes"},
    {"score"=>1, "text"=>"Tend to not have brown eyes, slightly"},
    {"score"=>2, "text"=>"Intermediate"},
    {"score"=>3, "text"=>"Slight tendency for brown eyes"},
    {"score"=>4, "text"=>"Stronger tendency for brown eyes"}
  ]}
  context 'fetch' do
    it 'should call get on the URL to get trait' do
      result = subject.fetch("eye-color","GENOMELINKTEST001")
      expect(result.summary).to eq({"score"=>0, "text"=>"Tend to not have brown eyes", "warnings"=>[]})
      expect(result.phenotype).to eq({"url_name"=>"eye-color", "display_name"=>"Genetic eye color", "category"=>"trait"})
      expect(result.population).to eq("european")
      expect(result.scores - scores).to eq([])
    end
  end
end
