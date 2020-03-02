require_relative 'spec_helper'

describe "working with hashes" do
  describe "instantiating" do
    describe "my_hash_creator" do
      it "accepts a key and a value as parameters and returns a hash with this key/value pair inside" do
        expect(my_hash_creator(:name, 'Grace Hopper')).to be_a(Hash)
        expect(my_hash_creator(:name, 'Grace Hopper')).to eq({name: 'Grace Hopper'})

        expect(my_hash_creator(1, 2)).to eq({1 => 2})
      end
    end
  end

  describe "read_from_hash" do
    it "returns the value corresponding to the provided key" do
      expect(read_from_hash({name: 'Steve'}, :name)).to eq('Steve')
      expect(read_from_hash({'name' => 'Tzvi'}, 'name')).to eq('Tzvi')
    end

    it "returns nil if the key is not found in the provided hash" do
      expect(read_from_hash({age: 31}, :name)).to eq(nil)
    end
  end

  describe "updating data in a hash" do
    describe "update_counting_hash" do
      it "accepts a hash and key as parameters" do
        expect{ update_counting_hash({},'hello') }.to_not raise_error
      end
  
      it "if key is not present, returns a hash with the provided key assigned to the value of 1" do
        expect(update_counting_hash({},'hello')).to eq({'hello' => 1})
        expect(update_counting_hash({total: 5},:age)).to eq({total: 5, age: 1})
      end
  
      it "if key is present, returns a hash where the key's value is incremented by 1" do
        expect(update_counting_hash({count: 5},:count)).to eq({count: 6})
        expect(update_counting_hash({'number' => 1, 'amount' => 50},'number')).to eq({'number' => 2, 'amount' => 50})
      end
    end

end

describe "reading data from a hash" do
  
end



end
