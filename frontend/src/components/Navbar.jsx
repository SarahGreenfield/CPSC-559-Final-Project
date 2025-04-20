import { Box, Flex, Button, Link, Text } from '@chakra-ui/react'
import { Link as RouterLink } from 'react-router-dom'
import { useWeb3 } from '../context/Web3Context'

const Navbar = () => {
  const { isConnected, address, connectWallet, disconnectWallet } = useWeb3()

  return (
    <Box bg="white" px={4} py={2} boxShadow="sm">
      <Flex maxW="1200px" mx="auto" justify="space-between" align="center">
        <Flex gap={6}>
          <Link as={RouterLink} to="/" _hover={{ textDecoration: 'none' }}>
            <Text fontSize="xl" fontWeight="bold">Pokemon Battle</Text>
          </Link>
          <Link as={RouterLink} to="/collection" _hover={{ textDecoration: 'none' }}>
            Collection
          </Link>
          <Link as={RouterLink} to="/battle" _hover={{ textDecoration: 'none' }}>
            Battle
          </Link>
          <Link as={RouterLink} to="/leaderboard" _hover={{ textDecoration: 'none' }}>
            Leaderboard
          </Link>
        </Flex>
        
        <Flex align="center" gap={4}>
          {isConnected ? (
            <>
              <Text fontSize="sm" color="gray.600">
                {address.slice(0, 6)}...{address.slice(-4)}
              </Text>
              <Button
                size="sm"
                colorScheme="red"
                variant="outline"
                onClick={disconnectWallet}
              >
                Disconnect
              </Button>
            </>
          ) : (
            <Button
              size="sm"
              colorScheme="blue"
              onClick={connectWallet}
            >
              Connect Wallet
            </Button>
          )}
        </Flex>
      </Flex>
    </Box>
  )
}

export default Navbar 