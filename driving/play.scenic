
param map = localPath('../../assets/maps/CARLA/Town01.xodr')
model scenic.domains.driving.model
import scenic
from scenic.simulators.newtonian import NewtonianSimulator
scenario = scenic.scenarioFromString('new Car with behavior FollowLaneBehavior',
                                   model='scenic.simulators.newtonian.driving_model',
                                   params={"map":"localPath('../../assets/maps/CARLA/Town01.xodr')"},
                                   mode2D=True)
scene, _ = scenario.generate()
simulator = NewtonianSimulator()
simulation = simulator.simulate(scene, maxSteps=10, maxIterations=1)
if simulation:  # `simulate` can return None if simulation fails
        result = simulation.result
        for i, state in enumerate(result.trajectory):
                egoPos, parkedCarPos = state
                print(f'Time step {i}: ego at {egoPos}; parked car at {parkedCarPos}')

        # replay trial and error
        # replay = simulation.getReplay(scene)
        # simulation.replay(scene, replay)