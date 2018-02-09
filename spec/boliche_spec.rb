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

describe FrameScore do
  let(:frame) { described_class.new(hits)  }

  describe "#score" do
    subject { frame.score }

    context "when input is '12'" do
      let(:hits) { "12" }

      it { is_expected.to eq 3 }
    end # context when input is '12'
  end # describe score
end # describe FrameScore
