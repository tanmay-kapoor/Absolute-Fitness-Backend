const { STRIPE_API_KEY, CLIENT_URL } = require("../util/constants");
const stripe = require("stripe")(STRIPE_API_KEY);
const helpers = require("../util/helpers");

exports.getAllProducts = async (req, res) => {
    try {
        const products = await stripe.products.list({});
        res.status(200).json(products.data);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllPrices = async (req, res) => {
    try {
        const prices = await stripe.prices.list({});
        res.status(200).json(prices.data);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

// create price (for new plans (root user)

// edit/delete price maybe (root user)

exports.getGymMembershipPricing = async (req, res) => {
    try {
        const products = await stripe.products.list({});
        const priceList = await stripe.prices.list({ active: true });

        // sort prices low to high
        const prices = priceList.data.sort((a, b) => {
            return a.unit_amount - b.unit_amount;
        });

        // filter out required products
        const gymMembershipProducts = products.data.filter((product) => {
            return product["metadata"]["product-type"] === "gym-membership";
        });

        // add prices attributes to products
        gymMembershipProducts.forEach((product) => {
            const filteredPrices = prices.filter((price) => {
                return price.product === product.id;
            });
            product.prices = filteredPrices;
        });

        res.status(200).json(gymMembershipProducts[0]);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

// exports.createSubscription = async (req, res) => {
//     try {
//         // create a stripe customer
//         const customer = await stripe.customers.create({
//             name: req.body.name,
//             email: req.body.email,
//             payment_method: req.body.paymentMethod,
//             invoice_settings: {
//                 default_payment_method: req.body.paymentMethod,
//             },
//         });

//         // create a stripe subscription
//         const subscription = await stripe.subscriptions.create({
//             customer: customer.id,
//             items: [{ price: req.body.priceId }],
//             payment_settings: {
//                 save_default_payment_method: "on_subscription",
//             },
//             expand: ["latest_invoice.payment_intent"],
//         });

//         // return the client secret and subscription id
//         res.status(200).json({
//             clientSecret:
//                 subscription.latest_invoice.payment_intent.client_secret,
//             subscriptionId: subscription.id,
//         });
//     } catch (err) {
//         console.log(err.message);
//         res.status(500).json({ msg: err.message });
//     }
// };

exports.createCheckoutSession = async (req, res) => {
    try {
        // TODO: what if user opens the checkout page but pays after 20 mins?
        const token = helpers.generatePaymentSuccessToken({
            username: req.body.username,
        });
        const priceId = req.params.priceId;
        const session = await stripe.checkout.sessions.create({
            line_items: [
                {
                    price: priceId,
                    quantity: 1,
                },
            ],
            mode: "subscription",
            success_url: `${CLIENT_URL}/payment?token=${token}`,
            cancel_url: `${CLIENT_URL}?canceled=true`,
        });
        res.status(200).json(session.url);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const formatAmount = (stripeAmount) => {
    return `₹${stripeAmount / 100}`;
};
