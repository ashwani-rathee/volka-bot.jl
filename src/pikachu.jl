module pikachu

DISCORD_TOKEN="ODQzMDAwMTA5NzgzODQyODE2.YJ9fCA.Sq_54KDF-EY8hkAQwov_NNeb4_4"

# Import Discord.jl.
using Discord
# Create a client.
c = Client(DISCORD_TOKEN; presence=(game=(name="Julia", type=AT_GAME),))

# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageCreate)
    # Display the message contents.
    println("Received message: $(e.message.content)")
    # Add a reaction to the message.
    create(c, Reaction, e.message, '👍')
end

# Add the handler.
add_handler!(c, MessageCreate, handler)
# Log in to the Discord gateway.
open(c)
# Wait for the client to disconnect.
wait(c)

end # module
