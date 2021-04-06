module RequestHelpers
    def response_json
        JSON.parse(response.body)
    end
    def authenticated_header(user)
        payload = {user_id: user.id}
        token = JWT.encode(payload, "netcents")
        { 'Authorization': "Bearer #{token}" }
    end
end
