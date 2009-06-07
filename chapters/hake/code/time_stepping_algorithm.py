while not stop_sim:
    # The next event
    event = min(discrete_objects)
    dt = event.next_time()
    
    # Step the event and check result
    while not event.step():
        event = min(discrete_objects)
        dt = event.next_time()
    
    # Update the other discrete objects with dt
    for obj in discrete_objects:
        obj.update_time(dt)
    
    # Solve the continuous equation
    ca_field.solve(dt)
    ca_field.send()
    
    # Distribute the event
    event.send()
