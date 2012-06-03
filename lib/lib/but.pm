package lib::but;
use strict;
use warnings;
use 5.008_001;

our $VERSION = '0.01';

sub import {
    my ($class, @but) = @_;
    my %but = map {
        s<::></>g;
        ( "$_.pm" => 1 );
    } @but;
    unshift @INC, bless { but => \%but }, $class;
}

sub lib::but::INC {
    my ($self, $filename) = @_;
    if ($self->{but}->{$filename}) {
        open my $fh, '<', \(my $s = '0;');
        return $fh;
    }
}

1;

__END__

=head1 NAME

lib::but - pretend not to have some modules

=head1 SYNOPSIS

  use lib::but 'Foo::Bar';
  require 'Foo::Bar'; # fails even if you have installed Foo::Bar

  perl -Mlib::but=Moose carton install Any::Moose
  # carton does not count Moose in as Any::Moose's dependency

=head1 DESCRIPTION

=head1 AUTHOR

motemen E<lt>motemen@gmail.comE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
