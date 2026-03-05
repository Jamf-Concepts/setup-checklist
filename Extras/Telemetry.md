# Telemetry

The app sends tracking signals to a service we use to gather usage data. Currently the service is [TelemetryDeck](https://telemetrydeck.com/).

In the ping, some data is transferred to the service, and the time and date of the signal are recorded.

No signals are sent when `DEBUG` is set to `true`.

We use this data to determine the usage of the app and where to focus future development, so we appreciate when you let us gather this data.

You can suppress the tracking signal by setting the `PLEASE_DO_NOT_TRACK` boolean key to `true` in the configuration profile.
