scheduler = Rufus::Scheduler.new
scheduler.every '5m' do 
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
    Bitcoin.create({
        _hash: result[:_hash],
        total: result[:total],
        fees: result[:fees],
        inputs: result[:inputs],
        outputs: result[:outputs]
    })
end