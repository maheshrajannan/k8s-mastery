Enahancements.md

# 1 Fix the CPU error.
Events:
  Type     Reason            Age                From               Message
  ----     ------            ----               ----               -------
  Warning  FailedScheduling  43s (x2 over 43s)  default-scheduler  0/1 nodes are available: 1 Insufficient cpu.

  https://stackoverflow.com/questions/38869673/pod-in-pending-state-due-to-insufficient-cpu

  increasing the number of pods to 3. Now to 2.

# 2
Productivity enhancing changes. Please make them.

  Remove Looks right.

Please note old and new values

Replace it with do pause features.

Finished Building Looks right ?Finished Pushing Looks right ?

# 3. Build and push each time the sub components.

Build and push image each time.

# 4. delete all images before pushing.

Ideally should auto-increment tags and push, but that requires more work.

# 4. ok. 

Apply ingress. Ensure that is not getting deleted and rebuilt each time.

Static ips are 1 penny an hour as compared to 10 pennies an hour for a K8s cluster.

This way all the hardcoding can be thrown away for good.

https://www.orange-networks.com/blogs/210-ingress-controller-simplified-routing-in-kubernetes

# 4. OK. Script refactoring.