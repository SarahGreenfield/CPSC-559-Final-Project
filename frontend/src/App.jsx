import { ChakraProvider, Box } from '@chakra-ui/react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Navbar from './components/Navbar'
import Home from './pages/Home'
import Battle from './pages/Battle'
import Collection from './pages/Collection'
import Leaderboard from './pages/Leaderboard'
import { Web3Provider } from './context/Web3Context'

function App() {
  return (
    <ChakraProvider>
      <Web3Provider>
        <Router>
          <Box minH="100vh" bg="gray.50">
            <Navbar />
            <Box p={4}>
              <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/battle" element={<Battle />} />
                <Route path="/collection" element={<Collection />} />
                <Route path="/leaderboard" element={<Leaderboard />} />
              </Routes>
            </Box>
          </Box>
        </Router>
      </Web3Provider>
    </ChakraProvider>
  )
}

export default App 