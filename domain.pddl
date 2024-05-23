(define (domain martian_rover)
    (:requirements :strips :typing)
    (:types location instrument rover)
    
    (:predicates
        (at ?r - rover ?l - location)
        (stable ?r - rover)
        (instrument_deployed ?r - rover ?l - location)
        (instrument_on ?i - instrument)
        (data_collected ?l - location ?i - instrument)
        (processed ?i - instrument ?l - location)
        (transmission_window_open)
        (data_transmitted ?r - rover ?l - location ?i - instrument)
        (task_completed ?r - rover ?l - location ?i - instrument)
        (requird ?l - location ?i - instrument)
        (visit ?l - location)
        (sensor_active)
    )
    
    (:action move
        :parameters (?r - rover ?from ?to - location)
        :precondition (and (at ?r ?from) (not (stable ?r))
                        (not (visit ?to)))
        :effect (and (not (at ?r ?from)) (at ?r ?to) (visit ?to))
    )
    
    (:action position_stable
        :parameters (?r - rover ?l - location)
        :precondition (and (at ?r ?l) (not (stable ?r)))
        :effect (stable ?r)
    )
    
    (:action deploy_instrument
        :parameters (?r - rover ?l - location)
        :precondition (and (at ?r ?l) (stable ?r) (not(instrument_deployed ?r ?l)))
        :effect (instrument_deployed ?r ?l)
    )
    
    
    (:action turn_on_instrument
        :parameters (?r - rover ?l - location ?i - instrument)
        :precondition (and (instrument_deployed ?r ?l) (not (instrument_on ?i))
                            (not (sensor_active)) 
                        (requird ?l ?i)
                        )
        :effect (and (instrument_on ?i) (sensor_active))
    )
    
    
    (:action collect_data
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (instrument_deployed ?r ?l) (instrument_on ?i) 
                    (at ?r ?l) (stable ?r) (not (data_collected ?l ?i)))
        :effect (data_collected ?l ?i)
    )
    
    
    (:action turn_off_instrument
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (instrument_deployed ?r ?l) (data_collected ?l ?i) (instrument_on ?i)
                            (sensor_active))
        :effect (and (not (instrument_on ?i)) (not (sensor_active)))
    )
    
    
    (:action retract_instrument
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (instrument_deployed ?r ?l)  (not (instrument_on ?i)) 
                        (data_collected ?l ?i) (not (sensor_active)))
        :effect (not (instrument_deployed ?r ?l))
    )
    
    
    (:action process_data
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (data_collected ?l ?i)
                        (not (instrument_deployed ?r ?l))
                        (not (processed ?i ?l))
                        (stable ?r) (not (instrument_on ?i)) (not (sensor_active)))
        :effect (processed ?i ?l)
    )
    
    (:action stand
    
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (stable ?r)
                        (not (instrument_deployed ?r ?l))
                        (processed ?i ?l)
                        (not (sensor_active))
                        (not (instrument_on ?i))
                        (data_transmitted ?r ?l ?i)
                        (at ?r ?l)
                        )
        :effect (not (stable ?r))
    
    )
    
    
    (:action transmit_data
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and  (processed ?i ?l) (stable ?r)
                            (not (data_transmitted ?r ?l ?i))
                            (at ?r ?l)
        
                        )
        :effect (data_transmitted ?r ?l ?i)
    )
    
    
    
)
