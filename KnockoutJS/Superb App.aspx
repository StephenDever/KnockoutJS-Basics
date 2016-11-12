<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Superb App.aspx.cs" Inherits="KnockoutJS.Superb_App" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <script type="text/javascript" src="Scripts/knockout-3.4.0.debug.js"></script>
</head>
<body>

    <div id="entername">
        <p>
            Here, we demonstrate two-way binding with KnockoutJS. 
            The user types something in and that input is immediately printed to the screen. 
        </p>
        <p>Enter your name:</p>
        <input type="text" data-bind="value: firstName, valueUpdate:'afterkeydown'" />
        <input type="text" data-bind="value: lastName, valueUpdate:'afterkeydown'" />
        <p>First Name: <span data-bind="text: firstName"></span></p>
        <p>Last Name: <span data-bind="text: lastName"></span></p>
    </div>
    <script type="text/javascript">
        function viewModelFunc() {
            this.firstName = ko.observable("Michael");
            this.lastName = ko.observable("Scott");
        }
        ko.applyBindings(new viewModelFunc(), document.getElementById("entername"));
    </script>

    <br />
    <div id="listPart">
        <p>
            Here we use two way binding to add an item to an array and display those items as a list.
            Add something to the list!
        </p>
        <input type="text" data-bind="value: item" />
        <input type="submit" data-bind="click: addItem" />
        <ul data-bind="foreach: array">
            <li data-bind="text: $data"></li>
        </ul>
    </div>
    <script>
        var viewmodel3 = {
            item: ko.observable(),
            array: ko.observableArray(),
            addItem: function () {
                this.array.push(this.item());
            }
        };
        ko.applyBindings(viewmodel3, document.getElementById("listPart"));
        viewmodel3.array.push("Michael");
        viewmodel3.array.push("Scott");
    </script>
</body>
</html>
