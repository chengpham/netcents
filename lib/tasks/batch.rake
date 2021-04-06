namespace :batch do
  desc "Retrieves Bitcoin Data"
  task retrieve_bitcoins: :environment do
    response = RestClient.get 'https://api.blockcypher.com/v1/btc/main/txs'
    json = JSON.parse response
    results = json.map do |bct|
        {
            _hash: bct['hash'],
            total: bct['total'],
            fees: bct['fees'],
            inputs: bct['inputs'].map do |i|
                {
                    prev_hash: i['prev_hash'],
                    output_value: i['output_value'],
                    addresses: i['addresses']
                }
            end,
            outputs: bct['outputs'].map do |i|
                {
                    value: i['value'],
                    addresses: i['addresses']
                }
            end
        }
    end
    result = results.max_by{ |v| v[:total] }

    bitcoin = Bitcoin.create({
        _hash: result[:_hash],
        total: result[:total],
        fees: result[:fees]
    })
    if bitcoin.valid?
        bitcoin.inputs = result[:inputs].map do |input|
            Input.new({
                prev_hash: input[:prev_hash],
                output_value: input[:output_value],
                addresses: input[:addresses]
            })
        end
        bitcoin.outputs = result[:outputs].map do |output|
            Output.new({
                value: output[:value],
                addresses: output[:addresses]
            })
        end
    end
  end
end
