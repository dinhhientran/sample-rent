# -*- encoding: utf-8 -*-
# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  sender_id         :integer          not null
#  receiver_id       :integer          not null
#  body              :text
#  is_sender_read    :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  message_thread_id :integer          not null
#  is_receiver_read  :boolean
#

require 'spec_helper'
require './app/models/message'

describe Message do
  context "associations" do
    it {is_expected.to belong_to :message_thread}
    it {is_expected.to belong_to(:sender).class_name('User').with_foreign_key('sender_id')}
    it {is_expected.to belong_to(:receiver).class_name('User').with_foreign_key('receiver_id')}
  end
end
