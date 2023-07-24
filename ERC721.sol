// SPDX Lincense-Identifier: MIT

// solidity compiler
pragma solidity ^0.8.17;

// import from openzeppelin contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// create your contract
contract GumaNft is ERC721 {
    
    // Set the data structure for the nft.
    
    struct GumaNft {
        uint256 id;
        address owner;
        string metaData;
    }
        
    // set up an array to hold all nfts
    
    NftId[] public GumaNfts;
    
    // implement the constructor function
    constructor() ERC721 ("GumaNft", "GMA") {}
    
    // implement the mint function
    
    function mint (address _to, string memory metaData) public {
        
        uint256 newNft = GumaNfts.length;
        GumaNfts.push(NftId(newNft, _to, metaData));
        _mint (_to, newNft);
    }
    
    // implement the transfer function
    
    function transferFrom (address from, address _to, uint256 nftId ) public {
        require (_exists(nftId), "Token does not exist");
        require (_isApprovedOrOwner(msg.sender, nftId), "You are not the owner");
        _transfer(msg.sender, _to, nftId);
    }
    
    // implement the burn function
    
    function burn (uint256 nftId) public {
        require (_isApprovedOrOwner(msg.sender, nftId), "Can be done by only owner");
        
        _burn(nftId);
    }

}