-----------------------------------------------------------------------
-- Batch Converts midi into a input file for RNN
-- 
print('START: Parsing Midi Files')
local dir = 'data/'
local resdir = 'data/res/'
local tmpfile = './tmp/tmp.txt'
os.execute('ls data/ | grep mid > '..tmpfile)

-- Get File and iterator over 
local f = io.open(tmpfile)
if not f then return end

for line in f:lines() do
  os.execute('./mid2asc '..dir..line..' > '..resdir..line..'.txt')
  print('./asc2mid '..dir..line..' > '..resdir..line..'.txt')
end

f:close()    

print('START: Building Input text')
-- Create input file for RNN
local tmpinput = 'tmp/tmp_in.txt'
local infile = 'input/input.txt'
local respath = 'data/res/'
os.execute('ls '..respath..' > '..tmpinput)

-- Get file and iterate
local inf = io.open(tmpinput)
if not inf then return end

for line in inf:lines() do
  os.execute('cat '..respath..line..' >> '..infile)
  print('cat '..respath..line..' >> '..infile)
end


inf:close()