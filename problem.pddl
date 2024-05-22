(define (problem martian_rover_problem)
    (:domain martian_rover)
    (:objects
        mr1 - rover
        loc1 loc2 loc3 - location
        spectrometer camera radar - instrument
    )
    
    (:init
        (at mr1 loc1)
        (requird loc1 radar)
        (requird loc2 camera)
        (requird loc3 spectrometer)
        
        
    )
    
    (:goal (and
        
        (data_transmitted mr1 loc1 radar)
        (data_transmitted mr1 loc2 camera)
        (data_transmitted mr1 loc3 spectrometer)
        
        
        
        
    ))
)
