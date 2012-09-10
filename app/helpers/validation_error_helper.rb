module ValidationErrorHelper

  def validation_errors(*resources, options)
    error_messages = resources.collect do |resource|
      resource.errors.full_messages
    end
    validation_error_wrapper *error_messages.flatten, options
  end

  def validation_error_count(*resources, options)
    resources.map { |resource| resource.errors.size }.sum
  end

  def validation_error_count_message(*resources, options)
    "#{pluralize(validation_error_count(resources, options), 'error')} prohibited this form from being saved"
  end

  # this is 'helpful' for making non-ActiveRecord errors blend in.
  def validation_error_wrapper(*error_messages, options)
    error_messages.compact!
    return if error_messages.empty?
    list_items = error_messages.map { |msg| content_tag(:li, msg) }.join
    content_tag(:ul, raw(list_items), :class => "validation_errors #{options[:class]}") unless list_items.blank?
  end

  def self.included(base)
    base.instance_eval do

      %w(validation_errors validation_error_count validation_error_count_message validation_error_wrapper).each do |method|
        class_eval <<-METHODS, __FILE__, __LINE__
          def #{method}(*things, options)
            unless options.is_a?(Hash)
              things << options
              options = {}
            end
            super(*things, options)
          end
        METHODS
      end
    end
  end
end
