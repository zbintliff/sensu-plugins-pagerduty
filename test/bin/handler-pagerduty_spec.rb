require 'json'
require_relative '../spec_helper.rb'
require_relative '../../bin/handler-pagerduty.rb'

class PagerdutyHandler
  at_exit do
    exit! 0
  end

  def settings
    @settings ||= fixture('pagerduty_settings.json').read
  end
end

describe 'Handlers' do
  before do
    @handler = PagerdutyHandler.new
  end

  describe '#incident_key' do
    it 'should return incident key with warning' do
      io_obj = fixture('no_override_warning.json')
      @handler.read_event(io_obj)
      incident_key = @handler.incident_key
      expect(incident_key).to eq('i-424242/frontend_http_check/WARNING')
    end

    it 'should return incident key with critical' do
      io_obj = fixture('no_override_critical.json')
      @handler.read_event(io_obj)
      incident_key = @handler.incident_key
      expect(incident_key).to eq('i-424242/frontend_http_check/CRITICAL')
    end

    it 'should return incident key with warning on resolve' do
      io_obj = fixture('recovery_no_override_warning.json')
      @handler.read_event(io_obj)
      incident_key = @handler.incident_key
      expect(incident_key).to eq('i-424242/frontend_http_check/WARNING')
    end

    it 'should return incident key with warning on resolve' do
      io_obj = fixture('recovery_no_override_critical.json')
      @handler.read_event(io_obj)
      incident_key = @handler.incident_key
      expect(incident_key).to eq('i-424242/frontend_http_check/CRITICAL')
    end
  end

  describe '#json_config' do
    it 'should return pagerduty' do
      expect(@handler.json_config).to eq('pagerduty')
    end

    it 'should return custom' do
      json_config = PagerdutyHandler.new('-j custom_key'.split).json_config
      expect(json_config).to eq('custom_key')
    end
  end
end
