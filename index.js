// Generated by CoffeeScript 1.8.0
(function() {
  var Null, stream,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  stream = require('stream');

  Null = (function(_super) {
    __extends(Null, _super);

    function Null() {
      return Null.__super__.constructor.apply(this, arguments);
    }

    Null.prototype._read = function(size) {
      return this.push(null);
    };

    Null.prototype._write = function(chunk, encoding, cb) {
      return cb();
    };

    Null.prototype.end = function(chunk, encoding, cb) {
      if (cb) {
        return cb();
      }
    };

    return Null;

  })(stream.PassThrough);

  stream.Null = new Null();

}).call(this);