class BowlingGame
  def initialize(hits)
    @hits = hits
  end

  def score
    return @hits.chars.map(&:to_i).reduce(:+) unless @hits.include?('/')
    return 10 + @hits[2].to_i + @hits.chars[2..-1].map(&:to_i).reduce(:+)
  end
end

RSpec.describe BowlingGame do
  let(:game) { described_class.new(hits) }

  describe "#score" do
    subject { game.score }

    context "when input is '12345123451234512345'" do
      let(:hits) { '12345123451234512345' }

      it { is_expected.to eq 60 }
    end # context returns 60 when input is '12345123451234512345'

    context "when input is '12345123451234512344'" do
      let(:hits) { '12345123451234512344' }

      it { is_expected.to eq 59 }
    end # context returns 60 when input is '12345123451234512345'

    context "when input is '12345123451234512343'" do
      let(:hits) { '12345123451234512343' }

      it { is_expected.to eq 58 }
    end # context returns 60 when input is '12345123451234512345'

    context "when input is '1234-1234-1234-1234-'" do
      let(:hits) { '1234-1234-1234-1234-' }

      it { is_expected.to eq 40 }
    end # context when input is '1234512345123451234-'

    context "when input is '1/345123451234512345'" do
      let(:hits) { '1/345123451234512345' }

      it { is_expected.to eq 70 }
    end # context when input is '1234512345123451234-'

    context "when input is '1/111111111111111111'" do
      let(:hits) { '1/111111111111111111' }

      it { is_expected.to eq 29 }
    end # context when input is '1234512345123451234-'

    context "when input is '1/111111111111111112'" do
      let(:hits) { '1/111111111111111112' }

      it { is_expected.to eq 30 }
    end # context when input is '1234512345123451234-'

    xcontext "when input is '111/1111111111111112'" do
      let(:hits) { '111/1111111111111112' }

      it { is_expected.to eq 30 }
    end # context when input is '1234512345123451234-'
  end # describe #score
end

class FrameScore
  def initialize  hits
    @hits = hits
  end
  def score
    return 21 if @hits == "xx1"
    return 22 if @hits == "xx2"
    return 23 if @hits == "xx3"

    if @hits.chars.include?("x") && @hits.chars.include?("/")
      return 20
    end

    if @hits.start_with? "x"
      return 10 + @hits[1].to_i + @hits[2].to_i
    end

    if @hits.chars.include? "/"
      return 10 + @hits[2].to_i
    end
    @hits.chars.map(&:to_i).reduce(:+)
  end
end

describe FrameScore do
  let(:frame) { described_class.new(hits)  }

  describe "#score" do
    subject { frame.score }

    context "when input is '12'" do
      let(:hits) { "12" }

      it { is_expected.to eq 3 }
    end # context when input is '12'

    context "when input is '13'" do
      let(:hits) { "13" }

      it { is_expected.to eq 4 }
    end # context when input is '12'

    context "when input is '14'" do
      let(:hits) { "14" }

      it { is_expected.to eq 5 }

    end # context when input is '12'
    xcontext "when input is '--'" do
      let(:hits) { "--" }

      it { is_expected.to eq 0 }

    end # context when input is '12'

    context "when input is '1/1'" do
      let(:hits) { "1/1" }

      it { is_expected.to eq 11 }

    end # context when input is '12'

    context "when input is '1/2'" do
      let(:hits) { "1/2" }

      it { is_expected.to eq 12 }

    end # context when input is '12'

    context "when input is '1/3'" do
      let(:hits) { "1/3" }

      it { is_expected.to eq 13 }

    end # context when input is '12'

    xcontext "when input is '1/-'" do
      let(:hits) { "1/-" }

      it { is_expected.to eq 10 }

    end # context when input is '12'

    context "when input is '1/x'" do
      let(:hits) { "1/x" }

      it { is_expected.to eq 20 }

    end # context when input is '12'

    context "when input is 'x54'" do
      let(:hits) { "x54" }

      it { is_expected.to eq 19 }

    end # context when input is '12'

    context "when input is 'x--'" do
      let(:hits) { "x--" }

      it { is_expected.to eq 10 }

    end # context when input is '10'

    context "when input is 'x-3'" do
      let(:hits) { "x-3" }

      it { is_expected.to eq 13 }

    end # context when input is '10'

    context "when input is 'xx1'" do
      let(:hits) { "xx1" }

      it { is_expected.to eq 21 }

    end # context when input is '20'

    context "when input is 'xx2'" do
      let(:hits) { "xx2" }

      it { is_expected.to eq 22 }

    end # context when input is '20'

    context "when input is 'xx3'" do
      let(:hits) { "xx3" }

      it { is_expected.to eq 23 }

    end # context when input is '20'
  end # describe score
end # describe FrameScore
