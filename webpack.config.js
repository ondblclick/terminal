var ExtractTextPlugin = require ('extract-text-webpack-plugin');
var webpack = require('webpack');

module.exports = {
  entry: {
    index: './app/javascripts/index.js'
  },
  output: {
    path: './dist',
    filename: 'javascripts/index.js'
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' },
      { test: /\.scss$/, loader: ExtractTextPlugin.extract('css!sass') },
      { test: /\.png$/, loader: 'file-loader?name=/images/[name].[ext]' },
      { test: /\.(eot|svg|ttf|woff)$/, loader: 'file-loader?name=/fonts/[name].[ext]' },
      { test: /\.html$/, loader: 'file-loader?name=/[name].[ext]' },
      { test: /\.mp3$/, loader: 'file-loader?name=/audios/[name].[ext]' },
      { test: /\.hbs$/, loader: 'handlebars-loader' }
    ]
  },
  plugins: [
    new ExtractTextPlugin('stylesheets/index.css')
  ],
  devtool: "#cheap-module-eval-source-map"
};
