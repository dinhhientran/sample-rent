# -*- encoding: utf-8 -*-
# == Schema Information
#
# Table name: message_threads
#
#  id                :integer          not null, primary key
#  started_user_id   :integer
#  to_user_id        :integer
#  latest_message_id :integer
#  subject           :string
#  is_deleted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


require 'spec_helper'
require './app/models/message_thread'

describe MessageThread do
  context "associations" do
    it {is_expected.to belong_to(:started_user).class_name('User')}
    it {is_expected.to belong_to(:to_user).class_name('User')}
    it {is_expected.to belong_to(:latest_message).class_name('Message')}
    it {is_expected.to have_many(:messages)}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :subject}
    it {is_expected.to validate_presence_of :started_user_id}
    it {is_expected.to validate_presence_of :to_user_id}
  end
end
