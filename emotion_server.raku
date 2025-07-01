use Cro::HTTP::Router;
use Cro::HTTP::Server;
use Cro::HTTP::Response;
use JSON::Fast;

# Emotion classification logic
sub classify(Str $input) {
    if $input ~~ /:i happy|joy|awesome|yay/ {
        return '😊 Happy';
    } elsif $input ~~ /:i sad|cry|upset|bad/ {
        return '😢 Sad';
    } elsif $input ~~ /:i angry|mad|furious/ {
        return '😠 Angry';
    } elsif $input ~~ /:i scared|afraid|nervous/ {
        return '😨 Fear';
    } else {
        return '😐 Neutral';
    }
}

# Define routes
my $router = route {
    get -> 'predict', :query(:$text) {
        say "📩 Received input: $text";
        my $emotion = classify($text // '');
        say "🎯 Classified as: $emotion";

        content 'application/json', to-json({ emotion => $emotion }),
            headers => { 'Access-Control-Allow-Origin' => '*' };
    }

    any ['OPTIONS'] => 'predict' => {
        content 'text/plain', '',
            status => 204,
            headers => {
                'Access-Control-Allow-Origin'  => '*',
                'Access-Control-Allow-Methods' => 'GET, OPTIONS',
                'Access-Control-Allow-Headers' => 'Content-Type'
            };
    }
};

# Start the server
my Cro::Service $service = Cro::HTTP::Server.new(
    :host<localhost>,
    :port(10000),
    :application($router)
);

$service.start;
say "🚀 Server running at http://localhost:10000";

react whenever signal(SIGINT) {
    say "\n🛑 Server stopping...";
    $service.stop;
    exit;
}
