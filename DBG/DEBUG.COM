�N�'�>2�2l3�4�4�5�5�>�>�55789$9:D:�:a;�;�>�;=                                       
    TNTN                                         \   l                                     AXBXCXDXSPBPSIDIDSESSSCSIPdescfg&.6>de�󬭪�������lmno�����蚂���������               BD-:FreeDOS Debug v 0.98 help screen
Altering memory:
compare      C range address		hex add/sub  H value1 value2
dump         D [range]			move         M range address
enter        E address [list]		search       S range list
fill         F range list		expanded mem XA/XD/XM/XS (X? for help)

Assemble/Disassemble:
assemble     A [address]		unassemble   U [range]
80x86 mode   M x (0..6, ? for query)	set FPU mode MC 387, MNC none, MC2 287

Program execution:
go           G [=address] [breakpts]	quit         Q
proceed      P [=address] [count]	trace        T [=address] [count]
register     R register [value]		all regs     R
input        I port			output       O port byte

Disk access:
set name     N [[drive:][path]progname [arglist]]
load program L [address]
load         L address drive sector number
write prog.  W [address]
write        W address drive sector number
$Expanded memory (EMS) commands:
  Allocate	XA count
  Deallocate	XD handle
  Map memory	XM logical-page physical-page handle
  Show status	XS
