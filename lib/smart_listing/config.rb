module SmartListing
  def self.configure(&block)
    yield @config ||= SmartListing::Configuration.new
  end

  def self.config
    @config ||= SmartListing::Configuration.new
  end

  class Configuration
    DEFAULTS = {
      :constants => {
        :classes => {
          :main => "smart-listing",
          :editable => "editable",
          :content => "content",
          :loading => "loading",
          :status => "smart-listing-status",
          :item_actions => "actions",
          :new_item_placeholder => "new-item-placeholder",
          :new_item_action => "new-item-action",
          :new_item_button => "btn",
          :hidden => "hidden",
          :autoselect => "autoselect",
          :callback => "callback",
          :pagination_per_page => "pagination-per-page",
          :pagination_count => "count",
          :inline_editing => "info",
          :no_records => "no-records",
          :limit => "limit",
          :limit_alert => "limit-alert",
          :controls => "smart-listing-controls",
          :controls_reset => "reset",
          :filtering => "filter",
          :filtering_search => "glyphicon-search",
          :filtering_cancel => "glyphicon-remove",
          :filtering_disabled => "disabled",
          :sortable => "sortable",
        },
        :data_attributes => {
          :main => "smart-listing",
          :confirmation => "confirmation",
          :id => "id",
          :href => "href",
          :callback_href => "callback-href",
          :max_count => "max-count",
          :inline_edit_backup => "smart-listing-edit-backup",
          :params => "params",
          :observed => "observed",
          :href => "href",
        },
        :selectors => {
          :item_action_destroy => "a.destroy",
          :edit_cancel => "button.cancel",
          :row => "tr",
          :head => "thead",
          :filtering_icon => "i"
        }
      }
    }

    def initialize
      @options = DEFAULTS
    end

    def method_missing(sym, *args, &block)
      @options[sym] = *args
    end
    
    def constants key, value = nil
      if value == nil
        @options[:constants][key]
      else
        @options[:constants][key].merge!(value)
      end
    end

    def classes key
      @options[:constants][:classes][key]
    end

    def data_attributes key
      @options[:constants][:data_attributes][key]
    end

    def selectors key
      @options[:constants][:selectors][key]
    end
  end
end