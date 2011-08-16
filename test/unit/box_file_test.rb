require 'test_helper'

class BoxFileTest < ActiveSupport::TestCase
  test "folder_tree" do
    xml = IO.read('test/fixtures/box_xml.xml')
    test_hash = {"openftp"=>{:id=>"103995138", :files=>[{:id=>"862970270", :name=>"LSRC-2011 Notes.txt"}, {:id=>"863657556", :name=>"scott_t.png"}]}, "Public"=>{:id=>"103986262", :files=>[{:id=>"862896346", :name=>"LSRC-2011 Notes.txt"}]}}
    hash  = BoxFile.folder_tree(xml)
    assert_equal(test_hash, hash)
  end
end