$^ Error
$K_r����������Write protect error Unknown unit error Drive not ready Unknown command Data error (CRC) Seek error Unknown media type Sector not found Unknown error Write fault Read fault General failure  read  writ ing drive _ 8086/88 x86  without coprocessor  with coprocessor  with 287  (unused) [needs x86][needs math coprocessor][obsolete]Divide error.
$Unexpected single-step interrupt.
$Unexpected breakpoint interrupt.
$Program terminated normally.
$Program has terminated.
$EXE and HEX files cannot be written.
$Cannot write: no file name given.
$Writing $ bytes.
$Disk full.
$Error ____ opening file.
$File not found.
$Path not found.
$Access denied.
$Insufficient memory.
$EMMXXXX0EMS not installed
$EMS internal error
$Handle not found
$No free handles
$Total pages exceeded
$Free pages exceeded
$Parameter error
$Logical page out of range
$Physical page out of range
$		  &	  9	  K	b	x	�	�	EMS error __
$Handle created = ____
$Handle ____ deallocated
$Logical page __ mapped to physical page __
$Handle ____ has ____ pages allocated
$Physical page __ = Frame segment ____
$____ of a total ____ EMS $es have been allocated
$pag$handl$no�������ln��������@7��?���������D��o�5��C����  ��
���w����	�
?��������������1��~�O���I��6����������y���EԵ;�m._��-��J��K��K2��N��I���bc��a/��`���b��`���a|��d���d1��c���d~��b��`���a/��bc��a/��a���d~��c���d1��d���`���c���b���a���`H��cJ��cJ��c���b���a|��^���w�1���2;������<��}���.���#����������������<:�AE��AE����HA�BB��B��B��������������AE���A����A����A����A����A����A����A����A����A����A����A����A����A����A����A�����A�@����A���A����C/��C���K��A�@���B����AE��AE���A�������A�BB��B��B����"�W��� A�BB��B��B���������A���B��������������4�2�AE���A����ϡ��7�l���`���	A`��AE��AE��AE��AE��AE��AE��AE����n��
��{��A�BB��B��B�����O�AE��AE��AE���AE��AE��AE���>����AE����A����AE���AE��AE���0�eB������ͫ�B�����>������C1�r�����A�BB��B��B����R�����PA�BB��B��B��������AE���B���By���A���A����C/��C���B���By���A���.��AE��Aa�AE��AE��AE��AE��Id�����A�� N� O�����D�G �Q��X�� |��� ��=�=��=���Oh���P��>C�#��u��"��ts�"q�t&�#��uZ�"q�t&��Dn�#�t��&Z�x�%��wu�%s�w(�&�w��#��uZ�"q�t&�"��ts�#��u��"��ts�#X�u�&�w��%s�w(�%��wu�&Z�x�"$�s��%&�v��$��vA�#X�u�!��s��$��v��$��v��%&�v��$?�u��#�t��F�F!�նFo�/���M��;H���:���+��x�*p��<u��������D������3���4	�D"D!�C�C��C�C��C�C��C�C���M������0M0�(�)�*G*�57����V��W��W6�W��X�X��1T��1���W�����=��������+P���Z���������l���EaG���!���!c�Ņ�	�Q#�}�����-��/9�!�o� ��m�	?�}Z��������.��Ȑ����b����F�ͯ����_�����Cʬ����\
�������:�:��==��"�/���*˓������z�����v�N���&�.�6�>�d�e�*˓�����w����I�m��*����<��4V��4���z���yy��y,��z`��y,��y���}��|{��|.��|���z`��y,��yy��z���yy��z��|���|.��|{��}��x���{���{G��z��x���{���{���{���z���y���5����~��~�����M������v�J��L�K�3"��3o�����=�����+���2���'�'��������+�.���O���[p�����+�+��(R�(S�@��@�������x�t�� � �� �� �  � � � � � AAA AAD AAM AAS ADC ADD +AND 9ARPL =BOUND ABSF EBSR IBSWAP NBT UBTC ^BTR gBTS pCALL zCBW %CDQ }CLC �CLD �CLI �CLTS �CMC �CMOVA �CMOVAE �CMOVB �CMOVBE �CMOVC �CMOVE �CMOVG �CMOVGE �CMOVL �CMOVLE �CMOVNA �CMOVNAE �CMOVNB �CMOVNBE �CMOVNC �CMOVNE �CMOVNG �CMOVNGE �CMOVNL �CMOVNLE �CMOVNO �CMOVNP �CMOVNS �CMOVNZ �CMOVO �CMOVP �CMOVPE �CMOVPO �CMOVS CMOVZ CMP CMPSB CMPSD CMPSW CMPXCHG CMPXCHG8B !CPUID �CS &CWD yCWDE )DAA ,DAS /DB 1DD 3DEC 9DIV �DS <DW >ENTER �ES BF2XM1 FFABS JFADD UFADDP aFBLD dFBSTP gFCHS kFCLEX pFCMOVA uFCMOVAE zFCMOVB FCMOVBE �FCMOVE �FCMOVNA �FCMOVNAE �FCMOVNB �FCMOVNBE �FCMOVNE �FCMOVNU �FCMOVNZ �FCMOVU �FCMOVZ �FCOM �FCOMI �FCOMIP �FCOMP �FCOMPP �FCOS �FDECSTP �FDISI �FDIV �FDIVP FDIVR FDIVRP FENI $FFREE \FIADD (FICOM -FICOMP FIDIV FIDIVR 2FILD �FIMUL 9FINCSTP =FINIT BFIST GFISTP �FISUB FISUBR NFLD XFLD1 tFLDCW xFLDENV `FLDL2E \FLDL2T hFLDLG2 lFLDLN2 dFLDPI pFLDZ {FMUL �FMULP lFNCLEX �FNDISI  FNENI >FNINIT uFNLDCW �FNOP �FNSAVE �FNSETPM �FNSTCW �FNSTENV �FNSTSW �FPATAN �FPREM �FPREM1 �FPTAN �FRNDINT �FRSTOR �FS �FSAVE �FSCALE �FSETPM �FSIN �FSINCOS �FSQRT �FST �FSTCW �FSTENV �FSTP �FSTSW �FSUB �FSUBP FSUBR FSUBRP FTST FUCOM 'FUCOMI 0FUCOMIP 9FUCOMP BFUCOMPP GFWAIT JFXAM NFXCH UFXTRACT YFYL2X ]FYL2XP1 �GS aHLT dIDIV gIMUL yIN ~INC �INSB �INSD �INSW �INT �INTO �INVD �INVLPG �IRET �IRETD �JA �JAE �JB �JBE �JC �JCXZ �JE �JECXZ �JG �JGE �JL �JLE ZJMP �JNA �JNAE �JNB �JNBE �JNC �JNE JNG JNGE JNL JNLE JNO $JNP *JNS 0JNZ 6JO <JP BJPE HJPO NJS TJZ eLAHF hLAR lLDS ~LEA �LEAVE sLES vLFS �LGDT zLGS �LIDT �LLDT �LMSW �LOCK �LODSB �LODSD �LODSW �LOOP �LOOPE �LOOPNE �LOOPNZ �LOOPZ �LSL oLSS �LTR �MOV �MOVSB �MOVSD �MOVSW �MOVSX �MOVZX �MUL �NEG NOP NOT OR ORG OUT OUTSB !OUTSD "OUTSW &POP 8POPA 7POPAD =POPF <POPFD @PUSH ZPUSHA YPUSHAD _PUSHF ^PUSHFD bRCL jRCR �RDMSR �REP �REPE �REPNE �RET �RETF rROL zROR �RSM �SAHF �SAL �SAR �SBB �SCASB �SCASD �SCASW �SEG �SETA �SETAE �SETB �SETBE �SETC �SETE SETG SETGE SETL SETLE SETNA SETNAE SETNB  SETNBE $SETNC (SETNE ,SETNG 0SETNGE 4SETNL 8SETNLE <SETNO @SETNP DSETNS HSETNZ LSETO PSETP TSETPE XSETPO \SETS `SETZ dSGDT �SHL lSHLD �SHR sSHRD hSIDT zSLDT ~SMSW �SS �STC �STD �STI �STOSB �STOSD �STOSW �STR �SUB �TEST �VERR �VERW �WAIT �WBINVD �WRMSR �XADD �XCHG �XLAT �XLATB �XOR  
!#%')+-0247:>@BDFIKMQUY]`cegilnpsvy|���������������������������� N@ B@ R  BJ JB rz ZT ZR � RZ R"     B \ p"   0 0 0 � t    
 ~ ZR  VZ  ZRP VZP N" N, * "  $ R r r r NH HN l` \P Z&b Z&r "N ,N T 6 2 < 4 8 : &P &" B( B. B" p b RZ" RZ. ^\ \^ � � � � � � �������



77777777777777777777777777777777



�a�Yssssssssssssssss |�������/���������������������9�oqqq uuusii��--/sll��
 

������ ������� ������� � 55555555x1x1x xzzzzz  UUUUz zU<<<<<<<<@@RR@@@@< <<ULULPR JJJJJJJJ@@@@   J JJ N N@@@@RR >>>>>>>>CC  CCCC> >>U ULP PPRR  LLLLLLLLFF FFFFL LLN3N3    RR   ""������""""""""""""""""----------------������������������'����'��"'��'""��%%%%%%%%55****3�W            ��������      ��������& & & & & &  �





�U
U
U
U
U
U
 ������ �����������������3, 450 0����������	����C=H8    

?
?
uuuuu�u��?
?
?
?
?
?
?
m �f  
 �y�uuuu{���

�	�	"2��uuuuuuuuuuuuuuuu  ZZ��  �``����    M
HXhx����R[:$����f NNN����     �� ((y �	� �	 �	�0  � �& 
U
�  � �& 
U
�gm17�	�	  �gm17�	�	  �gm17��  �
  ����
��f f NN  �)�)'o'**    �)�)�&'�)  '�E6�,.=6�,.=�  ��Kwn��  ���]�em��v~vb�bb�b      �  ��  �  �b�b�b�b Le�b  6�,.=6    ,=.�  ��  [�U  �D5_5    ]�em��v~=   (4$E5�  ��E�L�        0Ue�b  ���
�  '�����4�����4���43  8@�&c'� �E'Ju7u7u7u7u7u70Z=XnaJa�`�`�aea�`�`�a\a~a�a�`�`�`�`�6�666�6�66	6�6�6�6�6C6=6H686n9N9�8�8�9f9�8�8�9^9|9�9�8�8�8�88�7�QO0�9�98�7sX`0�9�9�5�A�Ai7Z0�6 7�7�7�T0;0A0�7�78J8J�G@G@G@G@G@G@G@G@�O0`0Z0T0�Q�uTT/=zh5:1(Bd$�                         	
                                                                         !"#$%&'()*+,-./0123456789:;<=>?@ABCDE  FGHIJK LMNOPQRST  UVWXYZ[\     ]^_`abcde                                                fg          hijk l      m       n       o       pq  rs   t      uvwxy    z      {       "! #]�$_^0�[&N������ � � m � � � � o a � ` � � � ��s �0*��� (��	
        ! ���������1�0+*	 	   ( ) ��� � 0 1 ��Ȏ؎����5�&�&3�� ��<t�<;t�<?t ,a<w�����TO���������0����                       ������$&   C)H)J)    a ��.�.�.�.�.�.�.�.Q/Q/Q/Q/Q/Q/[/{/�/000-020_0q0{0�0�0�0�0�0�0�0�0�0�0�0�0�0
�����5�'<t���
���c�e�&3�TO�e�H&�:��c�?&� ��<t�<;t���& ��&  �TOV<ar<zw$ߪ�<t< t<	u���NV� ����7����ެ< u�9�rN9�t�|� u�VFFW�TO)χ��_^t
�< u���� ��9�u�^^�^����ؓ�� Í���<�r�,�t,�HtHt<sB�&�� �� ���&��&^X�<t�<;t��O����&< u�^X�<t<;t�8���&�TO��v �>�&  u�^,u�<t�e�������TO����&��&�㋇�&��&��<t=<"t<'t�J:�&!���&��\Pw�� �Ĭ<t8�t
���\Pv��)���<uþTO��)��>c��>c�s�����ëêÉ6�&^�<t<;u�'� �6�&^��TO<t<;u�W� 1��_N�%�߀} u\W��D� �_uP	�u	�D$�<Ruq���وM��&�$%��=FAu�D$�<Ru��E��&����$%��=PTu��������>�& u'W��D� �_uV���<:uX����D)ˊ��&�k�^W�mD� �_rj��]��s������D �5���w't��r3��& �+ �<(u$��,0<w�E�<)t����,0<w��E���u� :Et�E< u�����r6��M�]�U
�7��"<:u�*��M�M�]�U
� �� �<[u���<]t�NW�}D� ��_rG��s��� �} u��N<*uF�]���@��T �} u�]�	 �} u	�]��9 �%����<*tM]U
� �o�NW�}D1��_rӀ} u͈]�v<-t�<+u�c��c��}  u)�} t �= u��� ��Et@@��&�E�������E
E�u!�Eu�E8�w��W�'� �_uջ�k ��&�E
Eu�E�ĉE��} u�M��|�����u=��&�m���E<t�< u�<|�$���A�E< u���9 <|[$�<t8�t� Q�E���Y�e	8�u;E
u� 
]t�ǀ�@� �ɀ�}�MN�h�� <t<;t<,u��xOs�O��������V1���&� �6�&�,�r<tw��&�����&�����N���1һM ���&��&=� w<�r��&�Ĭ��&��&��&�6�&�֊�7����TO�< t=�=�t�<@r� �����&�&� ����<'�늇'�t�с|�VZtȁ� ����V��=�u���&�t�u�t�6�&�<�t�����&< t"<�u
��&t�� ��&$�=� w޿�
� �u���&t��&=� wſ�
�	 �u���&	�t��&�����Gu��>c��&t�����&< t��g��&t�H��&u��& t���&< t
�<dr��& ��&�Á�@s= r%��&$8�&�$�� ���$���&�㋇��� tP��X
�&���&��&t
���&tO���&	�t
�O� �w��&	�t
��&���w��&	�t�w�����>c�>�&s��&%u��& t��&��&����TO�����J�4 �E$����&�$ �E$��&� �>�&� �uC�>�&� �Eu6��&��&,|-t<���&�]�t	��&8�u:�&t��&< u����E<tr��&� �E< t<t	<u݀�& ��&��&�����'����}
  t��& ��E�>�&��&�>�&ð	�n�c@@��&u��& t@�1ɋE�U
)�ʈE���8�u9�u�E���/�cCCC�>�& rC�U
�E< t<
t<u�CCC��& � 	�ṵ�E�E1�)�ʉE�U�>�&�X�����]�> �E<w�u��&<u�}�u�� � �!� �E<s�{�<s��&�"�]����&��&:Et� �E,<s�����&ËE���� �E� 8�ue;E
u`��` �e�E�>�&À}	t���& ��: ��&t��&t2�&�&��<"t��&��& X�)��}� �}� ��k'�;EtX��À} t�8Et�X����u�t�E� ���&tH� �E$�	�&��&�>�&�<-tP,0<
XrP$�,A<X��<-t�A � 	�u6�u4ì�1 ��	ѹ t#�������  �ƀt<����u�ǀt���u�Àt�AAA�1�1���rì��r����u� �������������u��tB��tB��t	B��t�}��UË%��<Eu#P���d���W�}DQ� ��Y_Xu	F�Ӏ�� ���u)�K��r��FF�����,AVW�7_^󦟊T�&�u�VW�+_^�tIQ���TO����:��D���  �����  �����  �XP��:��G��S�_YA��<u�g�ց� s���� �� ������i�։ʡi�I�:���$�P�>�  �X�]2�G�  VW�4_^9�tP�  ��&�CX@������9�r��)�AVW�U_^�i�PQ��Y� �X< r<~v�.&�C���� t	�  ��F����6g�E�-V�"^��R��ZN9�sF�YO���GG�]2��B�g��CVW�_^���;�6<t*R�y���TO)�_��H�r�W��_�֎���>�v�Çډ��Y�:����Q�  �W���&��_�D�.�RS�m[�dO1ɀ>Z t5V�TN�6_;6ar�(�r�>Zu�<
uF�Z�����Z�6_^� ��!< t&<t"<t�� s���Zr�A�� �IN���!����)�Q�� Y���>��CZ�TO<t��t�с� � ��=��
��)��1ɋ���)�AQR��c����TO_�Á� tX1���	�t
�TOQ�YHu�����TO�� Y�TO�Ó���t�r��0�VO�u���<t������u�N�<t�r��ۉӰ̆�������	�VO�u�N�<t�t��G<�t�ۉӈ����>v�u<���6TON�^<t(�t�V��3��u���������9�u����������R�%���[����o�  ���)��d�������]������tP�%�  ���yt;�u�� t
���>y tΉމ׸ =�� �!s�6��B1�1��!�yunVS;6 ��ޝs6 � 1�������)���  r9�u9�s[^����1 [^����� B1�1��!� !������?� ����!9�u�������>�!�P�>�![�yt�� ��  ��1�� �����.� �>�����K�� ���!rv��+. =� r�� �9�=�6�&����6����6��6����Q�!��;�����P���!�"%�Z?�!�;�
 Z?� �����c��������������V<,t<tL <lt����^N���	Q���ډ�����9�u��$����8�Y�VW��_^�s�������^N�<tW<?tS<0r<6w	,0�W�Y� <ct<nuk� <cud����X ���&W��u<3t<2u���<u=�X�&Yþ�W< t�'0���+�>X t�@�Y:Wt�R���$��� <t�t:\t<ar<zw$ߪ����� ��>���� t8��� r0��}�.Hu�}�EXt"��}�.Eu�}�XEt��}�.Cu�}�OMt��yW�TON��<u��TO�\ �  ���l � ���TO_WG��<u�X�)�HH�ì<t�t�:[tN�)�!P�<t�t:\u�NX<uHì<t���
t�� �N�<ar<zw$ߪ�  �����1�������?
R�
�T
�
�Z����Q�6�� �� ��� �u!�E��t	���u�� �@t$?�� ���A <�t� � $�4�8uv<�s+��u<t <@r<�r� <t4�uF<@r<�rFFFF���̆�TO�������U�TO�������و1ҁ>v�u#;�u��H9�u����� �� ���9vu
�hY���&��y�������z����ظ %�!����ظ%�!����ظ%�!�O�
 ��� �� <u��N�%�߿�� ���TOu5�� ����G	<uS�����[<t���"	����� u�x �<FuQN�<t< t<	t<,u@�	<u���<t�N�%�߿�M� �u���Mw�E���!�� �E�	������N����1��h�QR��ZY)с�TOO)�r�W�_A��SW�C_�TO��u;��QW���V��6�^_u#R�����:��D����
��@� � �U��!Z��YA�X��Q�� ��>v�u��Y��Ëv�x���t�����<u�k�� s���� �  ������m�kAQR�UD �	[Y�k��)�)�9�s���tGP�&� �[[s9=uR�s�W�yA����!Zs"<v�������1�TO���������� ày�t�#� < u�J�� �TO���r�������V
�޴<1ɺ� �!r}P�n� ��= r1��F	�t�'@'����F����w�u [�V
� �)Ѐ~ u;Fr�F��@���!9�u1ҁ��)N��^ uОu�� ���5 �A�� �!�>�!�= ��t!= ��t= ��t= ��t	������	�!�<?t <at<dt1<mtK<st~�������%��,�{�ӴC�� ���	����	����l��[�E�� ��	
��
���� �N�����G�R�@���.XP�D� �)
���� X��
�g�� ���K� ��B v1ҴL�g���t�us�� ��u�� �M�TO�Y ������ Ku����"�� X�TO�? ��Q���
���~
��p
��Y�躐����B� ��)ػ�
�j �K� ��� ��
�[ ��g�� t5��<�����㋗�
	�u	��	����	��V�g5�!���
 � �^uú��d�Y
��пP
�R�I
��Zÿ�
W� ���
� Z�n����i���
�c��o�� � �0�u�E� ��É��VN]�� w	A� ��!���'�.��&5�x �>= t����?��P�&�X� ôJ1ۇU	�t�!ø L�!�$�P�;�!�$%�B�!�#%.�>�!�&7+&9�&. ���X[YZ]]^_.�&�.�6�.�6�.�6���.�v�.��.��  .�� .�= .�x�+ .�v�� .�v�� .�v��.��.��.��.��.�&��̎Լ�WVULLRQSP.�&7���#5�!�>�@�#%� �!�$5�!�B�D�$%� �!�P���!�ێÁ&���À>N u�F1��޾� �����PR�6@���ZX�Error in sequence of calls to hack.
$�N�>� �N �F1��ǿ� ����ø  ��:��TO��)щ]�] ��@� �!�r>�a)�t�<t<
t����h s�
��SOrNO�6_�Z���@� ���TN)��!� �
�RN�!��
�!�TN��À>Z u�ÿTN�6_;6ar� r�>Zu�<
uF�����PSQR���?1۹SO��)�t�!r
	�t��� ���aZY[X�V���^��1��
)�SRQ�V���QY���r
�9�׎�^��7�           ��� <tQ�$�<tGRS�� ��t�	������R��A��z��RSV�J9�s�B�����>xA u^[	�u�ZX[	��[�yA�G��OX�G�G1�I�� �� <t�N����" ��o <=u���� �p�r�oÀ>o t�p���r���o �x À>x t��	���/�Q�R V�o<,t <lt.^Y	�u� I�s���N���M <lt�ER�� ��Z9�w_� �R� ��Z�PI�rK�� Ê$�� ��su#W ��� �u/����狝�_F�� <:u� �p V�� <:t^N��X���� �[ ����TO<t�<'t<"t	�a �G� �Ĭ8�t<tڪ����8�t�� <u���X rĘ�1۬�N r���u�� ������������5 r������+ r���u��������� r��±�� r���u*�������P,0<	vXP ,a<w
DD��X���, <u������  <,uV� <u^�,Á� ì$�,A<v�N�< t�<	t��< t<	t
<,t<;t<=�CHpH�I�IJJ:J@JEJKJXJjJ�J}J�J�J�JKK%KEKQKkK�K�K�K�K1 3 DXCLSTCSDSESFSGSSS        !$          �KKEWE^EyE�E
	ALCLDLBLAHCHDHBHAXCXDXBXSPBPSIDIESCSSSDSFSGSSTMMCRDRTRBYWOWODWQWFLDOTBSHLONEFA����&.6>de���� 
RK�&SD�>D  �@D  �PD�OD���&  �<�u�@D@���BD� �ãCD=�r
���"� �����U� �㋟��Ήر��:�&r��&����� sX��YD����BD� �����ÀUD��&�<�r���,��à�&$��Ä@Du@D��t�>PDX�h��V�����%u�t���WD  ^��x�< th�VD �<@r:�VD <`s<Ps	���BDt�AD�&@D��� �Ā����p�Á� ���C� ����(r�� D��� uO� �� D�< t�,����AD��"@Du�� � ��%� �@��u� ��%� ���t &ADW�ߡCD�u׋5�����_���B�t-�CD�� u�W�	 ��
�_u� �W�lO�� �_�AD���t7$AD�CD�� u�$�W��
� �#t:AA�u��)�ADu*�0�$ ���t�W�CD�)&�. �u��ADt���AD_� V�0^W�(_���WD��  t�UD�u� t�ω�� �u��� ��)��W�TO�m���:��k�� ��>D�� ~ � �����TO�>D�� ����TO� ��  �lO)����_�UDt�\�}� uF�fW�ED��_���O)�Q�uY��d �UD4�u[�>PDwT��O�>OD |t- HH�K�h�:��QD�%�=��PD�������D��QD&�&�W�>OD |t������� ����UD�t�u�CD= t
=� t=� u�UD ��À� |!��UDt���� ��tP��X������<�r����AD�@Dt��:���&$ǀAD �@D t� �UD�QD  <��[�t~�� ��eD��u��t)�BP���@Du�PD� �BX���QD���t�+��SI����t�D��QD���&�t/��&�u���QD< �+}�-�؈%G��� �+���QD���]��<u	�[��6� P$<u���&X��u�@t�< }���-G�� ���&$<u[��&$<u��&�u��� �[EGG���]���&������$<tA�[EGG���&�&���t�*��2�Āt	�4��@t�8��]���[EGG��]���0<�s����#<�r�� �L��@D u@��&�g���$�VDUD�� |t�EG������mD�àBD���� ����Q �" �FL��O��AT� �DO��UB��LE���, �T���<�s��&UD������t���� �FA��R ��&UD��<�s�����kP�t�bP�^�U�:��tX�IX�E��4��( �@�t P��� Z�/�k>D�  ���k>D�
X��&$<t������&$��ST��(��0)ثûCR�� <wu��&�>CDu&<u"�p �� �DR���� �� <r]<s��&�TR���0��� <sC<t�&UD�<r��&���r< ��+}�۰-��� �_�p�t
��~��UDX�
��&SD�>D  �@D  �OD���&  �&UD��&��D�
 �t�>D���q ���UD�	 )���� r
