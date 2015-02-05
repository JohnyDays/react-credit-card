# React credit card

##### React port of the display part of [Card](http://github.com/jessepollak/card) by @jessepollak

#### Why?

[Card](http://github.com/jessepollak/card) looks amazing on any form, but it interacts with the dom in a more classic javascript interface, which is incompatible with react.

#### How to install
  
- npm install react-card
- Add the index.css file to your project's styles, anywhere

#### How to use (Check the test index.cjsx for a better overview)

```jsx
Card = require('react-card')
React.render(
 <Card 
    cvc = {myForm.props.cvc} 
    name = {myForm.props.name} 
    focused = {'name'}/> // The form turns around when focused is "cvc"
,document.body)
```

### Available props
  
  - cvc: number(max 4 characters, will cut the rest)(The "/" will be automatically added)
  - name: string (max 2 lines)
  - number: credit card number(max 16 characters, will cut the rest)
  - expiry: number(max 4 characters, will cut the rest) 
  - focused: one of the above fields
    - name
    - number
    - expiry
    - cvc (Upon focusing cvc, the form will be rotated until this is changed.)
    - null
  - expiryAfter: The text displayed on the left of the expiry date
  - expiryBefore: The text displayed above the expiry date
  - shinyAfterBack: The text displayed at the back of the card near the shiny thing


#### Goals

- To look like [Card](http://github.com/jessepollak/card).
- Provide a react interface for displaying the credit card.

#### Missing features towards that goal

- Images are inlined using base64 [Card](http://github.com/jessepollak/card) uses images created with css.
- Maybe inline styles according to facebook's new guidelines, for now the styles are in a separate stylesheet.

#### Planned improvements

- Allow for some way to indicate that a field is invalid, and style appropriately to indicate errors. 

#### Intentional deviations

- There is no intention to port the validation. This is merely for display.
- Flat background colors

Most of the credit goes to @jessepollak for creating and mantaining [Card](http://github.com/jessepollak/card), I just ported it over.

