module DataHelper

  def shp_field_type(type)
    case type
      when 'N' then :integer
      when 'F' then :float
      when 'D' then :date
      else
        :string
    end
  end

  def shp_geom_type(type)
    case type
      when ShpType::POINT then :point
      when ShpType::POLYLINE then :multi_line_string
      when ShpType::POLYGON then :multi_polygon
      when ShpType::MULTIPOINT then :multi_point
    end
  end
end
