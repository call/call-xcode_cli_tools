#!/usr/bin/env ruby
# xcode_installed.rb
# This Facter custom fact returns Xcode version
# Currently supports only Xcode installed in default dir (/Application/Xcode)
# Antti Pettinen
# Copyright: Tampere University of Technology
require 'facter'
Facter.add(:xcode_version) do
  confine :kernel => 'Darwin'
  setcode do
    if File.exists? '/Applications/Xcode/Contents/Info.plist'
      # Facter::Core::Execution.exec('/usr/bin/defaults read '/Applications/Xcode.app/Contents/Info' CFBundleShortVersionString')
      require 'CFPropertyList'
      CFPropertyList.native_types(CFPropertyList::List.new(:file => "/Applications/Xcode.app/Contents/Info.plist").value)['CFBundleShortVersionString']
    end
  end
end
