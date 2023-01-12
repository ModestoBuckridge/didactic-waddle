#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��ָcmain.sh �X[s��~ǯ8�9�T %Q��ä�D�ӒF�c��À���	 ��%θn�ȉe��:u�q�\<�T�4i�Q��T�����ŅHJM�P�4 v�9{���\��Ǆ��
f�a�C�D��b
�XxkJ��[��"Y ��(S�,ݜ��l��9^�*B�1:������,T���3��p������(sz6�Lg�2g����$�M��;ZNT�F��L� D\"�4`�b##�F�+�56T��w�T�iE����#���u��aբ뙲�2���s�������\"e|QE��i�A"�����L%���lj*�Lg�"����'60��7H,ﮥ�Y� �.W 6�MS���/����#I�β��5�<`�z�s����ꆌێ7����k�ծ�㵦+O����d����wG�j��#�#�h2ê�ق��k�t땲E*���=\83�`�$���$�:�V-4.��<ﱵ6r⊩�,pȜ�o����jQ�� ����෤D�7w3Ѯ�b�
4ޞp�%���pZĹ<X pm<ٴN��>H%"���UP�U׌2�[�-��.�"VW����bV+$��50q��),������WQ4l�)Q�Vn1_��@�+�Y�ɓ|�.�6���9f��� {��A��ןo|Ǡ��׃u�(@^���&�+Ȕ6�g�/̥�f��ٹ�	���f�oO�:WV���
7��z �t���<:��م,M�ѐ݇�匷*,���ad� �h�Xe5�L�XUC��Ŏt��M��[w���E�E�h:���H`��,8�U�|�7BB.fJ��Nvy�����Y�u�pʒ\��{O�(�#S@D�1��=�u/�0IK��|EC*�57~
Ej6�I�?�
�J~4��$����1�fth3\^k��n�ԛf��[;� �AU�3�鳞��>�F�{��2r��
8)�q������992�x��'m�̴Ñ��8=' P^S��F�n3TsU���Vp7�N���x͜[���.&�3�v7��8��N��$����D���M�T1�ܯqF���i��V#�I8T,�qW^�Nv� pE�B֚��慚3�jȔA�ժ�O`���0.�p�3og��<�A�� ���7�� ���c.y�5�����$�S(C%�`�j��c��}ω����!���U�:�ޝJ�oG9V5����ۘ��E��K:m5yA�Ԃ\�bE+Wp��Q����k�����6׊l��>��Y~�!xSȓ��V�o0>ݜ�����}k�~�7{�����?����ק������֣o�y�ݎ�-��ʾmhu�5��Ӯʊ"
�|.�x�u�20�c� ��`e,>S� �$wV��ёq~dΞɜK��ޣL�c��� �C�a���_N����!{Z�3�x���1l?e,Ͳ.�f�+zrJ�}O�8�B̉E�r��liB[�d��M)�h�*Dj�Q-&����9��)Q�b--c�`O���8M'Q6��ȷ�^k��c{�"?�@��ũ���}{�}V� w����U0����',�|}cc���փ;�O>�������wn��ʾ�y�u������b�^��eo=i�����y�0��G�G�?}F���5��*�6�:�N���3H.6yZ��>��7��Z<>�����dN��<>ؽgollm�P�N�4���n�U:x���� U���"^8i�\�� `�7m'fl.�H�Ȁ���-1�K�[[b'a�^bO�G�t�{lx�b>�
�����3qUPoL������gb� �Mw��{`5t��X�A
���vU�7XwʹYb��O�]���1�:İwÚ��^������{��;_�ĥ���'E�I��b윖o`o���?���[O�Y6�*iy��}�)W���3�������������
E�o|�t��Ƙj}�l�������������C�x��[��@juHh?����c{���7�k;h`����ͻ��}���ֿ^�q���s��F�����{���8s����O~ߺ���3���K�^�5��9�$�_5��r��7bX�cחv&���M]����9[.�Q��5(S�hk� �Bi'�O5�bŜBL&�Ct>`r��w���v5X�ܗ�~_j�|�`�2�6n���B��p��*�o�����zMdB�]���,w5u�L�������.�U�Iv�F�9|���� ��n|  