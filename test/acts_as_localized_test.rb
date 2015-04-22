require 'minitest/autorun'
require 'active_record'
require 'i18n'
require 'acts_as_localized'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

class MiniTest::Test
  def capture_stdout(&block)
    real_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = real_stdout
  end

  def setup_db
    capture_stdout do
      ActiveRecord::Schema.define(:version => 1) do
        create_table :test_models do |t|
          t.string :attr_en
          t.string :attr_fr
        end
      end
    end
  end

  def teardown_db
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table(table)
    end
  end
end

class TestModel < ActiveRecord::Base
  include ActsAsLocalized
  acts_as_localized :attr
end

class ActsAsLocalizedTest < MiniTest::Test

  def setup
    setup_db
    I18n.enforce_available_locales = false
    I18n.locale = :en
  end

  def teardown
    teardown_db
  end

  def test_reader
    model = TestModel.create!(
      :attr_en  => 'content EN',
      :attr_fr  => 'content FR'
    )
    assert_equal 'content EN', model.attr
    I18n.locale = :fr
    assert_equal 'content FR', model.attr

    begin
      I18n.locale = :invalid
      model.attr
    rescue => e
      assert e.is_a?(NoMethodError)
    end
  end

  def test_writer
    model = TestModel.create!(
      :attr => 'content EN'
    )
    assert_equal 'content EN',  model.attr
    assert_equal 'content EN',  model.attr_en
    assert_equal nil,           model.attr_fr

    I18n.locale = :fr
    model.update_attribute(:attr, 'content FR')
    assert_equal 'content FR', model.attr_fr

    begin
      I18n.locale = :invalid
      model.attr = 'invalid'
    rescue => e
      assert e.is_a?(NoMethodError)
    end
  end

end
