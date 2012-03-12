package Dancer::Plugin::EmptyGIF;

=head1 NAME

Dancer::Plugin::EmptyGIF - Quick empty GIF response

=head1 SYNOPSIS

 use Dancer;
 use Dancer::Plugin::EmptyGIF;
 
 get '/tracking/pixel.gif' => sub {
   # do something with params
   return empty_gif;
 }

=head1 METHODS

=head2 empty_gif

This will set your set your current request response to be an empty
gif, this means, it will return binary data for the image and
set the appropriate headers. You should always "return empty_gif".

=head1 WHY

An empty gif response is specially useful when you're building a
webservice that processes all the URL and/or query string parameters
and at the end, an empty gif needs to be returned to the client.
This a tracking or reporting pixel. Once the request has reached your
application code, it's better not to do any more redirections and
quickly return the empty pixel from within your code.

=head1 AUTHOR

David Moreno C<< <david at axiombox dot com> >>

=head1 CODE

L<http://github.com/damog/Dancer-Plugin-EmptyGIF>

=head1 LICENSE

Copyright, David Moreno, 2012

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut

use Dancer ':syntax';
use Dancer::Plugin;
use MIME::Base64;

our $VERSION = '0.1';

register empty_gif => sub {
    header('Content-Type' => 'image/gif');
    header('Content-Disposition' => 'inline; filename="empty.gif"');
    decode_base64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
};

register_plugin;
1;