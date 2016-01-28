#
# Copyright 2015 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "chefspec"
default_version "master"

source git: "https://github.com/sethvargo/chefspec"

dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "chef"
dependency "fauxhai"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle "install --without development", env: env

  gem "build chefspec.gemspec", env: env
  gem "install chefspec-*.gem" \
      " --no-ri --no-rdoc", env: env
end