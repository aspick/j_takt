# JTakt

Create j-takt (JASRAC reporting form) csv data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'j_takt'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install j_takt

## Usage
```ruby
works = [...] # collect from your system

records = works.map do |work|
  JTakt::Record.new(
    interface_keycode: work.id,
    jasrac_code: work.jasrac_code,
    title: work.title,
    composer: work.composer,
    itv_segment: JTakt::Record::IvtSegment::MUSIC_ONLY,
    request_count: work.request_count
  )
end

report_csv = JTakt::Report.new(records).to_csv
```