���D� ����� ����� ���$��AD�u�AD��� ��&��&ÿlO��� ���tOr�àPD�������D�È&OD�>WD�� }
�BY��TE� t�D��WO��RD�� P��TR�� ��� P� �X�{Ø���P��}D�X�þf��&t�D	7�Y�>X u�W:�&r�q� ��D	6�W:�&s��&0�D� þ��E�� �u��&)�1ɠY:~�
 �V�6k.6>D�^�>D�V�6k.6>D�^�>D ��6k��� Ku��6kÁ>WD  tWD��ω���lOW�NO�_�ÀAD�@Dþ����TO� �0 S�� [�TO��# � ��2 � ���k�����UD�;����kËCC��=��Q�] Y�  ���Ë���M� �D�t�D �� �FF���   � @    NVUPDIPLNZNAPONCOVDNEINGZRACPECY���< u��P��� XP���� X$�'@'��P)�w� �TOY)�� ��O�= t�G�
��@� ���TO)��!�� �P��SO0SR�U�6 ��!�P���!Z[�l���ZZ�? �?�?�&"DEBUG version 0.98.  Debugger.

Usage:	DEBUG [[drive:][path]progname [arglist]]

  progname	(executable) file to debug or examine
  arglist	parameters given to program

For a list of debugging commands, run DEBUG and type ? at the prompt.
$Invalid switch - x
$�������� D1��!r�⁀��u�Z � 0�!��=r�xA�X��%�P��X% �= �u� �� �Q��X� ��Wtn�W�����f�fXf��f5   fPf�f�fXf9�tD�Wf��f5    fPf�f�fXf9�t*fQf���f1��f=   |f1�f@���$<v��W� fQf��ܠW�Y���zNZZ�>zN�zN< u5�>zN�zN%?=? u&�X�>Wu�����������ٛ�>zN�zN�u�Y� 7�!�[��/u�\�� �< t�<	t�8�t!</u0�<?u*�D< t<	t<u��N��� �<?t�O��O���L�!N��� �z� 5�!�z�|�5�!�~���5�!����� �|N���%��!���
 �O���D��&�L�� ��L��kR%��PHH�3@@���U��ؿ������;���� � )�= v1����HH�����X���1���