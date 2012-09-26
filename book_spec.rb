require "./chap1"

describe Chap1 do
  class Algo
  end

  before(:all) do
    @algo = Algo.new
    @algo.extend Chap1
  end

  subject { @algo }

  let(:array) { [5, 2, 4, 6, 1, 3] }
  let(:sorted_array) { [1, 2, 3, 4, 5, 6] }

  describe "sorting arrays" do
    it { @algo.insertion_sort_asc(array).should == sorted_array }
    it { @algo.insertion_sort_desc(array).should == sorted_array.reverse }
    it { @algo.selection_sort(array).should == sorted_array }
    it { @algo.merge_sort(array).should == sorted_array }
    it { @algo.insert_sort_rec(array).should == sorted_array } 
    it { @algo.insert_sort_with_bin_search(array).should == sorted_array } 
    it { @algo.merge_sort_with_insertion_sort(array).should == sorted_array } 
  end 

  describe "searching problem" do 
    let(:value) { 6 }
    let(:missing_value) { 7 }
    it { @algo.search_for(value, array).should == 3 }
    it { @algo.search_for(missing_value, array).should be nil }
    it { @algo.binary_search(value, sorted_array, 0, array.length - 1).should be 5 }
    it { @algo.binary_search(missing_value, sorted_array, 0, array.length - 1).should be nil }
    describe "determine of any elements sum to be x" do
      it { @algo.find_sum(3, array).should be true }
    end
    describe "repeated occurences?" do
      it { @algo.repeated_occurence?([1,5,7,4,2,3,4], 4).should be true }
      it { @algo.repeated_occurence?([1,5,7,4,2,3], 4).should be false }
    end
  end

  describe "nbit addition" do
    it { @algo.nbit_addition(32, 47).should == 79 }
  end

  describe "merging two arrays in asc order of the elements" do
    it { @algo.merge([1, 3, 5], [2, 4]).should == [1, 2, 3, 4, 5] }
  end


  describe "polynomial evaluation" do
    # array represents polynomial coefficents starting with a0
    it { @algo.peval(5, [3, 2, 4]).should ==  113 }
    it { @algo.horners_rule(5, [3, 2, 4]).should ==  113 }
  end
end
