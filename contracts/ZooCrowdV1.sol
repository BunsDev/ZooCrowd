// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


// ZooCrowd is a decentralized crowdfunding application. Anyone can start fundraising for local animal shelters / people in need / endangered species saving campaigns.
// Fundraising may be running for up to 30 days. If it didn't reach the desired goal in time, donators may refund their ZooCoins. If it succeeds, raised funds are being transfered to campaign creator.

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ZooCrowd is Ownable {
    using SafeMath for uint256;
    
    uint256 id = 0;
    
    struct Campaign {
        
        uint256 id;
        address creator;
        uint256 goal;
        uint256 raisedfunds;
        string summary;
        string description;
        string url;
        bool paid;
        bool active;
        uint256 deadline;

    }
    
    
    mapping(uint256 => Campaign) public campaignsContainer;
    
    mapping(address => uint256[]) public donatorCampaigns;
    mapping(address => uint256[]) public creatorCampaigns;
    mapping(uint256 => mapping(address => uint256)) public paymentsContainer;
    
    event campaignCreated(uint256 id, address creator, string summary, string description, string url, uint256 deadline, uint256 goal);
    event contributionReceived(uint256 id, address contributor, uint256 amount, uint256 currentTotal);
    event CreatorPaid(uint256 id, address recipient);
    event refundDone(uint256 id, address contributor, uint256 amount);
    
    IERC20 private _coin;
    
    address _mainWallet;
    
    function counter() internal returns(uint){
        id++;
        return id;
    }
    
    constructor (IERC20 _Zoo) {
        _coin = _Zoo;
        _mainWallet = address(this);
    }
    
    function createCampaign(string memory summary, string memory description,string memory url, uint256 goal, uint256 deadline) public returns(uint256) {
        
        require(goal >= 10, "Goal cannot be less than 10 ZOO");
        require(deadline <= 30, "Fundraising cannot be longer than 30 days.");
        
        uint256 newId = counter();
        
        campaignsContainer[newId].id = newId;
        campaignsContainer[newId].creator = msg.sender;
        campaignsContainer[newId].raisedfunds = 0;
        campaignsContainer[newId].goal = goal;
        campaignsContainer[newId].summary = summary;
        campaignsContainer[newId].description = description;
        campaignsContainer[newId].url = url;
        campaignsContainer[newId].paid = false;
        campaignsContainer[newId].active = true;
        
        uint256 activeUntil = block.timestamp.add(deadline.mul(1 days));
        
        campaignsContainer[newId].deadline = activeUntil;
        
        emit campaignCreated(newId, msg.sender, summary, description, url, deadline, goal);
        
        return newId;
        
    }
    
    function editCampaign(uint256 _campaignId, string memory _summary, string memory _description, string memory _url) public {
        require(campaignsContainer[_campaignId].active == true, "Campaign must be active.");
        require(msg.sender == campaignsContainer[_campaignId].creator, "Must be a creator of a campaign to be able to edit it.");
        
        campaignsContainer[_campaignId].summary = _summary;
        campaignsContainer[_campaignId].description = _description;
        campaignsContainer[_campaignId].url = _url;
    }
    
    function donate(uint256 _campaignId, uint256 _amount) public {
        require(campaignsContainer[_campaignId].active == true, "Campaign must be active.");
        require(_amount > 0, "Amount must be greater than zero.");
        require(_coin.transferFrom(msg.sender, _mainWallet, _amount),"Error during transfer");
        
        campaignsContainer[_campaignId].raisedfunds = campaignsContainer[_campaignId].raisedfunds.add(_amount);
        
        paymentsContainer[_campaignId][msg.sender] = paymentsContainer[_campaignId][msg.sender].add(_amount);
        
        emit contributionReceived(_campaignId, msg.sender, _amount, campaignsContainer[_campaignId].raisedfunds);
        
        if(campaignsContainer[_campaignId].raisedfunds >= campaignsContainer[_campaignId].goal){
            campaignsContainer[_campaignId].paid = true;
            campaignsContainer[_campaignId].active = false;
            _coin.transfer(campaignsContainer[_campaignId].creator, campaignsContainer[_campaignId].raisedfunds);
        }
        
        if(campaignsContainer[_campaignId].active == true && block.timestamp >= campaignsContainer[_campaignId].deadline) {
            campaignsContainer[_campaignId].active = false;
        }
        
    }
    
    function getRefund(uint256 _campaignId, uint256 _amount) public{
        require(campaignsContainer[_campaignId].active == false, "Campaign must be expired.");
        require(campaignsContainer[_campaignId].paid == false, "Campaign must be not successful.");
        require(paymentsContainer[_campaignId][msg.sender] >= _amount, "Asked for withdrawal of funds more than deposited.");
        require(paymentsContainer[_campaignId][msg.sender] >= 0, "Withdraw amount must be greater than zero.");
        paymentsContainer[_campaignId][msg.sender] = paymentsContainer[_campaignId][msg.sender].sub(_amount);
        campaignsContainer[_campaignId].raisedfunds = campaignsContainer[_campaignId].raisedfunds.sub(_amount);
        _coin.transfer(msg.sender,_amount);
    }
    
    
    function getDonatedAmountForASingleCampaign(uint256 _campaignId) public view returns(uint256){
        return paymentsContainer[_campaignId][msg.sender];
    }
    
    function getCurrentIdCount() public view returns(uint256){
        return id;
    }
    
    function getCampaignById(uint256 _id) public view returns(Campaign memory){
        return campaignsContainer[_id];
    }
    
    function getMainWallet() public view returns(address){
        return _mainWallet;
    }
    
}
