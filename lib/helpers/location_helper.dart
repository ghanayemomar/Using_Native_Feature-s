const GOOGLE_API_KEY = 'AIzaSyCS7M3g7sYeR6uyMsIXOt58-3OKuY4DKPQ';

class LocationHepler {
  static String generatedLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=AIzaSyCS7M3g7sYeR6uyMsIXOt58-3OKuY4DKPQ&signature=YOUR_SIGNATURE';
  }
}
