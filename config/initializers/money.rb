MoneyRails.configure do |config|
  config.register_currency = {
    priority: 1,
    iso_code: 'BTC',
    name: 'bitcoin',
    symbol: 'BTC',
    symbol_first: false,
    subunit: 'Subcent',
    subunit_to_unit: 10000,
    thousands_separator: '.',
    decimal_mark: '.',
    no_cents_if_whole: false
  }
  config.default_currency = 'BTC'
end