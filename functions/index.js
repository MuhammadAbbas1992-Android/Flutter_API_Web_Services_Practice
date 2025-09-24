const {setGlobalOptions} = require("firebase-functions");
const {onRequest} = require("firebase-functions/https");
const logger = require("firebase-functions/logger");
const functions = require("firebase-functions");
const admin = require("firebase-admin");


admin.initializeApp();

// Optional: global options for cost/performance
setGlobalOptions({maxInstances: 10});

// Example: a test hello function
exports.helloWorld = onRequest((req, res) => {
  logger.info("Hello logs!", {structuredData: true});
  res.send("Hello from Firebase!");
});

// =============================
// 🚀 Your Notification Function
// =============================
exports.sendNotification = functions.https.onRequest(async (req, res) => {
  try {
    const message = {
      token: req.body.token, // device FCM token from client
      notification: {
        title: req.body.title || "New Chat Message",
        body: req.body.body || "Tap to open chat",
      },
      data: {
        type: req.body.type || "chat",
        chat_id: req.body.chat_id || "12345",
      },
    };

    const response = await admin.messaging().send(message);
    console.log("✅ Successfully sent message:", response);

    return res.status(200).send({success: true, response});
  } catch (error) {
    console.error("❌ Error sending message:", error);
    return res.status(500).send({success: false, error: error.message});
  }
});
