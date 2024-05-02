param map = localPath('../../assets/maps/CARLA/Town01.xodr')
import scenic
from scenic.simulators.newtonian import NewtonianSimulator


model scenic.domains.driving.model

scenario ParkedCar(gap=0.25):
    precondition: ego.laneGroup._shoulder != None
    setup:
        spot = new OrientedPoint on visible ego.laneGroup.curb
        parkedCar = new Car left of spot by gap

scenario Main():
    setup:
        ego = new Car with behavior FollowLaneBehavior
    compose:
        do ParkedCar(gap=0.25)
