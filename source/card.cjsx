
React   = require('react')
Payment = require('payment')
images  = require('./card-images.js')

validate = Payment.fns
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
    type:null

  render:->
    <div className = "#{exp.prefix}__container">
      <div className = { "#{exp.prefix} " + @typeClassName() + if @props.focused is "cvc" then " #{exp.prefix}--flipped" else ""} >

        <div className = "#{exp.prefix}__front" >
          <div className = "#{exp.prefix}__lower">
            <div className = "#{exp.prefix}__shiny"/>
            <img
                 className = {"#{exp.prefix}__logo " + @typeClassName()}
                 src = {images[@state.type.name]}
            />
            <div className = {@displayClassName("number")}>{@getValue("number")}</div>
            <div className = {@displayClassName("name")}  >{@getValue("name")}</div>
            <div
              className = {@displayClassName("expiry")}
              data-before = {@props.expiryBefore}
              data-after = {@props.expiryAfter}
                                                          >{@getValue("expiry")}</div>
          </div>
        </div>

        <div className = "#{exp.prefix}__back">
          <div className = "#{exp.prefix}__bar"/>
          <div className = {@displayClassName("cvc")}>{@getValue("cvc")}</div>
          <div className = "#{exp.prefix}__shiny" data-after = {@props.shinyAfterBack}/>
        </div>
      </div>
    </div>

  displayClassName:(base)->
    className = "#{exp.prefix}__" + base + " #{exp.prefix}__display"

    if @props.focused is base
      className += " #{exp.prefix}--focused"

    return className

  typeClassName:-> "#{exp.prefix}--" + if @props.type then @props.type else @state.type.name

  getValue:(name)-> @[name]()

  componentWillMount:                  -> @updateType(@props)
  componentWillReceiveProps:(nextProps)-> @updateType(nextProps)
  getInitialState:          -> type: {name:"unknown", length: 16}
  updateType:(props)->

    if !props.number
      return @setState type: name:"unknown", length: 16

    if type = validate.cardType(props.number)
      return @setState type: name:type, length: 16

    return @setState type: name:"unknown", length: 16


  number:->
    if !@props.number
      string = ""
    else
      string = @props.number.toString()

    maxLength = @state.type.length

    if string.length > maxLength then string = string.slice(0,maxLength)

    while string.length < maxLength
      string += "•"

    amountOfSpaces = Math.ceil(maxLength/4)

    for i in [1...amountOfSpaces]
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
      return "••/••"
    else

      expiry = @props.expiry.toString()

      expiryMaxLength = 6 # 2 for month and 4 for year

      if expiry.match /\//
        expiry = expiry.replace("/", "")

      if !expiry.match /^[0-9]*$/
        return "••/••"

      while expiry.length < 4
        expiry += "•"

      expiry = expiry.slice(0, 2) + "/" + expiry.slice(2, expiryMaxLength)

      return expiry

  cvc:->
    if @props.cvc is null
      return "•••"
    else
      return if @props.cvc.toString().length <= 4 then @props.cvc else @props.cvc.toString().slice(0, 4)


exp = module.exports
exp.prefix = "react-credit-card"
