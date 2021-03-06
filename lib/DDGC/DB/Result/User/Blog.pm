package DDGC::DB::Result::User::Blog;

# ABSTRACT: Result class of blog posts

use Moo;
extends 'DBIx::Class::Core';
use DBIx::Class::Candy;
use DateTime::Format::RSS;

table 'user_blog';

column id => {
    data_type         => 'bigint',
    is_auto_increment => 1,
};
primary_key 'id';

column users_id => {
    data_type   => 'bigint',
    is_nullable => 0,
};

column translation_of_id => {
    data_type   => 'bigint',
    is_nullable => 1,
};

column title => {
    data_type   => 'text',
    is_nullable => 0,
};

column uri => {
    data_type   => 'text',
    is_nullable => 0,
};

column teaser => {
    data_type   => 'text',
    is_nullable => 0,
};

column content => {
    data_type   => 'text',
    is_nullable => 0,
};

column topics => {
    data_type        => 'text',
    is_nullable      => 1,
    serializer_class => 'JSON',
};

column company_blog => {
    data_type     => 'int',
    is_nullable   => 0,
    default_value => 0,
};

column raw_html => {
    data_type     => 'int',
    is_nullable   => 0,
    default_value => 0,
};

column live => {
    data_type          => 'int',
    is_nullable        => 0,
    default_value      => 0,
    keep_storage_value => 1,
};

column seen_live => {
    data_type     => 'int',
    is_nullable   => 0,
    default_value => 0,
};

column language_id => {
    data_type   => 'bigint',
    is_nullable => 1,
};

column data => {
    data_type        => 'text',
    is_nullable      => 1,
    serializer_class => 'JSON',
};

column fixed_date => {
    data_type   => 'timestamp with time zone',
    is_nullable => 1,
};

column created => {
    data_type     => 'timestamp with time zone',
    set_on_create => 1,
};

column updated => {
    data_type     => 'timestamp with time zone',
    set_on_create => 1,
    set_on_update => 1,
};

belongs_to 'user', 'DDGC::DB::Result::User', 'users_id';

1;
