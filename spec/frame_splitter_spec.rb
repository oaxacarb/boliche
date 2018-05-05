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

  context "when the input is '1/145123451234512345'" do
    let(:input) { '1/145123451234512345' }

    it "split frames correctly" do
      expected = ["1/1", "14", "51", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '1/135123451234512345'" do
    let(:input) { '1/135123451234512345' }

    it "split frames correctly" do
      expected = ["1/1", "13", "51", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '1/125123451234512345'" do
    let(:input) { '1/125123451234512345' }

    it "split frames correctly" do
      expected = ["1/1", "12", "51", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '251/1123451234512345'" do
    let(:input) { '251/1123451234512345' }

    it "split frames correctly" do
      expected = ["25", "1/1", "11", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '251/1323451234512345'" do
    let(:input) { '251/1323451234512345' }

    it "split frames correctly" do
      expected = ["25", "1/1", "13", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '25113/23451234512345'" do
    let(:input) { '25113/23451234512345' }

    it "split frames correctly" do
      expected = ["25", "11", "3/2", "23", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '25113/21451234512345'" do
    let(:input) { '25113/21451234512345' }

    it "split frames correctly" do
      expected = ["25", "11", "3/2", "21", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '25113/27451234512345'" do
    let(:input) { '25113/27451234512345' }

    it "split frames correctly" do
      expected = ["25", "11", "3/2", "27", "45", "12", "34", "51", "23", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '251132745123451/3/45'" do
    let(:input) { '251132745123451/3/45' }

    it "split frames correctly" do
      expected = ["25", "11", "32", "74", "51", "23", "45", "1/3", "3/4", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '251132745123451/4/45'" do
    let(:input) { '251132745123451/4/45' }

    it "split frames correctly" do
      expected = ["25", "11", "32", "74", "51", "23", "45", "1/4", "4/4", "45"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '251132745123451/3/44'" do
    let(:input) { '251132745123451/3/44' }

    it "split frames correctly" do
      expected = ["25", "11", "32", "74", "51", "23", "45", "1/3", "3/4", "44"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '2/113274512345113/44'" do
    let(:input) { '2/113274512345113/44' }

    it "split frames correctly" do
      expected = ["2/1", "11", "32", "74", "51", "23", "45", "11", "3/4", "44"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '2/213274512345113/44'" do
    let(:input) { '2/213274512345113/44' }

    it "split frames correctly" do
      expected = ["2/2", "21", "32", "74", "51", "23", "45", "11", "3/4", "44"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '2/313274512345113/44'" do
    let(:input) { '2/313274512345113/44' }

    it "split frames correctly" do
      expected = ["2/3", "31", "32", "74", "51", "23", "45", "11", "3/4", "44"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end

  context "when the input is '231/23745123451/1344'" do
    let(:input) { '231/23745123451/1344' }

    it "split frames correctly" do
      expected = ["23", "1/2", "23", "74", "51", "23", "45", "1/1", "13", "44"]
      splitter = FrameSplitter.new(input)
      expect(splitter.frames).to eq expected
    end
  end
end
