// Third stellation of the dodecahedron.
// originally generated by pypolys, but hand-edited.
// Ned Batchelder.

#declare Shadow=1;
#declare Mask=0;
#declare Star=1;

#include "colors.inc"

#if (Dark)
    // Sky and floor don't quite transfer color the same. Ad-hoc adjustment to
    // get them to be seamless.
    #declare sky_color = rgb <37/256, 37/256, 37/256>;
    #declare floor_color = rgb <35/256, 35/256, 35/256>;
#else
    #declare sky_color = White;
    #declare floor_color = White;
#end

camera {
    location  <-1, -.45, -2.3>
    direction <0, 0,  1>
    up        <0, 1,  0>
    right     <1, 0,  0>
    look_at   <0, 0,  0>
}

light_source {
    <-4, 6, -6>
    color White
    area_light <1, 0, 0>, <0, 0, 1>, 8,8
    adaptive 1
    jitter
}

sky_sphere {
    pigment {
        #if (Mask)
        Black
        #else
        sky_color
        #end
    }
}

// Floor
plane {
    <0, 1, 0>, -1
    pigment {
        #if (Mask)
        Black
        #else
        floor_color
        #end
    }
    finish {
        ambient 1.1     // Lighten the shadow.
        diffuse 1
        brilliance 0    // No fade-off or horizon.
    }
    #if (!Shadow)
    no_image
    #end
}

global_settings {
    assumed_gamma 2.2
    ambient_light 0.9
    radiosity {
        brightness 0.4
        recursion_limit 5
        count 200
        error_bound 0.1
        //distance_maximum 10
        //low_error_factor 0.5
        nearest_count 10
        minimum_reuse 0.005
    }
}

#declare tex =
texture {
    #if (Mask)
    pigment { White }
    finish { ambient 10 diffuse 0 brilliance 0 }
    #else
        #if (Dark)
            pigment { White }
            finish { ambient 20 diffuse 1.3 }
        #else
            pigment { White * .95 }
            finish { ambient 1 diffuse .7 }
        #end
    #end
}

// The Star

object {
    union {
        polygon{ 6,
            <-0.57735026919, -0.57735026919, -0.57735026919>, <0.934172358963, 0.356822089773, 0.0>, <-0.934172358963, 0.356822089773, 0.0>, <0.57735026919, -0.57735026919, -0.57735026919>, <0.0, 0.934172358963, 0.356822089773>, <-0.57735026919, -0.57735026919, -0.57735026919>
        }
        polygon{ 6,
            <0.356822089773, 0.0, -0.934172358963>, <0.356822089773, 0.0, 0.934172358963>, <-0.57735026919, 0.57735026919, -0.57735026919>, <0.934172358963, -0.356822089773, 0.0>, <-0.57735026919, 0.57735026919, 0.57735026919>, <0.356822089773, 0.0, -0.934172358963>
        }
        polygon{ 6,
            <0.57735026919, -0.57735026919, 0.57735026919>, <-0.934172358963, 0.356822089773, 0.0>, <0.934172358963, 0.356822089773, 0.0>, <-0.57735026919, -0.57735026919, 0.57735026919>, <0.0, 0.934172358963, -0.356822089773>, <0.57735026919, -0.57735026919, 0.57735026919>
        }
        polygon{ 6,
            <0.356822089773, 0.0, 0.934172358963>, <-0.57735026919, -0.57735026919, -0.57735026919>, <0.0, 0.934172358963, 0.356822089773>, <0.0, -0.934172358963, 0.356822089773>, <-0.57735026919, 0.57735026919, -0.57735026919>, <0.356822089773, 0.0, 0.934172358963>
        }
        polygon{ 6,
            <0.356822089773, 0.0, -0.934172358963>, <-0.57735026919, 0.57735026919, 0.57735026919>, <0.0, -0.934172358963, -0.356822089773>, <0.0, 0.934172358963, -0.356822089773>, <-0.57735026919, -0.57735026919, 0.57735026919>, <0.356822089773, 0.0, -0.934172358963>
        }
        polygon{ 6,
            <0.57735026919, 0.57735026919, -0.57735026919>, <-0.356822089773, 0.0, 0.934172358963>, <-0.356822089773, 0.0, -0.934172358963>, <0.57735026919, 0.57735026919, 0.57735026919>, <-0.934172358963, -0.356822089773, 0.0>, <0.57735026919, 0.57735026919, -0.57735026919>
        }
        polygon{ 6,
            <-0.57735026919, 0.57735026919, -0.57735026919>, <0.0, -0.934172358963, 0.356822089773>, <0.57735026919, 0.57735026919, -0.57735026919>, <-0.934172358963, -0.356822089773, 0.0>, <0.934172358963, -0.356822089773, 0.0>, <-0.57735026919, 0.57735026919, -0.57735026919>
        }
        polygon{ 6,
            <-0.356822089773, 0.0, -0.934172358963>, <0.57735026919, -0.57735026919, 0.57735026919>, <0.0, 0.934172358963, -0.356822089773>, <0.0, -0.934172358963, -0.356822089773>, <0.57735026919, 0.57735026919, 0.57735026919>, <-0.356822089773, 0.0, -0.934172358963>
        }
        polygon{ 6,
            <0.57735026919, -0.57735026919, -0.57735026919>, <-0.356822089773, 0.0, 0.934172358963>, <0.57735026919, 0.57735026919, -0.57735026919>, <0.0, -0.934172358963, 0.356822089773>, <0.0, 0.934172358963, 0.356822089773>, <0.57735026919, -0.57735026919, -0.57735026919>
        }
        polygon{ 6,
            <0.57735026919, 0.57735026919, 0.57735026919>, <0.0, -0.934172358963, -0.356822089773>, <-0.57735026919, 0.57735026919, 0.57735026919>, <0.934172358963, -0.356822089773, 0.0>, <-0.934172358963, -0.356822089773, 0.0>, <0.57735026919, 0.57735026919, 0.57735026919>
        }
        polygon{ 6,
            <-0.356822089773, 0.0, 0.934172358963>, <0.57735026919, -0.57735026919, -0.57735026919>, <-0.934172358963, 0.356822089773, 0.0>, <0.57735026919, -0.57735026919, 0.57735026919>, <-0.356822089773, 0.0, -0.934172358963>, <-0.356822089773, 0.0, 0.934172358963>
        }
        polygon{ 6,
            <-0.57735026919, -0.57735026919, 0.57735026919>, <0.934172358963, 0.356822089773, 0.0>, <-0.57735026919, -0.57735026919, -0.57735026919>, <0.356822089773, 0.0, 0.934172358963>, <0.356822089773, 0.0, -0.934172358963>, <-0.57735026919, -0.57735026919, 0.57735026919>
        }
    }
    texture { tex }

    rotate <0, 0, 30>

    #if (Mask)
    no_shadow
    #end
    #if (!Star)
    no_image
    #end
}
