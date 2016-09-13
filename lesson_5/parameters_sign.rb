require 'digest/md5'

# Server1

secret_key = 'super secret 42'

params = { id: 21, login: 'Mr.Black' }

# p params.values.push(secret_key)
# p params.values.push(secret_key).join('_-_')

key = Digest::MD5.hexdigest(params.values.push(secret_key).join('_-_'))

params[:key] = key

# p params

# \/


# => KidHacker
  params[:id] = 100

p params

# Server2

secret_key = 'super secret 42'

# params = { id: 21, login: 'Mr.Black' }

key = params.delete :key

p Digest::MD5.hexdigest(params.values.push(secret_key).join('_-_')) == key
