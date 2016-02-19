var frisby = require('frisby');
var jasmine = require('jasmine');
 
var URL = 'http://192.168.199.111:3000/roles';

 
// frisby.globalSetup({ // globalSetup is for ALL requests 
//   request: {
//     headers: { 'X-Auth-Token': 'fa8426a0-8eaf-4d22-8e13-7c1b16a9370c' }
//   }
// });

frisby.create('GET roles list')
  .get(URL)
  .expectStatus(200)
  .expectJSONTypes({
    success: Boolean,
    roles: Array
  })
  .expectJSON({
    "success": true
  })
.toss();

frisby.create('GET Property types list')
  .get('http://192.168.199.111:3000/property_types')
  .expectStatus(200)
  .expectJSONTypes({
    success: Boolean,
    types: Array
  })
  .expectJSON({
    "success": true
  })
.toss();

frisby.create('GET Property types list')
  .get('http://192.168.199.111:3000/basement_types')
  .expectStatus(200)
  .expectJSONTypes({
    success: Boolean,
    basement_types: Array
  })
  .expectJSON({
    "success": true
  })
.toss();

frisby.create('User Login')
  .post('http://192.168.199.111:3000/users/sign_in?email=admin@mailinator.com&password=password')
    .expectJSONTypes({
      success: Boolean,
      auth_token: String,
      refresh_token: String,
      user: Object,
      user: {
        id: Number,
        email: String,
        role: String,
        avatar: Object,
        full_name: String
      },
    })
    .expectJSON({
      "success": true,
      "user": {
          "id": 55,
          "email": "admin@mailinator.com",
          "role": "admin",
          "avatar": {
          "url": "",
          "profile_url": ""
          },
          "full_name": "Admin  One"
        }
    })
.toss()

