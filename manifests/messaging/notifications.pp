# == Define: oslo::messaging::notifications
#
# Configure oslo_messaging_notifications options
#
# This resource configures Oslo Notifications resources for an OpenStack service.
# It will manage the [oslo_messaging_notifications] section in the given config resource.
#
# === Parameters:
#
# [*driver*]
#  (Optional) The Driver(s) to handle sending notifications.
#  Possible values are messaging, messagingv2, routing, log, test, noop.
#  Defaults to $::os_service_default.
#
# [*transport_url*]
#  (Optional) A URL representing the messaging driver to use for
#  notifications. If not set, we fall back to the same
#  configuration used for RPC.
#  Defaults to $::os_service_default.
#
# [*topics*]
#  (Optional) AMQP topic(s) used for OpenStack notifications
#  Defaults to $::os_service_default.
#
define oslo::messaging::notifications(
  $driver        = $::os_service_default,
  $transport_url = $::os_service_default,
  $topics        = $::os_service_default,
) {

  $notification_options = {
    'oslo_messaging_notifications/driver' => { value => $driver },
    'oslo_messaging_notifications/transport_url' => { value => $transport_url },
    'oslo_messaging_notifications/topics' => { value => $topics },
  }

  create_resources($name, $notification_options)
}