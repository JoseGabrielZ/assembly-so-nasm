# assembly-so-nasm
um simples SO que troca cores dos pixels infinitamente!

Para tornar esse arquivo asm, um "SO" bootavel é nessessario:

1 pendrive
NASM
FERGO RAW

Primeiramente transformar o arquivo asm em um arquivo BIN
nasm -f bin so.asm -o so.bin

segundo
fergo raw para criar um arquivo de imagem com exatos 512bytes

terceiro
gravar em um pendrive utilizando algum gravador, recomendo "Echer"

considerações:

o arquivo BIN deve ter exatos 512bytes para ser reconhecido como um bootloader na inicialização, devendo ainda terminar os bytes 0x55 e 0xAA
para ser reconhecido de fato.
