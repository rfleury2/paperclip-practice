# Paperclip Practice - Soccer Teams
This repo was created as a practice to learn the [Paperclip](https://github.com/thoughtbot/paperclip "Paperclip") gem, from [Thoughbot](https://thoughtbot.com/ "Thoughtbot").

## What is Paperclip?

Paperclip is a gem that integrates the ability to upload files into our database.  It was developed by Thoughtbot and available as an open source repo on GitHub.

## Setting it Up

Follow the steps on the [Paperclip's README](https://github.com/thoughtbot/paperclip) for complete instructions, but here is a lightweight overview of the most basic parts:

#### Install ImageMagick
ImageMagick is a prerequisite for Paperclip, so make sure to install it first by running:

```
brew install imagemagick
```

There are additional requirements for Windows machines.  Be sure to check out [Paperclip's README](https://github.com/thoughtbot/paperclip) for specific Windows instructions

#### Include Paperclip in the Gemfile

Add Paperclip to the Gemfile through the following code:

```ruby
gem "paperclip", "~> 4.2"
```

## Integrating Paperclip Into Your App

#### Migrations

The rails ```generate paperclip <model_name> <file_field_name>``` will generate the following migration to add the file field:

```ruby
class AddFieldColumnsToModel < ActiveRecord::Migration
  def self.up
    add_attachment :<model_name>, :<file_field_name>
  end

  def self.down
    remove_attachment :<model_name>, :<file_field_name>
  end
end
```

#### Views

##### New

Within the 'new' view form, add the tag ``` <%= form.file_field :<field_name> %>``` in order to allow for the upload file button to appear.

Also, be sure to include the ```html: { :multipart => true }``` to the form_for tag as an optional argument.  This ensures that you can add the file appropriately since Paperclip actually generates more than one field to cover for all of the aspects of the file.

##### Show

Add it as an image tag in Ruby: ```<%= image_tag @user.avatar.url %>```

#### Controllers

Add the most basic version needed, without specific styles as:

```ruby
class <model_name> < ActiveRecord::Base
  has_attached_file :<field_name>
  validates_attachment_content_type :<field_name>, :content_type => /\Aimage\/.*\Z/
end
```
