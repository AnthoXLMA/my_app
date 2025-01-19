import consumer from "./consumer"

const room = "general"  // You can customize this based on room parameters

consumer.subscriptions.create({ channel: "ChatChannel", room: room }, {
  received(data) {
    // Append the received message to the chat window
    const messagesContainer = document.getElementById('messages')
    messagesContainer.innerHTML += data.message
  },

  sendMessage(user, message) {
    this.perform('send_message', { user: user, message: message });
  }
});
