### Tutorial
??? example "Customize and parse cli arguments"
    ```python
    import argparse

    from omni.isaac.lab.app import AppLauncher

    # create argparser
    parser = argparse.ArgumentParser(description="Tutorial on running IsaacSim via the AppLauncher.")
    parser.add_argument("--size", type=float, default=1.0, help="Side-length of cuboid")
    # SimulationApp arguments https://docs.omniverse.nvidia.com/py/isaacsim/source/extensions/omni.isaac.kit/docs/index.html?highlight=simulationapp#omni.isaac.kit.SimulationApp
    parser.add_argument(
        "--width", type=int, default=1280, help="Width of the viewport and generated images. Defaults to 1280"
    )
    parser.add_argument(
        "--height", type=int, default=720, help="Height of the viewport and generated images. Defaults to 720"
    )

    # append AppLauncher cli args
    AppLauncher.add_app_launcher_args(parser)
    # parse the arguments
    args_cli = parser.parse_args()
    # launch omniverse app
    app_launcher = AppLauncher(args_cli)
    simulation_app = app_launcher.app
    ```
    Now we can access the cli args through the `args_cli` object. For example, `args_cli.size` will return the value of the `size` argument.

??? example "InteractiveScene"



??? example "Direct Workflow RL Env"



??? example "Register Custom RL Env"



??? example     


### Test Environment
Zero-action agent
```
./isaaclab.sh -p source/standalone/environments/zero_agent.py --task $registered_env_num$ --num_envs 32
``` 
Random agent
```
./isaaclab.sh -p source/standalone/environments/random_agent.py --task $registered_env_name$ --num_envs 32
```