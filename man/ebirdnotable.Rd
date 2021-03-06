% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ebirdnotable.R
\name{ebirdnotable}
\alias{ebirdnotable}
\title{Notable sightings}
\usage{
ebirdnotable(lat = NULL, lng = NULL, dist = NULL, locID = NULL,
  region = NULL, regtype = NULL, back = NULL, max = NULL,
  locale = NULL, provisional = FALSE, hotspot = FALSE, simple = TRUE,
  sleep = 0, ...)
}
\arguments{
\item{lat}{Decimal latitude. value between -90.00 and 90.00, up to two
decimal places of precision.}

\item{lng}{Decimal longitude. value between -180.00 and 180.00, up to
two decimal places of precision.}

\item{dist}{Distance defining radius of interest from given lat/lng in
kilometers (between 0 and 50, defaults to 25)}

\item{locID}{Vector containing code(s) for up to 10 locations of interest.}

\item{region}{Region code corresponding to selected region type.
For supported region and coding, see
https://confluence.cornell.edu/display/CLOISAPI/eBird-1.1-RegionCodeReference}

\item{regtype}{Region type you are interested in. can be "country"
(e.g. "US"), "subnational1" (states/provinces, e.g. "US-NV") or
"subnational2" (counties, not yet implemented, e.g. "US-NY-109"). Default
behavior is to try and match according to the region specified.}

\item{back}{Number of days back to look for observations (between
1 and 30, defaults to 14).}

\item{max}{Maximum number of result rows to return in this request
(between 1 and 10000, defaults to all).}

\item{locale}{Language/locale of response (when translations are available).
See http://java.sun.com/javase/6/docs/api/java/util/Locale.html
(defaults to en_US).}

\item{provisional}{Should flagged records that have not been reviewed
be included? (defaults to FALSE)}

\item{hotspot}{Should results be limited to sightings at birding hotspots?
(defaults to FALSE).}

\item{simple}{Logical. Whether to return a simple (TRUE, default) or detailed
(FALSE) set of results fields.}

\item{sleep}{Time (in seconds) before function sends API call (defaults to
zero.  Set to higher number if you are using this function in a loop with
many API calls).}

\item{...}{Curl options passed on to \code{\link[httr]{GET}}}
}
\value{
A data.frame containing the collected information:

"comName": species common name

"howMany": number of individuals observed, NA if only presence was noted

"lat": latitude of the location

"lng": longitude of the location

"locID": unique identifier for the location

"locName": location name

"locationPrivate": TRUE if location is not a birding hotspot

"obsDt": observation date formatted according to ISO 8601
   (e.g. 'YYYY-MM-DD', or 'YYYY-MM-DD hh:mm'). Hours and minutes are excluded
   if the observer did not report an observation time.

"obsReviewed": TRUE if observation has been reviewed, FALSE otherwise

"obsValid": TRUE if observation has been deemed valid by either the
   automatic filters or a regional viewer, FALSE otherwise

"sciName" species' scientific name

"subnational2Code": county code (returned if simple=FALSE)

"subnational2Name": county name (returned if simple=FALSE)

"subnational1Code": state/province ISO code (returned if simple=FALSE)

"subnational1Name": state/province name (returned if simple=FALSE)

"countryCode": country ISO code (returned if simple=FALSE)

"countryName": country name (returned if simple=FALSE)

"firstName": observer's first name (returned if simple=FALSE)

"lastName": observer's last name (returned if simple=FALSE)

"subID": submission ID (returned if simple=FALSE)

"obsID": observation ID (returned if simple=FALSE)

"checklistID": checklist ID (returned if simple=FALSE)

"presenceNoted": 'true' if user marked presence but did not count the
  number of birds. 'false' otherwise (returned if simple=FALSE)
}
\description{
Returns the most recent notable observations by either latitude/longitude,
hotspot or location ID, or particular region.
}
\note{
\code{ebirdnotable} requires that either latitude/longitude, location ID,
or region be passed to the function. Multiple entries will result in the most
specific being used. If none is supplied, defaults to lat/lng based on your IP.
}
\examples{
\dontrun{
ebirdnotable(lat=42, lng=-70)
ebirdnotable(region='US', max=10)
ebirdnotable(region='US-OH', regtype='subnational1')
}
}
\references{
\url{http://ebird.org/}
}
\author{
Rafael Maia \email{rm72@zips.uakron.edu}
}
