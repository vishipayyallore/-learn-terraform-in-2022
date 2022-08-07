console.log('Loading function');
exports.handler = function (event, context) {
  console.log(JSON.stringify(event, null, 2));
  var message = JSON.parse(event.Records[0].Sns.Message);
  if (message.cook_secs < message.req_secs) {
    if (message.pre) {
      context.succeed("User ended " + message.pre + " preset early");
    }
    else {
      context.succeed("User ended custom cook time early");
    }
  }
  context.succeed();
};