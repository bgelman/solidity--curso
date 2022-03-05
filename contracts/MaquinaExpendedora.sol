// SPDX-License-Identifier: Unlicense   

pragma solidity >= 0.8.0 < 0.9.0;

contract MaquinaExpendendora{

    struct bebida{
        string nombreBebida;
        uint256 precioBebida;
        bool estaPagado;
    }

    mapping (uint => bebida) _bebidas;

    function crearBebida (uint256 idBebida, string memory _nombreBebida, uint256 _precioBebida) public {

        bebida storage nuevaBebida = _bebidas[idBebida];

        nuevaBebida.nombreBebida = _nombreBebida;
        nuevaBebida.precioBebida = _precioBebida;
        nuevaBebida.estaPagado = false;
    }

    function comprarBebida (uint256 idBebida ) payable public{
        require (msg.value == _bebidas[idBebida].precioBebida,"Debe enviar la cantidad exacta de Ether");

        payable(msg.sender).transfer(msg.value);
        

    }

    function getEstadoBebida( uint idBebida) public view returns (bebida memory infoBebida){
        infoBebida = _bebidas[idBebida];
        return infoBebida;
    }
}