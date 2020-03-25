import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import 'select2/dist/css/select2.css';

import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from '../plugins/init_autocomplete';

import { initStarRating } from '../plugins/init_star_rating';

import { initSelect2 } from '../plugins/init_select2';

initMapbox();

initStarRating();

initSelect2();
