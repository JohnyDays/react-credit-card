
React = require('react')
Card  = require('../build/card.js')
lorem = '
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent
  mauris. Fusce nec tellus sed augue semper porta. Mauris massa.
'
Card = React.render(
  <Card shinyAfterBack = {lorem} />,
document.getElementById('container'))

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

    if name is 'expiry' and value.match /\//
      obj[name] = value.replace('/', '')

    Card.setProps obj

React.render(
  <div className='form'>
    <input
      type        = 'number'
      onFocus     = {focus('number')}
      onBlur      = {unfocus('number')}
      onInput     = {value('number')}
      placeholder = '**** **** **** ****'
    />
    <input
      type        = 'text'
      onFocus     = {focus('name')}
      onBlur      = {unfocus('name')}
      onInput     = {value('name')}
      placeholder = 'Full Name'
    />
    <input
      type        = 'text'
      onFocus     = {focus('expiry')}
      onBlur      = {unfocus('expiry')}
      onInput     = {value('expiry')}
      placeholder = '**/**'
    />
    <input
      type        = 'number'
      onFocus     = {focus('cvc')}
      onBlur      = {unfocus('cvc')}
      onInput     = {value('cvc')}
      placeholder = '***'
    />
  </div>
, document.getElementById('form'))
