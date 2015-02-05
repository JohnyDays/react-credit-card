
React = require('react')
Card  = require('../build/card.js')

Card = React.render(<Card />, document.getElementById('container'))

focused = null

focus = (name)->
  return ->
    focused = name
    Card.setProps focused:name

unfocus = (name)->
  return ->
    if focused is name
      Card.setProps focused: null

value = (name)->
  return (event)->
    value = event.target.value
    obj = {}
    obj[name] = value
    Card.setProps obj

React.render(
  <div className='form'>
    <input
      type = 'text'
      onFocus = {focus('name')}
      onBlur = {unfocus('name')}
      onInput = {value('name')}
    />
    <input
      type = 'text'
      onFocus = {focus('expiry')}
      onBlur = {unfocus('expiry')}
      onInput = {value('expiry')}
    />
    <input
      type = 'text'
      onFocus = {focus('cvc')}
      onBlur = {unfocus('cvc')}
      onInput = {value('cvc')}
    />
  </div>
, document.getElementById('form'))
