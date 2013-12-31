describe Dee::Rails do
  let(:rails_root) { File.expand_path('../../fixture/rails_app', __FILE__) }

  before do
    require File.join(rails_root, 'lib', 'foo')
  end

  context 'before Dee::Rails.setup! is called' do
    describe 'Dee.container' do
      it 'should be error' do
        expect { Dee.container }.to raise_error
      end
    end
  end

  context 'after Dee::Rails.setup! is called' do
    before do
      ::Rails = double('Rails')
      ::Rails.stub('root').and_return(rails_root)

      Dee::Rails.setup!
    end

    after do
      ::Rails = nil
    end

    describe 'Dee.container' do
      it 'should be Dee::Container' do
        expect(Dee.container).to be_a(Dee::Container)
      end
    end

    describe 'Dee["foo.singleton"]' do
      it 'should be a Foo object' do
        expect(Dee['foo.singleton']).to be_a(Foo)
        expect(Dee['foo.singleton'].name).to be_eql('FOO')
      end

      it 'should be always identical' do
        expect(Dee['foo.singleton']).to be_equal(Dee['foo.singleton'])
      end
    end

    describe 'Dee["foo.factory"]' do
      it 'should be a Foo object' do
        expect(Dee['foo.factory']).to be_a(Foo)
        expect(Dee['foo.factory'].name).to be_eql('FOO')
      end

      it 'should not be identical' do
        expect(Dee['foo.factory']).to_not be_equal(Dee['foo.factory'])
      end
    end

    describe 'Dee["foo.name"]=' do
      it "should override Foo's name" do
        Dee['foo.name'] = 'overridden'
        expect(Dee['foo.singleton'].name).to eq('overridden')
      end
    end
  end
end
