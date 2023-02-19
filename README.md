# Adventure Time App

## Deliverables

An app that simplifies road trip planning. A user will be able to:

* plan a trip with multiple stops
* invite friends to help plan the trip
* create an itinerary
* save pictures taken at different spots during the trip
* provide recommendations for places to stop during the trip
* include turn by turn navigation ???

## Database (MySQL, Docker)

* [x] Create ddl script
* [x] Create a docker container
* [x] Create a Dockerfile

## Server (Spring)

### Model
* [x] User
    * userId **int**
    * email **string**
    * password **string**
    * disabled **boolean**
    * trips **ArrayList\<Trip>**
* [x] Profile
    * profileId **int**
    * profilePhoto **string**
    * profileDescription **string**
    * userId **int**
    * comments **ArrayList<\Comment>**
    * items **ArrayList\<Item>**
* [x] Trip
    * tripId **int**
    * startTime **LocalDate**
    * endTime **LocalDate**
    * tripReview **int**
    * totalDistance **int**
    * name **String**
    * items **ArrayList\<Item>**
    * comments **ArrayList\<Comment>**
* [x] Location
    * locationId **int**
    * latitude **string**
    * longitude **string**
    * name **string**
    * type **string**
    * photoUrl **string**
* [x] Item
    * itemId **int**
    * itemName **string**
    * tripId **int** 
    * itemDescription **string**
    * profileId **int**
    * itemQuantity **int**
    * isPacked **boolean**
* [x] Photo
    * photoId **int**
    * photo **String?**
    * tripLocationId **int**
    * caption **String**
* [x] Comment
    * commentId **int**
    * tripId **int**
    * commentBody **string**
    * profileId **int**
* [x] TripLocation
    * tripLocationId **int**
    * tripId **int**
    * location **object**
    * sortOrder **int**
    * photos **list\<Photo>**
* [x] LocationTrip
    * tripLocationId **int**
    * locationId **int**
    * trip **object**
    * sortOrder **int**
    * photos **list\<Photo>**

### Controllers

* [x] UserController
    * /user
    * GET: /user/{userId}
* [x] ProfileController
    * /profile
    * GET: /profile/{profileId}
    * POST: /profile
    * PUT: /profile/{profileId}
* [x] TripController
    * /trip
    * GET: /trip/{tripId}
    * POST: /trip
    * PUT: /trip/{tripId}
    * DELETE: /trip/{tripId}
* [x] LocationController
    * /location
    * GET: /location/{locationId}
    * POST: /location
    * PUT: /{locationId}
    * DELETE: /{locationId} (not delete location entirely just connection)
* [x] ItemController
    * /item
    * GET: /item/{itemId}
    * POST: /item
    * PUT: /{itemId}
    * DELETE: /{itemId}
* [x] PhotoController
    * /photo
    * GET: /photo/{photoId}
    * POST: /photo/{photoId}
    * DELETE: /photo/{photoId}
* [x] CommentController
    * /comment
    * GET: /comment/{commentId}
    * POST: /comment
    * PUT: /{commentId} Needed?
    * DELETE: /{commentId}
* [x] AuthController
    * POST: /authenticate
    * POST: /refresh-token
    * POST: /register
    * third party authentication: https://www.callicoder.com/spring-boot-security-oauth2-social-login-part-1/
* [x] TripLocationController
    * /trip/location
    * POST: /trip/location
    * PUT: /trip/location
    * DELETE: /trip/location/{tripId}/{locationId}
* [x] LocationTripController
    * /location/trip
    * POST: /location/trip
    * PUT: /location/trip
    * DELETE: /location/trip/{locationId}/{tripId}
* [x] ErrorResponse

#### Controller Tests

* [x] UserController
* [x] ProfileController
* [x] TripController
* [x] LocationController
* [x] ItemController
* [x] PhotoController
* [x] CommentController
* [x] AuthController
* [x] TripLocationController
* [x] LocationTripController

### Data

#### Mappers

* [x] UserMapper
* [x] ProfileMapper
* [x] TripMapper
* [x] LocationMapper
* [x] ItemMapper
* [x] PhotoMapper
* [x] CommentMapper
* [x] TripLocationMapper
* [x] LocationTripMapper

#### Repositories

* [x] UserRepository
    * findByEmail **User**
    * create **User**
    * update **boolean**
* [x] ProfileRepository
    * findByUserId **Profile**
    * create **Profile**
    * update **boolean**
* [x] TripRepository
    * findById **Trip**
    * create **Trip**
    * update **boolean**
    * deleteById **boolean**
* [x] LocationRepository
    * findById **Location**
    * add **Location**
    * update **boolean**
    * deleteById **boolean**
* [x] ItemRepository
    * findById **Item**
    * findByTrip **List\<Item>**
    * findByUser **List\<Item>**
    * add **Item**
    * update **boolean**
    * deleteById **boolean**
* [x] PhotoRepository
    * findById **Photo**
    * findByLocation **List\<Photo>**
    * add **Photo**
    * deleteById **boolean**
