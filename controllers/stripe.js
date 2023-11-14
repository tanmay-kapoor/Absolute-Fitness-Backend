const STRIPE_API_KEY = process.env.STRIPE_API_KEY
const stripe = require("stripe")(STRIPE_API_KEY)

exports.getAllProducts = async (req, res) => {
    try {
        const products = await stripe.products.list({})
        res.status(200).json(products.data)
    } catch (err) {
        res.status(500).json({ msg: err.message })
    }
}

exports.getAllPrices = async (req, res) => {
    try {
        const prices = await stripe.prices.list({})
        res.status(200).json(prices.data)
    } catch (err) {
        res.status(500).json({ msg: err.message })
    }
}

exports.getGymMembershipPricing = async (req, res) => {
    try {
        const products = await stripe.products.list({})
        const priceList = await stripe.prices.list({})

        // sort prices low to high
        const prices = priceList.data
            .sort((a, b) => {
                return a.unit_amount - b.unit_amount
            })
            .map((price) => {
                // format price amounts
                amount = formatAmount(price.unit_amount)
                return { ...price, amount }
            })

        // filter out required products
        const gymMembershipProducts = products.data.filter((product) => {
            return product["metadata"]["product-type"] === "gym-membership"
        })

        // add prices attributes to products
        gymMembershipProducts.forEach((product) => {
            const filteredPrices = prices.filter((price) => {
                return price.product === product.id
            })

            product.prices = filteredPrices
        })

        res.status(200).json(gymMembershipProducts[0])
    } catch (err) {
        res.status(500).json({ msg: err.message })
    }
}

exports.createSubscription = async (req, res) => {
    try {
        // create a stripe customer
        const customer = await stripe.customers.create({
            name: req.body.name,
            email: req.body.email,
            payment_method: req.body.paymentMethod,
            invoice_settings: {
                default_payment_method: req.body.paymentMethod,
            },
        })

        // create a stripe subscription
        const subscription = await stripe.subscriptions.create({
            customer: customer.id,
            items: [{ price: req.body.priceId }],
            payment_settings: {
                save_default_payment_method: "on_subscription",
            },
            expand: ["latest_invoice.payment_intent"],
        })

        // return the client secret and subscription id
        res.status(200).json({
            clientSecret:
                subscription.latest_invoice.payment_intent.client_secret,
            subscriptionId: subscription.id,
        })
    } catch (err) {
        console.log(err.message)
        res.status(500).json({ msg: err.message })
    }
}

const formatAmount = (stripeAmount) => {
    return `₹${stripeAmount / 100}`
}
