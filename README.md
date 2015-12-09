## Sensu-Plugins-pagerduty

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-pagerduty.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-pagerduty)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-pagerduty.svg)](http://badge.fury.io/rb/sensu-plugins-pagerduty)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-pagerduty/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-pagerduty)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-pagerduty/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-pagerduty)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-pagerduty.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-pagerduty)
[ ![Codeship Status for sensu-plugins/sensu-plugins-pagerduty](https://codeship.com/projects/115d0f60-d226-0132-a14d-4afb0344239b/status?branch=master)](https://codeship.com/projects/77455)

## Functionality

## Files
 * bin/handler-pagerduty.rb
 * bin/mutator-pagerduty-priority-override.rb

## Usage

PagerDuty supports dedup. Dedup is useful when you want to create a single alert (for a group of checks). Only one alert is sent out even if the checks fail at the same time. The following example groups check_service_`n` together for a single host. `dedup_rules` take in regular expressions as keys and re-write rules as values. `dedup_rules` entry is optional. 

```
{
  "pagerduty": {
    "api_key": "12345",
    "team_name1": {
      "api_key": "23456"
    },
    "team_name2": {
      "api_key": "34567"
    },
    "dedup_rules": {
      "(.*)/check_service_(\\d+)": "\\1/check_service"
    }
  }
}
```
## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
