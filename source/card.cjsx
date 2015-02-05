
React = require('react')

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

  render:->
    <div className = {"react-card" + if @props.focused is "cvc" then " react-card--flipped" else ""} >

      <div className = "react-card__front" >
        <div className = "react-card__lower">
          <div className = "react-card__shiny"/>
          <div className = {@displayClassName("number")}>{@getValue("number")}</div>
          <div className = {@displayClassName("name")}  >{@getValue("name")}</div>
          <div
            className = {@displayClassName("expiry")}
            data-before = {@props.expiryBefore}
            data-after = {@props.expiryAfter}
                                                        >{@getValue("expiry")}</div>
        </div>
      </div>

      <div className = "react-card__back">
        <div className = {@displayClassName("cvc")}>{@getValue("cvc")}</div>
      </div>
    </div>

  displayClassName:(base)->
    className = "react-card__" + base + " react-card__display"

    if @props.focused is base
      className += " react-card--focused"

    return className

  getValue:(name)-> @[name]()

  number:->
    if !@props.number
      return "**** **** **** ****"
    else
      string = @props.number.toString()
      amount_of_spaces = Math.floor(string.length/4)
      for i in [1...amount_of_spaces] by step
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
