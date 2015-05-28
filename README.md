# ActsAsLocalized
[![Gem Version](https://img.shields.io/gem/v/acts_as_localized.svg?style=flat)](http://rubygems.org/gems/acts_as_localized) [![Gem Downloads](https://img.shields.io/gem/dt/acts_as_localized.svg?style=flat)](http://rubygems.org/gems/acts_as_localized) [![Build Status](https://img.shields.io/travis/GBH/acts_as_localized.svg?style=flat)](https://travis-ci.org/GBH/acts_as_localized)

ActsAsLocalized extends ActiveRecord to add localization mechanism for model attributes.

## Example

```ruby
create_table :pictures do |t|
  t.string :title_en
  t.string :title_fr
  t.text :description_en
  t.text :description_fr
end

class Picture < ActiveRecord::Base
  acts_as_localized :title, :description
end

picture = Picture.create!(
  :title_en       => 'Title EN',
  :title_fr       => 'Title FR',
  :description_en => 'Description EN',
  :description_fr => 'Description FR',
)

I18n.locale = :en
picture.title #=> Title EN
picture.title = 'Updated Title EN' # same as `picture.title_en=`

I18n.locale = :fr
picture.title # => Title FR
picture.title = 'Updated Title FR' # same as `picture.title_fr=`
```

---

Copyright 2015 Oleg Khabarov
