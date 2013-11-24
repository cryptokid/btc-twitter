# Load the default sentiment dictionaries
Sentimental.load_defaults

# Set a global threshold
Sentimental.threshold = 0.0

# Create an instance for usage:
TweetSentiment = Sentimental.new

# You can make new analyzers with individual thresholds:
# analyzer = Sentimental.new(0.9)
