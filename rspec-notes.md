### rspec

###### Max Output Length
`RSpec::Support::ObjectFormatter.default_instance.max_formatted_output_length = n`

Allows you to increase the length of your rspec outputs so you can see what's actually go wrong in long messages

##### General Tips
- Have a `before(:each)` block to test your shared expectations
- RSpec runs with `RAILS_ENV="test"` so be aware of configurations differences (especially secrets)
- Use [shared_examples](https://relishapp.com/rspec/rspec-core/v/2-0/docs/example-groups/shared-example-group) to abstract testing details
  - You can also use `shared_context` to prevent setting up the same context for different specs
