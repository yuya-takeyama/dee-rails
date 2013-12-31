class FooServceProvider < Dee::Rails::ServiceProvider
  provide do
    self['foo.name'] = 'FOO'

    singleton 'foo.singleton' do
      Foo.new self['foo.name']
    end

    factory 'foo.factory' do
      Foo.new self['foo.name']
    end
  end
end
