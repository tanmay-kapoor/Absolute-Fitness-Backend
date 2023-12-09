const { v4: uuidv4 } = require("uuid");
const {
    AWS_S3_BUCKET_NAME,
    AWS_REGION,
    AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY,
} = require("../constants");
const { S3Client, PutObjectCommand } = require("@aws-sdk/client-s3");

const bucketName = AWS_S3_BUCKET_NAME;

const s3Client = new S3Client({
    region: AWS_REGION,
    credentials: {
        accessKeyId: AWS_ACCESS_KEY_ID,
        secretAccessKey: AWS_SECRET_ACCESS_KEY,
    },
});

exports.uploadSingleImageToS3 = async (req, res, next) => {
    try {
        const file = req.file;
        if (!file) {
            return next();
        } else if (req.body.image_url) {
            return res.status(400).json({
                msg: "Should either upload an image or provide an image url, not both",
            });
        } else {
            const publicUrl = await addToS3(file);
            req.body.image_url = publicUrl;
            return next();
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.uploadMultipleImagesToS3 = async (req, res, next) => {
    try {
        const files = req.files;
        if (!files || files.length === 0) {
            return next();
        } else if (req.body.image_url || req.body.gym.image_urls) {
            return res.status(400).json({
                msg: "Should either upload an image or provide an image url, not both",
            });
        } else {
            const publicUrls = await Promise.all(
                files.map((file) => addToS3(file))
            );
            req.body.gym.image_urls = publicUrls;
            return next();
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const addToS3 = async (file) => {
    const fileName = uuidv4();

    const uploadParams = {
        Bucket: bucketName,
        Key: fileName,
        Body: file.buffer,
        ContentType: file.mimetype,
        ACL: "public-read", // Set the ACL to public-read for public access
    };

    const uploadCommand = new PutObjectCommand(uploadParams);
    await s3Client.send(uploadCommand);

    const publicUrl = `https://${bucketName}.s3.amazonaws.com/${fileName}`;
    return publicUrl;
};
