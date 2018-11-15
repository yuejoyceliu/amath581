function f = fHeun(t,y,dt)

f0 = -3*y*sin(t);
f1 = -3*(y+dt*f0)*sin(t+dt);
f = y + dt/2*(f0+f1);