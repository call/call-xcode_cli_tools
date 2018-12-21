# xcodeclitools

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with XcodeCLI](#setup)
    * [What XcodeCLI affects](#what-xcodecli-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with XcodeCLI](#beginning-with-xcodecli)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module installs Xcode Command Line Tools. Works with Puppet >= 4.x and OS X >= 10.9.

Idempotency is satisfied via a custom fact, which provides information of existing Xcode and Xcode Command Line Tools installation. If no Xcode installation or Xcode Command Line Tools installation is found, the module proceeds with installation.

Xcode CLI tools are expected to be found via pkgutil and Xcode is expected to be found in specified location (defaulting to standard /Applications/Xcode).

## Setup

### What XcodeCLI affects

This module will install XCode Command Line Tools. Additionally, the module introduces the following new facts:
- xcode_installed
- xcode_version
- xcode_cli_installed

<!--
If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices. -->

### Setup Requirements

Requires Apple SUS to be configured properly. If you don't know how to configure it, don't worry, the Apple defaults will work just fine.

<!-- If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here. -->

### Beginning with XcodeCLI
<!--
The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module. -->

## Usage
<!--
This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module. -->

## Reference

Class XcodeCLI:
- installs Xcode Command Line Tools

Facts:
- xcode_installed
- xcodeversion
- xcode_cli_installed

<!--
Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se. -->

## Limitations

Requires OS X version to be newer than 10.9 Mavericks. This module will not work on older OS X versions.

This module is tested with Puppet 4 and might not work on older versions.

## Development

Contributions and pull requests are welcome.

Original work Copyright 2016 Tampere University of Technology

Modified work Copyright 2018 Brian Call

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Original Author

Original credit for this module goes to
[Antti Pettinen](https://github.com/apettinen) at Tampere University of Technology.
