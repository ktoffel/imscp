=head1 NAME

 iMSCP::Dialog::FrontEndInterface - Interface for dialog frontEnds

=cut

# i-MSCP - internet Multi Server Control Panel
# Copyright (C) 2010-2018 Laurent Declercq <l.declercq@nuxwin.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

package iMSCP::Dialog::FrontEndInterface;

use strict;
use warnings;

=head1 DESCRIPTION

 Interface for dialog frontEnds.

=head1 PUBLIC METHODS

=over 4

=item select( $text, \%choices [, $defaultTag = none [, $showTags = FALSE ] ] )

 Display a dialog box with a list of choices on it

 Param string $text Text to show
 Param hashref \%choices List of choices where keys are tags and values are items.
 Param string $default Default selected tag
 Param bool $showTags Flag indicating whether or not tags must be showed in dialog box
 Return Selected tag in scalar context, a list containing both dialog return code and selected tag in list context, croak on failure

=cut

=item multiselect( $text, \%choices [, \@defaultTags = [] [, $showTags =  FALSE ] ] )

 Display a dialog box with a check list on it

 Param string $text Text to show
 Param hashref \%choices List of choices where keys are tags and values are items.
 Param arrayref \@default Default tags
 Param bool $showTags Flag indicating whether or not tags must be showed in dialog box
 Return An array of checked tags in scalar context, a list containing the dialog return code and an array of checked tags in list context, croak on failure

=cut

=item boolean( $text [, $defaultno =  FALSE [, $backbutton = FALSE ] ] )

 Display a dialog box with two buttons, one for TRUE meaning, other for FALSE meaning

 Param string $text Text to show
 Param string bool defaultno Set the default value of the box to 'No'
 Return int 0 (Yes), 1 (No), 30 (Back), croak on failure

=cut

=item error( $text )

 Display a dialog box with an error message on it

 Param string $text Text to display
 Return int 0 (Ok), 30 (Back), croak on failure

=cut

=item note( $text )

 Display a dialog box with a note on it

 Param string $text Text to display
 Return int 0 (Ok), 30 (Back), croak on failure

=cut

=item text( $text )

 Display a dialog box with a text on it

 Param string $text Text to display
 Return int 0 (Ok), 30 (Back), croak on failure

=cut

=item string( $text [, $default = '' ] )

 Display a dialog box with a text input field on it

 Param string $text Text to show
 Param string $default Default value
 Return Input string in scalar context, a list containing both dialog return code and input string in list context

=cut

=item password( $text [, $default = '' ] )

 Display a dialog box with a password input field on it

 Param string $text Text to show
 Param string $default Default value
 Return Input password in scalar context, a list containing both dialog return code and input password in list context

=cut

=item startGauge( $text [, $percent = 0 ] )

 Display a dialog box wit a progress bar on it

 Param string $text Text to show
 Param int $percent Initial percentage show in the meter
 Return void, croak on failure

=cut

=item setGauge( $percent, $text )

 Update gauge percent and text

 If no gauge is currently running, a new one will be created

 Param int $percent New percentage to show in gauge dialog box
 Param string $text New text to show in gauge dialog box
 Return void, croak on failure

=cut

=item endGauge( )

 Terminate gauge

 Return void

=cut

=item hasGauge( )

 Is a gauge currently running?

 Return boolean TRUE if a gauge is running, FALSE otherwise

=cut

sub AUTOLOAD
{
    my $self = shift;
    ( my $method = $iMSCP::Dialog::FrontEndInterface::AUTOLOAD ) =~ s/.*:://;

    grep ( $method eq $_, qw/ select multiselect boolean error note text string password startGauge setGauge endGauge hasGauge executeDialogs / ) or die(
        sprintf( 'Unknown %s method', $iMSCP::Dialog::FrontEndInterface::AUTOLOAD )
    );

    die( sprintf( "The '%s' class must implement the '%s' method", ref $self, $method ));
}

=item DESTROY

 Must exist so AUTOLOAD doesn't try to handle it

=cut

sub DESTROY
{

}

=back

=head1 AUTHOR

 Laurent Declercq <l.declercq@nuxwin.com>

=cut

1;
__END__
