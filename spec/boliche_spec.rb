require "frame_score"

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

    context "when input is 'xx4'" do
      let(:hits) { "xx4" }

      it { is_expected.to eq 24 }

    end # context when input is '20'
    context "when input is 'xxx'" do
      let(:hits) { "xxx" }

      it { is_expected.to eq 30 }

    end # context when input is '30'
  end # describe score
end # describe FrameScore
