# HotReRAM
This file will provide information about how to use our Thermal model of ReRAM/Memristor. This simulator is based on basic thermal model of HotSpot simulator. We enriched the basic thermal model of HotSpot by adding primary thermal properties of ReRAM. The primary thermal properties of ReRAM include thermal resistance and conductance of ReRAM materials. The power values of ReRAM cache can be derived from NVSim simulator, used for simulating non-volatile memories (NVMs). 

Simulation Steps to be followed:
1. Simulate your architecture in gem5 full system simulator and update cache latency by considering ReRAM cache. Run benchmark (e.g. PARSEC) applications and collect periodic stats. 
2. The stats should next be used to derive power consumption of different on-chip components. For core components, McPAT can be used, whereas for NVM caches, we use NVSim.
3. The derived power values need to be fed in the HotReRAM as input along with floorplan and the temperature values of last time-stamp.

Floorplan preparation:
The whole cache is here divided into 64 smaller chunks for power and thermal analysis. For your respective cache size, use this granularity for better result, and divide the cache accordingly. However, lowest granularity must not be lower than 4kiB. Prepare the floorplan and add it to the HotSpot and use our hotspot config file to generate thermal stats for ReRAM cache. This will produce results for the all chunks of the granularity of your choice. You can also use our shell script next to analyze the following basic characteristics of ReRAM: retention time, thermal stability and write latency. This will enable designers to analyze how cache performance changes with temporal and spatial thermal variances. 

