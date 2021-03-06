require_relative "../linked_list"

describe LinkedList do
  describe ".new" do
    it "returns an empty list" do
      expect(LinkedList.new).to be_empty
    end
  end

  describe "#unshift" do
    let(:list) { LinkedList.new }

    it "increases length of list by 1" do
      expect {
        list.unshift(5)
      }.to change(list, :length).by(1)
    end

    it "prepends the given value to the list" do
      expect {
        list.unshift(5)
      }.to change(list, :first).from(nil).to(5)
    end

    it "returns the list itself" do
      expect(list.unshift(5)).to eq(list)
    end

    context "when list is empty" do
      let(:list) { LinkedList.new }

      it "flags the list as non-empty" do
        expect {
          list.unshift(5)
        }.to change(list, :empty?).from(true).to(false)
      end
    end
  end

  describe "#shift" do
    let(:list) { LinkedList.new }

    context "when the list is non-empty" do
      before { list.unshift(5) }

      it "flags the list as empty" do
        expect {
          list.shift
        }.to change(list, :empty?).from(false).to(true)
      end

      it "returns the first value on the list" do
        list.unshift(7227)

        expect(list.shift).to eq(7227)
      end
    end

    context "when the list is empty" do
      it "returns nil" do
        expect(list.shift).to be_nil
      end

      it "keeps the list flagged as empty" do
        expect {
          list.shift
        }.not_to change(list, :empty?).from(true)
      end

      it "keeps the list size at 0" do
        expect {
          list.shift
        }.not_to change(list, :length).from(0)
      end
    end
  end
end
