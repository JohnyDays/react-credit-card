
React = require('react')
cards = require('./card-types.js')

prefix = "react-card"

module.exports = React.createClass

  displayName: 'Card'

  getDefaultProps:->
    number: null
    cvc: null
    name: ''
    expiry: ''
    focused: null
    expiryBefore: 'month/year'
    expiryAfter: 'valid thru'
    shinyAfterBack: ''

  render:->
    <div className = {"#{prefix} " + @state.type.name + if @props.focused is "cvc" then " #{prefix}--flipped" else ""} >

      <div className = "#{prefix}__front" >
        <div className = "#{prefix}__lower">
          <div className = "#{prefix}__shiny"/>
          <div className = {@displayClassName("number")}>{@getValue("number")}</div>
          <div className = {@displayClassName("name")}  >{@getValue("name")}</div>
          <div
            className = {@displayClassName("expiry")}
            data-before = {@props.expiryBefore}
            data-after = {@props.expiryAfter}
                                                        >{@getValue("expiry")}</div>
        </div>
      </div>

      <div className = "#{prefix}__back">
        <div className = "#{prefix}__bar"/>
        <div className = {@displayClassName("cvc")}>{@getValue("cvc")}</div>
        <div className = "#{prefix}__shiny" data-after = {@props.shinyAfterBack}/>
      </div>
    </div>

  displayClassName:(base)->
    className = "#{prefix}__" + base + " #{prefix}__display"

    if @props.focused is base
      className += " #{prefix}--focused"

    return className

  getValue:(name)-> @[name]()

  componentWillMount:       -> @updateType()
  componentWillReceiveProps:-> @updateType()
  getInitialState:          -> name:"unknown", length: 16
  updateType:->

    if !@props.number
      return @setState type: name:"unknown", length: 16

    for card in cards
      if card.pattern.test @props.number.toString()
        return @setState type: card

    return @setState type: name:"unknown", length: 16


  number:->
    if !@props.number
      return "**** **** **** ****"
    else
      string = @props.number.toString()
      if string.length > @state.type.length then string = string.slice(0, @state.type.length)
      amount_of_spaces = Math.ceil(string.length/4)
      for i in [1...amount_of_spaces]
        space_index = (i*4 + (i - 1))
        string = string.slice(0, space_index) + " " + string.slice(space_index)
      return string

  name:->
    if @props.name is ""
      return "FULL NAME"
    else
      return @props.name

  expiry:->
    if @props.expiry is ""
      return "**/**"
    else
      return @props.expiry

  cvc:->
    if @props.cvc is null
      return "***"
    else
      return @props.cvc
