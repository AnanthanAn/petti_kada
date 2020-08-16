const functions = require('firebase-functions');

exports.myFunction = functions.firestore
  .document('orders/{doc-id}')
  .onWrite((change, context) => {
   var sendNotification = function(data) {
     var headers = {
       "Content-Type": "application/json; charset=utf-8",
       "Authorization": "Basic NGEwMGZmMjItY2NkNy0xMWUzLTk5ZDUtMDAwYzI5NDBlNjJj"
     };

     var options = {
       host: "onesignal.com",
       port: 443,
       path: "/api/v1/notifications",
       method: "POST",
       headers: headers
     };

     var https = require('https');
     var req = https.request(options, function(res) {
       res.on('data', function(data) {
         console.log("Response:");
         console.log(JSON.parse(data));
       });
     });

     req.on('error', function(e) {
       console.log("ERROR:");
       console.log(e);
     });

     req.write(JSON.stringify(data));
     req.end();
   };

   var message = {
     app_id: "68b3c9a5-359f-4155-8cd7-a25ca03656da",
     contents: {"en": "English Message"},
     included_segments: ["All"]
   };

   sendNotification(message);
   });