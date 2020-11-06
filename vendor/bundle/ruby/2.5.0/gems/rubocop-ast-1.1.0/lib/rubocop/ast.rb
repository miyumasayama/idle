# frozen_string_literal: true

require 'parser'
require 'forwardable'
require 'set'

require_relative 'ast/ext/range'
require_relative 'ast/ext/set'
require_relative 'ast/node_pattern/method_definer'
require_relative 'ast/node_pattern'
require_relative 'ast/node/mixin/descendence'
require_relative 'ast/node_pattern/builder'
require_relative 'ast/node_pattern/comment'
require_relative 'ast/node_pattern/compiler'
require_relative 'ast/node_pattern/compiler/subcompiler'
require_relative 'ast/node_pattern/compiler/atom_subcompiler'
require_relative 'ast/node_pattern/compiler/binding'
require_relative 'ast/node_pattern/compiler/node_pattern_subcompiler'
require_relative 'ast/node_pattern/compiler/sequence_subcompiler'
require_relative 'ast/node_pattern/lexer'
require_relative 'ast/node_pattern/node'
require_relative 'ast/node_pattern/parser'
require_relative 'ast/node_pattern/sets'
require_relative 'ast/sexp'
require_relative 'ast/node'
require_relative 'ast/node/mixin/method_identifier_predicates'
require_relative 'ast/node/mixin/binary_operator_node'
require_relative 'ast/node/mixin/collection_node'
require_relative 'ast/node/mixin/conditional_node'
require_relative 'ast/node/mixin/hash_element_node'
require_relative 'ast/node/mixin/method_dispatch_node'
require_relative 'ast/node/mixin/modifier_node'
require_relative 'ast/node/mixin/numeric_node'
require_relative 'ast/node/mixin/parameterized_node'
require_relative 'ast/node/mixin/predicate_operator_node'
require_relative 'ast/node/mixin/basic_literal_node'
require_relative 'ast/node/alias_node'
require_relative 'ast/node/and_node'
require_relative 'ast/node/args_node'
require_relative 'ast/node/array_node'
require_relative 'ast/node/block_node'
require_relative 'ast/node/break_node'
require_relative 'ast/node/case_match_node'
require_relative 'ast/node/case_node'
require_relative 'ast/node/class_node'
require_relative 'ast/node/const_node'
require_relative 'ast/node/def_node'
require_relative 'ast/node/defined_node'
require_relative 'ast/node/ensure_node'
require_relative 'ast/node/for_node'
require_relative 'ast/node/forward_args_node'
require_relative 'ast/node/float_node'
require_relative 'ast/node/hash_node'
require_relative 'ast/node/if_node'
require_relative 'ast/node/index_node'
require_relative 'ast/node/indexasgn_node'
require_relative 'ast/node/int_node'
require_relative 'ast/node/keyword_splat_node'
require_relative 'ast/node/lambda_node'
require_relative 'ast/node/module_node'
require_relative 'ast/node/next_node'
require_relative 'ast/node/or_node'
require_relative 'ast/node/pair_node'
require_relative 'ast/node/range_node'
require_relative 'ast/node/regexp_node'
require_relative 'ast/node/rescue_node'
require_relative 'ast/node/resbody_node'
require_relative 'ast/node/return_node'
require_relative 'ast/node/self_class_node'
require_relative 'ast/node/send_node'
require_relative 'ast/node/str_node'
require_relative 'ast/node/super_node'
require_relative 'ast/node/symbol_node'
require_relative 'ast/node/until_node'
require_relative 'ast/node/when_node'
require_relative 'ast/node/while_node'
require_relative 'ast/node/yield_node'
require_relative 'ast/builder'
require_relative 'ast/processed_source'
require_relative 'ast/rubocop_compatibility'
require_relative 'ast/token'
require_relative 'ast/traversal'
require_relative 'ast/version'

::RuboCop::AST::NodePattern::Parser.autoload :WithMeta, "#{__dir__}/ast/node_pattern/with_meta"
::RuboCop::AST::NodePattern::Compiler.autoload :Debug, "#{__dir__}/ast/node_pattern/compiler/debug"
