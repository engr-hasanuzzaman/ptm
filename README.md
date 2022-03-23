# Ptm

`ptm (Personal Task Manager)` is a Ruby  `gem` that provide command line inteface to manage our personal tasks list on terminal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ptm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ptm

## Usage
### show all task list
`ptm list`
 
### add new task
 add new task with default 'default' category
 `ptm add_task 'this is test title'`
 
  add new task with under 'test_category' category
 `ptm add_task 'this is test title' -c='test_category'`
  
### remove all tasks
`ptm remove_tasks`
    
### remove task by provide id
`ptm remove_tasks --id=1` # this id has been uesed during show list    


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ptm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

Copyright (C) 2017 Hasanuzzaman Sumon

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

