class Home < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude

  scope :available, -> { where(status: 'available') }
  scope :near_school,
        lambda {
          select('DISTINCT ON (homes.id) homes.*').joins(
            'INNER JOIN schools ON ST_DWithin (homes.coords, schools.coords, 1000)'
          )
        }

  validates :coords, :status, :beds, :baths, :coords, :price, presence: true

  def self.g_near(point, distance)
    where(
      'ST_DWithin(coords, :point, :distance)',
      { point: Geo.to_wkt(point), distance: distance * 1000 }
    )
  end

  def self.g_within_box(sw_point, ne_point)
    where(
      "coords && ST_MakeEnvelope(:sw_lon, :sw_lat, :ne_lon, :ne_lat, #{
        Geo::SRID
      })",
      {
        sw_lon: sw_point.longitude,
        sw_lat: sw_point.latitude,
        ne_lon: ne_point.longitude,
        ne_lat: ne_point.latitude
      }
    )
  end

  def self.g_within_polygon(points)
    polygon = Geo.polygon(points)
    where('ST_Covers(:polygon,coords)', polygon: Geo.to_wkt(polygon))
  end
end
