var _      = require('underscore');
var React  = require('react/addons');
var Cursor = require('react-cursor').Cursor;
var ImmutableOptimizations = require('react-cursor').ImmutableOptimizations;
require('./App.less');

'use strict';

var App = React.createClass({
  getInitialState: function () {
    return {
      very: {
        deeply: {
          nested: {
            counts: _.range(400).map(function () { return 0; })
          }
        }
      }
    };
  },

  render: function () {
    var cursor = Cursor.build(this);
    var counts = cursor.refine('very', 'deeply', 'nested', 'counts');
    var contents = counts.value.map(function (count, index) {
      return (
        <Clicker
          key={index}
          cursor={counts.refine(index)}
        />
      )
    }.bind(this));

    return (
      <div className="App">
        <div>{contents}</div>
        <pre>{JSON.stringify(cursor.value, undefined, 2)}</pre>
      </div>
    );
  }
});

var Clicker = React.createClass({
  mixins: [ImmutableOptimizations(['cursor'])],

  render: function () {
    console.log('rendering clicker ', this.props.key);
    return (
      <div>
        <input type="text" value={this.props.cursor.value} onChange={this.onInputChange} />
        <span>{this.props.cursor.value}</span>
        <button onClick={this.inc2}>+2</button>
        <button onClick={this.inc10}>+10</button>
      </div>
    );
  },

  onInputChange: function (e) {
    var nextValue = parseInt(e.target.value, 10);
    if (isNaN(nextValue)) nextValue = '';
    this.props.cursor.set(nextValue);
  },

  inc2: function () {
    this.props.cursor.set(function (s) { return s + 1; });
    this.props.cursor.set(function (s) { return s + 1; });
  },

  inc10: function () {
    this.props.cursor.set(function (s) { return s + 10; });
  }
});

module.exports = App;
