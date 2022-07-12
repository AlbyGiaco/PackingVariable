pragma solidity ^0.8.0;

contract PackingVariable {
    function encodeWithKey(
        bytes32 key,
        uint256 value1,
        uint8 value2,
        address value3,
        uint32 value4
    ) external {
        assembly {
            sstore(key, value1)
            sstore(add(key, 32), value2)
            sstore(add(key, 33), value3)
            sstore(add(key, 53), value4)
        }
    }

    function decodeWithKey(bytes32 key)
        external
        view
        returns (
            uint256 value1,
            uint8 value2,
            address value3,
            uint32 value4
        )
    {
        assembly {
            value1 := sload(key)
            value2 := sload(add(key, 32))
            value3 := sload(add(key, 33))
            value4 := sload(add(key, 53))
        }
    }
    // function decodeext(uint256 key) external returns (uint256) {
    //     Storage storage s = getStorage();
    //     bytes32 keyToStorage = keccak256(abi.encodePacked(key));

    //     return decode(key, s.dataMap[key]);
    // }

    // function encodeext(uint256 key, uint256 value) external {
    //     encode(key, value);
    // }

    // function decode2(bytes memory data) public {
    //     uint256 a;
    //     uint32 b;
    //     address c;
    //     assembly {
    //         a := mload(add(data, 32))
    //         b := mload(add(data, 36))
    //         c := mload(add(data, 46))
    //     }

    //     console.log("a:", a);
    //     console.log("b:", b);
    //     console.log("c:", c);
    // }

    // function decode2ext() external {
    //     Storage storage s = getStorage();
    //     bytes storage data = s.data;
    //     decode2(data);
    // }

    // function encode2(
    //     bytes memory data,
    //     bytes32 key,
    //     uint256 value,
    //     uint32 index,
    //     address dataAddress
    // ) public {
    //     assembly {
    //         mstore(
    //             add(
    //                 data,
    //                 32 //uint256
    //             ),
    //             value
    //         )

    //         mstore(
    //             add(
    //                 data,
    //                 36 //4 uint32
    //             ),
    //             shl(32, index)
    //         )

    //         mstore(
    //             add(
    //                 data,
    //                 46 //20 address
    //             ),
    //             shl(36, dataAddress)
    //         )
    //     }
    //     console.log("after encode2");
    //     Storage storage s = getStorage();
    //     s.data = data;
    // }

    // function encode2ext(
    //     bytes32 key,
    //     uint256 value,
    //     uint32 index,
    //     address dataAddress
    // ) external {
    //     bytes32 keyToStorage = key;
    //     bytes storage data;
    //     console.log("inside encode2");
    //     assembly {
    //         data.slot := keyToStorage
    //     }

    //     encode2(data, key, value, index, dataAddress);
    // }

    // function decode(uint256 key, bytes memory copy) internal returns (uint256) {
    //     bytes32 keyToStorage = keccak256(abi.encodePacked(key));

    //     console.log("here7");

    //     uint256 a;
    //     assembly {
    //         a := mload(add(copy, 32))
    //     }
    //     console.log("here8");

    //     // uint256 data = abi.decode(a, (uint256));
    //     console.log("data: ", a);
    //     return a;
    // }

    // function encode(uint256 key, uint256 a) internal {
    //     Storage storage s = getStorage();
    //     console.log("here2");

    //     bytes32 keyToStorage = keccak256(abi.encodePacked(key));
    //     console.log("here3");

    //     s.dataMap[key] = abi.encode(a);
    //     console.log("here4");
    // }

    // function getStorage() internal view returns (Storage storage s) {
    //     console.log("here1");

    //     bytes32 k = keccak256("storage-location");
    //     assembly {
    //         s.slot := k
    //     }
    // }
}
