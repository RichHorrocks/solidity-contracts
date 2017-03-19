pragma solidity ^0.4.6;

contract HelloWorld {

    string saySomething;

    function HelloWorld() {
        saySomething = "Hello World!";
    }

    function speak() constant returns(string itSays) {
        return saySomething;
    }

    function saySomethingElse(string newSaying) returns(bool success) {
        saySomething = newSaying;
        return true;
    }
}