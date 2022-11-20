const errorHandler = (req, res) => {
    const err = new Error("Could not process");
    res.json({ err: err.message });
};

module.exports = errorHandler;
