# react-ctx-connect

This tool helps you to connect your React component to a React context. It will
let you set props you want to get from your context and inject to your component
and avoid useless re-renders.

## Install

    $ npm i react-ctx-connect

## Usage

*context.js*
```js
import React from 'react';
import connect from 'react-ctx-connect';

export const context = React.createContext();

export const connectContext = connect(context);
```

*Component/Component.js*
```js
import React from 'react';

export default ({ foo }) => <p>{foo}</p>
```


*Component/index.js*
```js
import { connectContext } from './context.js';
import Component from './Component';

export default connectContext('foo')(Component);
```

## Advanced Usage

There is three way to access context values :

### list of strings

You can pass a list of props names as strings for an exact match between context
values and component props.

```js
connectContext('foo', 'bar')(Component);
```

`Component` will have `foo` and `bar` props with `context.foo` and `context.bar`
values.

### Mapping

You can specify an object of key/values to rename your props.

```js
connectContext({
  foo: 'someValue',
  bar: 'someOtherValue',
})(Component);
```

`Component` will have `foo` prop with `context.someValue`  value and `bar` prop
with `context.someOtherValue` value.

You can also specify a path if you want to access a deep value in your context.

```js
connectContext({
  foo: 'some.value',
})(Component);
```

### Function

Finally, you can create a function to access the current context value and
return you own object of props.

```js
connectContext(context => ({
  foo: context.some.value,
}))(Component);
```

```js
connectContext(({ some: { value: foo }}) => ({ foo }))(Component);
```

In theses tywo examples, `Component` will have a `foo` prop with
`context.some.value` value.

## Tests

    $ npm test

## Author

[Hadrien Lanneau](https://hadrien.eu)
