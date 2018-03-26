require 'frame_splitter'

describe FrameSplitter do
  context "when the input is '12345123451234512345'" do
    let(:input) { '12345123451234512345' }

    it "split frames correctly" do
      expected = ["12", "34", "51", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '11345123451234512345'" do
    let(:input) { '11345123451234512345' }

    it "split frames correctly" do
      expected = ["11", "34", "51", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '11145123451234512345'" do
    let(:input) { '11145123451234512345' }

    it "split frames correctly" do
      expected = ["11", "14", "51", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end
end
