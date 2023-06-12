# frozen_string_literal: true

module Admins
  module PropositionsHelper
    def update_entry_status_link(entry)
      label = entry.next_status_label_i18n
      return unless label

      link_to "#{label}に更新", update_status_admins_proposition_entry_path(id: entry.id), method: :patch, class: "btn btn-primary btn-sm"
    end
  end
end
