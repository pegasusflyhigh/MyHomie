class ReservationPayloadParser

  def initialize(raw_payload)
    @payload = raw_payload.with_indifferent_access
  end

  attr_accessor :payload, :parsed_payload

  def call
    guest_hash
    reservation_hash
  end

  private

  def reservation_hash
    reservation_aliases = Reservation::ATTRIBUTE_ALIASES.except(:guest)
    sanitized_data = sanitize_raw_data(payload, reservation_aliases)
    raw_hashes = payload.values_at(*reservation_aliases[:extra_keys]).compact

    raw_hashes.each do |raw_hash|
      sanitized_data.merge!(sanitize_raw_data(raw_hash, reservation_aliases))
    end
    
    sanitized_data.each {|key, values| sanitized_data[key] = values.first}
    parsed_payload.merge!(sanitized_data)
  end

  def guest_hash
    raw_guest_hash = payload.values_at(*[:guest] + Reservation::ATTRIBUTE_ALIASES[:guest]).compact.first || payload
    sanitized_data = sanitize_raw_data(raw_guest_hash, Guest::ATTRIBUTE_ALIASES )
    sanitized_data.except(:phone_numbers).each {|key, values| sanitized_data[key] = values.first}
    parsed_payload[:guest] = sanitized_data
  end

  def sanitize_raw_data(raw_data, aliases)
    aliases.except(:extra_keys).each_with_object({}) do |(key, value), hash|
      data = raw_data.values_at(*value + [key]).flatten.compact
      hash[key] = data if data.present?
    end
  end

  def parsed_payload
    @parsed_payload ||= {}
  end
end