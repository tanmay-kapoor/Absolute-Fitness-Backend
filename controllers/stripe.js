const STRIPE_API_KEY = process.env.STRIPE_API_KEY
const stripe = require('stripe')(STRIPE_API_KEY);

exports.getAllProducts = async(req, res) => {
  try {
    const products = await stripe.products.list({});
    res.status(200).json(products.data);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
}

exports.getAllPrices = async(req, res) => {
  try {
    const prices = await stripe.prices.list({})
    res.status(200).json(prices.data);

  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
}

exports.getGymMembershipPricing = async(req, res) => {
  try {
    const products = await stripe.products.list({});
    const priceList    = await stripe.prices.list({});  

    // sort prices low to high
    const prices = priceList.data.sort((a, b) => {
      return a.amount - b.amount;
    }).map(price => {
      // format price amounts
      amount = formatAmount(price.amount)
      return {...price, amount};
    });

    // filter out required products
    const gymMembershipProducts = products.data.filter(product => {
      return product["metadata"]["product-type"] === "gym-membership"
    });

    // add prices attributes to products
    gymMembershipProducts.forEach(product => {
      const filteredPrices = prices.filter(price => {
        return price.product === product.id;
      })

      product.prices = filteredPrices;
    });

    res.status(200).json(gymMembershipProducts);

  } catch (err) {
    res.status(500).json({ msg: err.message });
  } 
}

const formatAmount = (stripeAmount) => {
  return `$${(stripeAmount / 100).toFixed(2)}`;
}