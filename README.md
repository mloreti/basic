# Basic API with auth

### Sign up
```
curl -d '{"user":{"email":"email@email.com", "password":"password", "first_name":"Big", "last_name":"Boy"}}' -H "Content-Type: application/json" -X POST http://localhost:3000/users
```

### Sign in
```
 curl -d '{"email":"email@email.com", "password":"password"}' -H "Content-Type: application/json" -X POST http://localhost:3000/user_token
```

### Get data from authenticated route
```
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer {token}" -X GET http://localhost:3000/users/1
```
