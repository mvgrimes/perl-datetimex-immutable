use Module::Build;
my $build = Module::Build->new(
    module_name   => 'DateTimeX::Immutable',
    license       => 'perl',
    create_readme => 1,

    configure_requires => {
        'Module::Build' => '0.4004',
    },

    requires => {
        'perl'       => '5.006',
        'DateTime'   => '1.00',
        'Role::Tiny' => '1.000',
    },

    test_requires => {
        'Test::More' => 0.87,
    },

    meta_merge => {
        resources => {
            bugtracker =>
              'http://rt.cpan.org/NoAuth/Bugs.html?Dist=DateTimeX-Immutable',
            repository => 'http://github.com/mvgrimes/DateTimeX-Immutable'
        }
    },
);

$build->create_build_script;