* [x] CommentRepository
    * findById **Comment**
    * findByTripId **List\<Comment>**
    * findByProfileId **List\<Comment>**
    * add **Comment**
    * update **boolean**
    * deleteById **boolean**
    * deleteByTripId **boolean**
* [x] TripLocationRepository
    * add **boolean**
    * update **boolean**
    * deleteByKey **boolean**
* [x] LocationTripRepository
    * add **boolean**
    * update **boolean**
    * deleteByKey **boolean**

##### Repository Tests

* [x] UserRepository
* [x] ProfileRepository
* [x] TripRepository
* [x] LocationRepository
* [x] ItemRepository
* [x] PhotoRepository
* [x] CommentRepository
* [x] TripLocationRepository
* [x] LocationTripRepository

### Domain

**Rules**
* User
    * [x] userId required
    * [x] email required
    * [x] password required
    * [x] disabled not required
    * [x] trips not required
* Profile
    * [x] profileId required
    * [x] profilePhoto not required
    * [x] profileDescription not required
    * [x] userId required
    * [x] comments not required
    * [x] items not required
* Trip
    * [x] startTime must be before endTime
    * [x] must have at least two locations
    * [x] name is required (use starting and ending destinations if null)
* Location
    * [x] locationId required
    * [x] latitude required
    * [x] longitude required
    * [x] name not required
    * [x] type required
    * [x] photoUrl (use default pic if not available)
* Item
    * [x] itemId required
    * [x] name required
    * [x] tripId required
    * [x] description not required
    * [x] profileId not required
    * [x] quantity required. default 1.
    * [x] isPacked required
* Photo
    * [x] photoId required
    * [x] photo required
    * [x] locationId required
    * [x] caption not required
* Comment
    * [x] commentId required
    * [x] tripId required
    * [x] commentBody required
    * [x] profileId required
* TripLocation
    * [x] tripLocationId required
    * [x] tripId required
    * [x] locationId required
    * [x] sortOrder required
* LocationTrip
    * [x] locationTripId required
    * [x] tripId required
    * [x] locationId required
    * [x] sortOrder required

**Services**
* [x] UserService
    * findByUsername
    * add
    * update
    * disable
* [x] ProfileService
    * findByUserId
    * add
    * update
* [x] TripService
    * findById
    * add
    * update
    * deleteById
* [x] LocationService
    * findById
    * add
    * update
    * deleteById
* [x] ItemService
    * findById
    * add
    * update
    * deleteById
* [x] PhotoService
    * findById
    * findByLocation
    * add
    * deleteById
* [x] CommentService
    * findById
    * findByTripId
    * findByProfileId
    * add
    * update
    * deleteById
    * deleteByTripId
* [x] TripLocationService
    * add
    * update
    * deleteByKey
* [x] LocationTripService
    * add
    * update
    * deleteByKey

#### Domain Tests

* [x] UserService
* [x] ProfileService
* [x] TripService
* [x] LocationService
* [x] ItemService
* [x] PhotoService
* [x] CommentService
* [x] TripLocationService
* [x] LocationTripService
    
### Security

* [x] AppUserService
* [x] JwtConverter
* [x] JwtRequestFilter
* [x] SecurityConfig

## API (MapBox)

```
MapBox API Call

https://docs.mapbox.com/api/overview/
```
Mapbox APIs are divided into four distinct services: Maps, Navigation, Search, and Accounts. 
Each of these services has its own overview page in this documentation. 
These overview pages are divided into the individual APIs that make up the service. 
The documentation for each API is structured by endpoints. 
An endpoint is a specific method within an API that performs one action and is located at a specific URL.

```

## UI (React, Semantic, Leaflet)

### src
* [x] App.js
* [x] ErrorSummary.js
* [x] NotFound.js
* [x] NavBar.js
* [x] design above classes

### Services
* [x] AuthApi.js
* [x] TripApi.js
* [x] LocationApi.js
* [x] ProfileApi.js
* [x] CommentApi.js
* [x] PhotoApi.js

### Map
* [x] Leaflet Implementation

### Trip
* [x] Trip.js
* [x] design above classes

### Location
* [x] Location.js
* [x] design above classes

### Profile
* [x] Profile.js
* [x] design above classes

### Comment
* [x] Comment.js
* [x] design above classes

### Photo
* [x] Photo.js
* [x] design above classes

### Login
* [x] Login.js
* [x] design above classes

### Context
* [x] AuthContext


## Deployment (15 hours)

### UI Docker (3 hours)
* [x] .gitignore
* [x] .dockerignore
* [x] Dockerfile
* [x] nginx.conf
* [x] DockerCompose.yml

### API Docker(3 hours)
* [x] .gitignore
* [x] .dockerignore
* [x] Dockerfile
* [x] DockerCompose.yml

### RDS (1 hour)

### AWS Work (8 hours)
* [x] UI Beanstalk (4 hours)
* [x] API Beanstalk (4 hours)
