package MT::Plugin::FragmentValidator;
use strict;

use vars qw( $VERSION );
$VERSION = '1.0';

use MT;
use MT::Plugin;
use MT::Template::Context;
use HTTP::Response;
use HTTP::Request::Common;
use LWP::UserAgent;
use File::Temp qw/ tempfile tempdir /; 

if ( MT->version_number < 3.3 ) {
    die 'This plugin only works with Movable Type 3.3 or higher.';
}

my $plugin = new MT::Plugin({
    name => 'MT-FragmentValidator',
    version => $VERSION,
    author_name => 'Jason Blevins',
    author_link => 'http://jblevins.org/',
    plugin_link => 'http://jblevins.org/computing/mathml/mt4',
    description => 'Passes markup fragments to the W3C Markup Validator.'
});

MT->add_plugin($plugin);

MT::Template::Context->add_conditional_tag(IfFragmentValid => sub {
    my $ctx = shift;
    return $ctx->stash('valid');
});

MT::Template::Context->add_conditional_tag(IfFragmentInvalid => sub {
    my $ctx = shift;
    return !$ctx->stash('valid');
});

MT::Template::Context->add_tag(ValidatorResults => sub {
    return $ctx->stash('validator_results');
});

MT::Template::Context->add_tag(FragmentSource => sub {
    return $ctx->stash('fragment_source');
});

MT::Template::Context->add_container_tag(ValidateFragment => sub {
    my ($ctx, $args) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens = $ctx->stash('tokens');
    my $content;
    my $ua = new LWP::UserAgent;
    my $fh;
    my $filename;

    defined($content = $builder->build($ctx, $tokens))
      or return $ctx->error($builder->errstr);

    $ctx->stash('fragment_source', $content);

    ($fh, $filename) = tempfile( UNLINK => 1, SUFFIX => ".html" );
    print $fh $res;
    close $fh;

    my $response = $ua->request(POST 'http://validator.w3.org/check',
				Content_Type => 'form-data',
				Content      => [ output => 'xml',
						  uploaded_file  => ["$filename"] ]);

    if ($response->is_success) {
	if ($response->header('X-W3C-Validator-Status') eq 'Invalid') {
	    $ctx->stash('valid', 0);
	} else {
	    $ctx->stash('valid', 1);
	}

	$ctx->stash('validtor_results', $response->content)

    } else {
	$ctx->stash('validtor_results', 'Unable to connect to validator.')
    }
});
