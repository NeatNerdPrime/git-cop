# frozen_string_literal: true

require "git/cop/identity"
require "git/kit/repo"
require "git/cop/refinements/strings"
require "git/cop/errors/base"
require "git/cop/errors/severity"
require "git/cop/errors/sha"
require "git/cop/kit/filter_list"
require "git/cop/validators/email"
require "git/cop/validators/name"
require "git/cop/validators/capitalization"
require "git/cop/parsers/trailers/collaborator"
require "git/cop/commits/saved"
require "git/cop/commits/unsaved"
require "git/cop/branches/environments/local"
require "git/cop/branches/environments/circle_ci"
require "git/cop/branches/environments/netlify_ci"
require "git/cop/branches/environments/travis_ci"
require "git/cop/branches/feature"
require "git/cop/styles/abstract"
require "git/cop/styles/commit_author_capitalization"
require "git/cop/styles/commit_author_email"
require "git/cop/styles/commit_author_name"
require "git/cop/styles/commit_author_name_capitalization"
require "git/cop/styles/commit_author_name_parts"
require "git/cop/styles/commit_body_bullet"
require "git/cop/styles/commit_body_bullet_capitalization"
require "git/cop/styles/commit_body_bullet_delimiter"
require "git/cop/styles/commit_body_issue_tracker_link"
require "git/cop/styles/commit_body_leading_line"
require "git/cop/styles/commit_body_line_length"
require "git/cop/styles/commit_body_paragraph_capitalization"
require "git/cop/styles/commit_body_phrase"
require "git/cop/styles/commit_body_presence"
require "git/cop/styles/commit_body_single_bullet"
require "git/cop/styles/commit_subject_length"
require "git/cop/styles/commit_subject_prefix"
require "git/cop/styles/commit_subject_suffix"
require "git/cop/styles/commit_trailer_collaborator_capitalization"
require "git/cop/styles/commit_trailer_collaborator_duplication"
require "git/cop/styles/commit_trailer_collaborator_email"
require "git/cop/styles/commit_trailer_collaborator_key"
require "git/cop/styles/commit_trailer_collaborator_name"
require "git/cop/collector"
require "git/cop/reporters/lines/sentence"
require "git/cop/reporters/lines/paragraph"
require "git/cop/reporters/line"
require "git/cop/reporters/cop"
require "git/cop/reporters/commit"
require "git/cop/reporters/branch"
require "git/cop/runner"
require "git/cop/cli"
