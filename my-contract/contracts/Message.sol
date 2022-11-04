// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";

contract Message is Ownable {

    // message when the contract is deployed
    string startMessage;

    // collection of the message and the sender
    struct MessageStruct{
        address sender;
        string text;
    }

    // listening for a new message
    event newMessageEvent(
        address indexed sender,
        string text
    );

    // array of messages
    MessageStruct[] messages;

   // an empty constructor
    constructor(){
        
    }

    // set the message of the sender
    function sendMessage(string memory sendersMessage) public {
        startMessage = sendersMessage;
        delete messages;
    }


    // push the new message int to the array of messages
    function newMessage(string memory newMes) public {
        messages.push(MessageStruct(
            msg.sender,
            newMes
        ));
        // emmit the new message 
    emit newMessageEvent(
        msg.sender,
        newMes
    );
    }
     function retrieveMessage() public view returns (MessageStruct[] memory){
        return messages;
    }
}