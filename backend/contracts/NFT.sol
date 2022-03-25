// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract NFT is ERC721 , Ownable{
    using Counters for Counters.Counter;
     using Strings for uint256;
      Counters.Counter private _tokenIds;

       uint256 public maxSupply = 5260;

       uint256 public rarity0;//0
    uint256 public rarity1;//1
    uint256 public rarity2;//2
    uint256 public rarity3;//3
    uint256 public rarity4;//4
    uint256 public rarity5;//5

     uint256 public rarity0_limit=2500;//0
    uint256 public rarity1_limit=1500;//1
    uint256 public rarity2_limit=500;//2
    uint256 public rarity3_limit=160;//3
    uint256 public rarity4_limit=300;//4
    uint256 public rarity5_limit=200;//5

     struct NftDetails{
        address[] owners;
        
    }

    uint256[] _allTokens;

    
    mapping(address => bool) private _owner;
    mapping(uint256=>NftDetails) private _NftDetails;
    mapping(address => uint256) public addressMintedBalance;
    mapping(uint256 => uint256) public nftType;
     // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;

     // Mapping from owner to list of owned token IDs
    mapping(address => mapping(uint256 => uint256)) private _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _tokenIdType;

     mapping(uint256 => uint256) private _allTokensIndex;
//,address pubSale
    constructor() ERC721("Jarlath", "JR") {
        _owner[_msgSender()] = true;
     //   _owner[preSale] = true;
    }

    function tokenType(uint256 id)public view returns(uint256){
        return _tokenIdType[id];
    }

    function baseURI() public view returns(string memory){
        return "https://ipfs.io/ipfs/";
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721URIStorage: URI query for nonexistent token");

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = baseURI();

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }

        return super.tokenURI(tokenId);
    }

    function setTokenURI(uint256 tokenId, string memory tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = tokenURI;
    }

    function setNftDetails(uint256 _newItemId,address owner)private{
        _NftDetails[_newItemId].owners.push(owner);
        
    }

    function addOwner(address owner_) public {
        require(_owner[_msgSender()]==true,"cannot Assign owner");
        _owner[owner_]=true;
    }

    function getNftDetails(uint256 _tokenId)private view returns(NftDetails memory){
        return _NftDetails[_tokenId];
    }

        function createToken(string memory tokenURI , address account,uint8 nftType) public returns(uint) {
        require(_owner[_msgSender()]==true,"Not authorized to mint");
        require(_tokenIds.current() < 5 ,"all NFTs Minted");
        require(addressMintedBalance[account] < 5 , "You cannot have more than 5 NFTs");
        require(inc_nftType(nftType));
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        setNftDetails(newItemId,account);
        _mint(account, newItemId);
        setTokenURI(newItemId, tokenURI);
        _tokenIdType[newItemId]=nftType;
        addressMintedBalance[account]++;
        return newItemId;
    }

     //returns the total number of Nfts minted from this contract
    function totalSupply() private view returns(uint256){
        return _tokenIds.current();
    }

    function getTime() private view returns(uint256){
        return block.timestamp;
    }


    function inc_nftType(uint8 no) private returns(bool){
            if(no==0){
                require(rarity0<rarity0_limit,"all Common trains minted");
                rarity0++;
                return true;
            }else if(no==1){
                require(rarity1<rarity1_limit,"all Rare trains minted");
                rarity1++;
                return true;
            }else if(no==2){
                require(rarity2<rarity2_limit,"all Epic trains minted");
                rarity2++;
                return true;
            }else if(no==3){
                require(rarity3<rarity3_limit,"all Legendry trains minted");
                rarity3++;
                return true;
            }else if(no==4){
                require(rarity4<rarity4_limit,"all Common staions minted");
                rarity4++;
                return true;
            }else if(no==5){
                require(rarity5<rarity5_limit,"all Mitic stations minted");
                rarity5++;
                return true;
            }else{
                require(false,"Type not found");
            }
    }

    function tokenOfOwnerByIndex(address owner, uint256 index) public view virtual returns (uint256) {
        require(index < ERC721.balanceOf(owner), "ERC721Enumerable: owner index out of bounds");
        return _ownedTokens[owner][index];
    }

    function tokenByIndex(uint256 index) public view virtual  returns (uint256) {
        require(index <= maxSupply, "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }

      function _removeTokenFromOwnerEnumeration(address from, uint256 tokenId) private {
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = ERC721.balanceOf(from) - 1;
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
        }

        // This also deletes the contents at the last position of the array
        delete _ownedTokensIndex[tokenId];
        delete _ownedTokens[from][lastTokenIndex];
    }

     function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length - 1;
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        delete _allTokensIndex[tokenId];
        _allTokens.pop();
    }


    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (from == address(0)) {
            _addTokenToAllTokensEnumeration(tokenId);
        } else if (from != to) {
            _removeTokenFromOwnerEnumeration(from, tokenId);
        }
        if (to == address(0)) {
            _removeTokenFromAllTokensEnumeration(tokenId);
        } else if (to != from) {
            _addTokenToOwnerEnumeration(to, tokenId);
        }
    }

   
    function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
        uint256 length = ERC721.balanceOf(to);
        _ownedTokens[to][length] = tokenId;
        _ownedTokensIndex[tokenId] = length;
    }

    
    function _addTokenToAllTokensEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function AirDrop(string memory tokenURI , address account,uint8 nftType) public onlyOwner {
        createToken(tokenURI ,account,nftType);
    }

}
