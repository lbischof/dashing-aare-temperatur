# Preview
![](https://raw.githubusercontent.com/lbischof/dashing-aare-temperatur/master/aare.gif)

# Description
Widget for [Dashing](http://dashing.io/) that shows the temperature of the Aare in Berne. Data is from http://www.aare.guru

# Usage
To use this widget, copy `aare.html`, `aare.coffee`, and `aare.scss` into a `/widgets/aare` directory, and copy the `aare.rb` file into your `/jobs` folder. Also copy the wave svg into the `assets` folder.

To include the widget in a dashboard, add the following snippet to the dashboard layout file:
```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
    <div data-id="aare" data-view="Aare"></div>
</li>
```


