const express = require("express");
const app = express();

const auth = require("./middlewares/auth.js");
const errors = require("./middlewares/errors.js");
const unless = require("express-unless");

auth.authenticateToken.unless = unless;
app.use(
  auth.authenticateToken.unless({
    path: [
      { url: "/users/login", methods: ["POST"] },
      { url: "/users/register", methods: ["POST"] },
      { url: "/users/otpLogin", methods: ["POST"] },
      { url: "/users/verifyOTP", methods: ["POST"] },
    ],
  })
);

app.use(express.json());

// initialize routes
app.use("/users", require("./routes/users.routes"));

// middleware for error responses
app.use(errors.errorHandler);

// listen for requests
app.listen(process.env.port || 3000, function () {
  console.log("Ready to Go!");
});
