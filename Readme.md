# React credit card

##### React port of the display part of [Card](http://github.com/jessepollak/card) by @jessepollak

#### Why?

[Card](http://github.com/jessepollak/card) looks amazing on any form, but it interacts with the dom in a more classic javascript interface, which is incompatible with react.

#### Goals

- Look like [Card](http://github.com/jessepollak/card).
- Provide a react interface for displaying credit card information.

#### How to install
  
- `npm install react-card`
- Add the `build/card.css` and `build/card-types.css` files to your app's stylesheets (This step may be unnecessary in the future)

#### How to use (Check the test index.cjsx for a better overview)

```jsx
Card = require('react-credit-card')
React.render(
 <Card 
    cvc = {myForm.props.cvc} 
    name = {myForm.props.name} 
    focused = {'name'}/> // The form turns around when focused is "cvc"
,document.body)
```

### Available props
  
  - `cvc`: number(max 4 characters, will cut the rest)(The "/" will be automatically added)
  - `name`: string (max 2 lines)
  - `number`: credit card number(max 16 characters, will cut the rest)
  - `expiry`: number(max 4 characters, will cut the rest) 
  - `focused`: one of the above fields
    - name
    - number
    - expiry
    - cvc (Upon focusing cvc, the form will be rotated until this is changed.)
    - null
  - `expiryAfter`: The text displayed on the left of the expiry date
  - `expiryBefore`: The text displayed above the expiry date
  - `shinyAfterBack`: The text displayed at the back of the card near the shiny thing
  - `type`: Available in case you need to explicitly specify the card type. In most cases this will be inferred for you as the user fills the form, so you won't need to use it. One of the following:
    - dankort
    - discover
    - mastercard
    - visa
    - amex

#### Missing features towards the intended goals

- Images are inlined using base64, [Card](http://github.com/jessepollak/card) uses images created with css.

#### Planned improvements

- Allow for some way to indicate that a field is invalid, and style appropriately to indicate errors. 
- Add more credit card variations, to the extent that [Payment](http://github.com/jessepollak/card) supports. 
- Maybe inline styles according to facebook's new guidelines, for now the styles are in a separate stylesheet.
- Automated test suite.

#### Intentional deviations

- There is no intention to port the form or validation part of [Card](http://github.com/jessepollak/card). This is merely for display.
- Flat background colors for the various cards.
- Placeholder symbols are progressively filled while changing the values.

#### Development

  - Clone the repo
  - Run npm install
  - Run npm start
  - Use test/index.html for testing behaviour and display

It was developed on a local webserver so it doesn't come with any server tools.
If someone wants to add a more fleshed out build/testing process (gulp/grunt/webpack) it's very much welcome.

Most of the credit goes to @jessepollak for creating and mantaining [Card](http://github.com/jessepollak/card), I just ported it over.

