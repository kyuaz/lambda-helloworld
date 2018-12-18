let hello = require('./helloworld');

exports.handler = (event, context, callback) => {
    console.log(hello());
};
