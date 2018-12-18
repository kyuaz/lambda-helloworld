const expect = require('expect');
const hello = require('../helloworld');

describe('hello world test', () => {
    it('func hello() return value', () => {
        expect(hello()).toBe('hello world');
    });
});
