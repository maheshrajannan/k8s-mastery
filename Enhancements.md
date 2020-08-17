Enahancements.md

# 1 Fix the CPU error.DONE
Events:
  Type     Reason            Age                From               Message
  ----     ------            ----               ----               -------
  Warning  FailedScheduling  43s (x2 over 43s)  default-scheduler  0/1 nodes are available: 1 Insufficient cpu.

  https://stackoverflow.com/questions/38869673/pod-in-pending-state-due-to-insufficient-cpu

  increasing the number of pods to 3. Now to 2.

# 2. Productivity enhancing changes.DONE
Productivity enhancing changes. Please make them.

  Remove Looks right.

Please note old and new values

Replace it with do pause features.

Finished Building Looks right ?Finished Pushing Looks right ?

# 3. Build and push each time the sub components.DOING

Build and push image each time.

# 4. delete all images before pushing.

Ideally should auto-increment tags and push, but that requires more work.

# 4. ok. 

Apply ingress. Ensure that is not getting deleted and rebuilt each time.

Static ips are 1 penny an hour as compared to 10 pennies an hour for a K8s cluster.

This way all the hardcoding can be thrown away for good.

https://www.orange-networks.com/blogs/210-ingress-controller-simplified-routing-in-kubernetes

# 4. OK. Script refactoring.

# 5. no space left on device

Step 7/15 : COPY . /app
failed to create rwlayer: mkdir /var/lib/docker/overlay2/da793e6844065908cfb0cd7ff48e1c7883b3fcff38c0067d1a3589dfae4a5cc2/work: no space left on device

https://stackoverflow.com/questions/30604846/docker-error-no-space-left-on-device

docker system prune

# 5. Add docker prune in proper places, to preven thsi from happening

# 6. rootless

https://www.baeldung.com/podman-intro

# 7. Add readiness probe.

Add readiness probe that self checks that something really came up...EASY low hanging fruit.

# 8. Test thoroughly before starting.