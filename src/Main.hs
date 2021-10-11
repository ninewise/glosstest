import           Graphics.Gloss.Interface.Pure.Game

-- De wereld houdt de huidige locatie, de tijd en een bewegingsvector bij.
type X = Float
type Y = Float
type T = Float
data World = World X Y T (X -> X) (Y -> Y)

stepsize, circlesize :: Float
stepsize = 1.4
circlesize = 20

main :: IO ()
main = play window bgcolour fps initialWorld render handle step
  where window = InWindow "Gloss Testapplicatie" (200, 300) (0, 0)
        bgcolour = dim white
        fps = 60
        initialWorld = World 0 0 0 id id

render :: World -> Picture
render (World x y t _ _) = translate (x + sin (30 * t)) (y + sin (53 * t)) $ circle circlesize


handle :: Event -> World -> World
handle (EventKey (SpecialKey KeyLeft) Down _ _)  (World x y t fx fy) = World x y t (+ (-stepsize)) fy
handle (EventKey (SpecialKey KeyRight) Down _ _) (World x y t fx fy) = World x y t (+ stepsize) fy
handle (EventKey (SpecialKey KeyUp) Down _ _)    (World x y t fx fy) = World x y t fx (+ stepsize)
handle (EventKey (SpecialKey KeyDown) Down _ _)  (World x y t fx fy) = World x y t fx (+ (-stepsize))
handle (EventKey (SpecialKey KeyLeft) Up _ _)  (World x y t fx fy) = World x y t id fy
handle (EventKey (SpecialKey KeyRight) Up _ _) (World x y t fx fy) = World x y t id fy
handle (EventKey (SpecialKey KeyUp) Up _ _)    (World x y t fx fy) = World x y t fx id
handle (EventKey (SpecialKey KeyDown) Up _ _)  (World x y t fx fy) = World x y t fx id
handle _                                         w             = w

step :: Float -> World -> World
step dt (World x y t fx fy) = World (fx x) (fy y) (t + dt) fx fy
