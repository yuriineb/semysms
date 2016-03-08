require 'semysms/version'
require 'httparty'

module Semysms
  class Sms
    include HTTParty
    def initialize(token)
      @token = token
    end

    def outbox_sms(device, params={})
      url = 'https://semysms.net/api/3/outbox_sms.php'
      start_id = params[:start_id] ||= nil
      end_id = params[:end_id] ||= nil
      list_id = params[:list_id] ||= nil
      date_start = params[:date_start] ||= nil
      date_end = params[:date_end] ||= nil
      url_params = { }
      url_params.merge! token: @token, device: device
      url_params.merge! start_id: start_id if start_id
      url_params.merge! end_id: end_id if end_id
      url_params.merge! list_id: list_id.join(', ') if list_id
      url_params.merge! date_start: date_start if date_start
      url_params.merge! date_end: date_end if date_end
      http_get url, url_params
    end

    def inbox_sms(device, params={})
      url = 'https://semysms.net/api/3/inbox_sms.php'
      start_id = params[:start_id] ||= nil
      end_id = params[:end_id] ||= nil
      url_params = { }
      url_params.merge! token: @token, device: device
      url_params.merge! start_id: start_id if start_id
      url_params.merge! end_id: end_id if end_id
      http_get url, url_params
    end

    def devices(params = {})
      url = 'https://semysms.net/api/3/devices.php'
      is_arhive = params[:is_arhive] ||= nil
      list_id = params[:list_id] ||= nil
      url_params = { }
      url_params.merge! token: @token
      url_params.merge! is_arhive: is_arhive if is_arhive
      url_params.merge! list_id: list_id.join(', ') if list_id
      http_get url, url_params
    end

    def send(device, phone, msg, params={})
      url = 'https://semysms.net/api/3/sms.php'
      priority = params[:priority] ||= nil
      name = params[:name] ||= nil
      surname = params[:surname] ||= nil
      url_params = { }
      url_params.merge! token: @token, device: device, phone: phone, msg: msg
      url_params.merge! priority: priority if priority
      url_params.merge! name: name if name
      url_params.merge! surname: surname if surname
      http_get url, url_params
    end

    def cancel_sms_from_sms(id_sms)
      url = 'https://semysms.net/api/3/cancel_sms.php'
      url_params = { }
      url_params.merge! token: @token, id_sms: id_sms
      http_get url, url_params
    end

    def cancel_sms_from_device(device)
      url = 'https://semysms.net/api/3/cancel_sms.php'
      url_params = { }
      url_params.merge! token: @token, device: device
      http_get url, url_params
    end

    private

    def http_get(url, url_params)
      JSON.parse @response = self.class.get(url, { query: url_params })
    end


  end
end
