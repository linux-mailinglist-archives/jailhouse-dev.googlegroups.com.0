Return-Path: <jailhouse-dev+bncBC56TFN47MCRBWFN6SMQMGQEP3YUT6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A7F5F4F7B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Oct 2022 07:32:10 +0200 (CEST)
Received: by mail-qk1-x739.google.com with SMTP id j13-20020a05620a288d00b006be7b2a758fsf13357437qkp.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Oct 2022 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date;
        bh=D3TWkmi48NXCR081DxZoe2jQ9+SRj/2BDYmqEb39quA=;
        b=Pf/5GCXzrCZQiO420kS8VkiKlUfY9PH+62fdISdVuNrovjLVFmZHbBnBDcsfLpKEJP
         EIFJPd1z4qTaIcfyA0wjPVtIyWRi/CdhtcrOMGszqV9MzNEcLpBprMPLls+H1x3VL5T6
         OB75xjoem5YBqnDlfk3U/9CXkJI0l/YG53cBsOh8RskE6BXX3Aq3xXXV2wN8ARLTVrF/
         I0rjxHZiVbmAv/TkEPYNphzvmiMavJ7rOwxrfIIZsoMAWht/mbJaWLv6VUma09k//Mbj
         XbMnXTCcxeMuKNxPPAMqzSrfts1OKyZgde4fCQlvlJ/yGHeVqLT5TKtcsY2S8mnq8wV/
         ltXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date;
        bh=D3TWkmi48NXCR081DxZoe2jQ9+SRj/2BDYmqEb39quA=;
        b=na4OsKsCrxrrU7U8Yu7g3NcenhbJe4sLYQsFX4Qq57Qmxmu+AICUPN4peRPLuXjtlk
         d2P7CjrBg6QhIZRZIZb/bkHaud6HhMbCJAiSt1ieZqIMx5d6yKX1jgR4PihXYno2MdOc
         gq8Pw6DZAeVQ+5nt02sGEBAT6wst77RNJs2rGBS2VX/qRW0LT1qoGnfPcjoSOW0b4NMl
         mlQkuG3cIXiZogd+VzgxyOMj1VzXexHpnd1je5ncwteMG1ptKhMocy3Qx/4f7a56SXqX
         4pT1JAUjvSdSOi+Pc3YmkKmayLYsjOqe+k3KmtbT848a3gzQpH8t2udHoiQB+Q67WOxf
         Sl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=D3TWkmi48NXCR081DxZoe2jQ9+SRj/2BDYmqEb39quA=;
        b=n8k8Ra28QqwmKUG34qn1IGpOp0TzE8a6DFS4JSjTQlhqQFxHArK3AyHOqZzJbXZ70v
         CKj+YyTqIKf3IeaS5SDkJlWmb7jMffFOuhO86GjNIw/15sNmK4U9yRIzRsxNNEZF1AoN
         LcWW7PIbMGwOKbLUiq0sX416pDqlDBfl3cyV4Ca7mycmExvlNEj8QSX5YYzwTOWVBe5m
         8WzADxmkyldASvPcA/FjoDA82p/shT+QPx9k4lEqV6pT9cBvcr3u7z2HlzZf/Sf1IwiS
         /XrLNqtxN7d/mryV7VNNJUD2JNJbZ/Ry7R3okIuiabjnynATYunBxu3CFG/vo9hVJ4Sd
         Xltw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2xTJkPbBqQw7W8j7WuV+oSRmIVyaSu60pJPbvZvRtPdc+Jbfqe
	UxWdAyRcj4uwtwoULak8/V4=
X-Google-Smtp-Source: AMsMyM6PozYEc72jSghJUMKIirP3ev5R/u9FiO7/rJ2ZAXvmgYouqXiWI234/PVSv9ouAn28r58HSQ==
X-Received: by 2002:a0c:e552:0:b0:4b1:86f0:89d5 with SMTP id n18-20020a0ce552000000b004b186f089d5mr11234955qvm.97.1664947929246;
        Tue, 04 Oct 2022 22:32:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:ab88:0:b0:4af:9d10:e2a6 with SMTP id j8-20020a0cab88000000b004af9d10e2a6ls7710516qvb.3.-pod-prod-gmail;
 Tue, 04 Oct 2022 22:32:08 -0700 (PDT)
X-Received: by 2002:a05:6214:e4c:b0:4ac:f069:da4 with SMTP id o12-20020a0562140e4c00b004acf0690da4mr22413671qvc.80.1664947928055;
        Tue, 04 Oct 2022 22:32:08 -0700 (PDT)
Date: Tue, 4 Oct 2022 22:32:07 -0700 (PDT)
From: Yi Zhang <zhangyi.hust@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dae2bca3-ec45-401a-be76-61ad2e83130an@googlegroups.com>
Subject: create_vpic_of_overlay() fails when of_property_read_u32(root,
 "#address-cells")
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7422_124367082.1664947927280"
X-Original-Sender: zhangyi.hust@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_7422_124367082.1664947927280
Content-Type: multipart/alternative; 
	boundary="----=_Part_7423_969602614.1664947927280"

------=_Part_7423_969602614.1664947927280
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

I am trying to use jailhouse-master on Ultra96 board, but met the problem=
=20
as the title shows it:

My environment is as follows:

1. *The kernel is 5.15_LTS* with the patches picked from=20
jailhouse-enabling/5.15, exporting __hyp_stub_vectors,=20
__get_vm_area_caller..;
2. the command line is "earlycon console=3DttyPS0,115200 clk_ignore_unused=
=20
*mem=3D1536M* root=3D/dev/mmcblk0p2 rw rootwait cma=3D512M rfkill.default_s=
tate=3D0"
and the board has 2GB RAM;
*# cat /proc/iomem:*































































*00000000-3ecfffff : System RAM  00210000-0157ffff : Kernel code =20
01580000-0179ffff : reserved  017a0000-0193ffff : Kernel data =20
1ec00000-3ebfffff : reserved3ed00000-3ee47fff : reserved3ee48000-5fffffff :=
=20
System RAM  5e100000-5fbfffff : reserved  5fc60000-5fc60fff : reserved =20
5fc61000-5fca8fff : reserved  5fcab000-5fcadfff : reserved =20
5fcae000-5fcbefff : reserved  5fcbf000-5fffffff : reserveda0030000-a003ffff=
=20
: a0030000.gpio gpio@a0030000a0040000-a004ffff : a0040000.gpio=20
gpio@a0040000a0050000-a005ffff : a0050000.gpio=20
gpio@a0050000a0061000-a006ffff : seriala0071000-a007ffff :=20
serialfd0b0000-fd0bffff : fd0b0000.perf-monitor=20
perf-monitor@fd0b0000fd3d0000-fd3d0fff : fd400000.phy sioufd400000-fd43ffff=
=20
: fd400000.phy serdesfd490000-fd49ffff : fd490000.perf-monitor=20
perf-monitor@fd490000fd4a0000-fd4a0fff : fd4a0000.display=20
dpfd4aa000-fd4aafff : fd4a0000.display blendfd4ab000-fd4abfff :=20
fd4a0000.display av_buffd4c0000-fd4c0fff : fd4c0000.dma-controller=20
dma-controller@fd4c0000fd4d0000-fd4d0fff : fd4d0000.watchdog=20
watchdog@fd4d0000fd500000-fd500fff : fd500000.dma-controller=20
dma-controller@fd500000fd510000-fd510fff : fd510000.dma-controller=20
dma-controller@fd510000fd520000-fd520fff : fd520000.dma-controller=20
dma-controller@fd520000fd530000-fd530fff : fd530000.dma-controller=20
dma-controller@fd530000fd540000-fd540fff : fd540000.dma-controller=20
dma-controller@fd540000fd550000-fd550fff : fd550000.dma-controller=20
dma-controller@fd550000fd560000-fd560fff : fd560000.dma-controller=20
dma-controller@fd560000fd570000-fd570fff : fd570000.dma-controller=20
dma-controller@fd570000fd6e9000-fd6edfff : fd6e9000.pmu=20
pmu@9000fe20c100-fe23ffff : fe200000.usb usb@fe200000fe300000-fe307fff :=20
usb@fe300000  fe300000-fe307fff : xhci-hcd.1.auto=20
usb@fe300000fe30c100-fe33ffff : fe300000.usb usb@fe300000ff000000-ff000fff=
=20
: xuartpsff010000-ff010fff : xuartpsff030000-ff030fff : ff030000.i2c=20
i2c@ff030000ff040000-ff040fff : ff040000.spi spi@ff040000ff050000-ff050fff=
=20
: ff050000.spi spi@ff050000ff0a0000-ff0a0fff : ff0a0000.gpio=20
gpio@ff0a0000ff150000-ff150fff : ff150000.watchdog=20
watchdog@ff150000ff160000-ff160fff : ff160000.mmc=20
mmc@ff160000ff170000-ff170fff : ff170000.mmc mmc@ff170000ff960000-ff960fff=
=20
: ff960000.memory-controller memory-controller@ff960000ff9d0000-ff9d00ff :=
=20
ff9d0000.usb0 usb0@ff9d0000ff9e0000-ff9e00ff : ff9e0000.usb1=20
usb1@ff9e0000ffa00000-ffa0ffff : ffa00000.perf-monitor=20
perf-monitor@ffa00000ffa10000-ffa1ffff : ffa10000.perf-monitor=20
perf-monitor@ffa10000ffa50000-ffa507ff : ffa50000.ams=20
ams-baseffa60000-ffa600ff : ffa60000.rtc rtc@ffa60000ffa80000-ffa80fff :=20
ffa80000.dma-controller dma-controller@ffa80000ffa90000-ffa90fff :=20
ffa90000.dma-controller dma-controller@ffa90000ffaa0000-ffaa0fff :=20
ffaa0000.dma-controller dma-controller@ffaa0000ffab0000-ffab0fff :=20
ffab0000.dma-controller dma-controller@ffab0000ffac0000-ffac0fff :=20
ffac0000.dma-controller dma-controller@ffac0000ffad0000-ffad0fff :=20
ffad0000.dma-controller dma-controller@ffad0000ffae0000-ffae0fff :=20
ffae0000.dma-controller dma-controller@ffae0000ffaf0000-ffaf0fff :=20
ffaf0000.dma-controller dma-controller@ffaf0000*
---
The issue:

*Everything seems OK until I tried to:*
*# jailhouse enable ultra96.cell;*
it fails with *"jailhouse: failed to add virtual host controller*";

I did some debug=EF=BC=9A
1. it fails in* of_property_read_u32(root, =E2=80=9C=E2=80=9D#address-cells=
=E2=80=9D...) *when=20
create_vpic_of_overlay(); though the previouse "of_find_node_by_path("/")"=
=20
successes.=20
I checked the address of this "root", it is expected;=20
even if I tried of_property_read_u32(of_root, "#address-cells"...), it=20
still fails;
2. I tried to dump the properity's name with the following kernel patch:












*diff --git a/drivers/of/base.c b/drivers/of/base.cindex=20
54719f8156ed..6dc7eb50bb11 100644--- a/drivers/of/base.c+++=20
b/drivers/of/base.c@@ -198,6 +198,8 @@ static struct property=20
*__of_find_property(const struct device_node *np,                return=20
NULL;        for (pp =3D np->properties; pp; pp =3D pp->next) {+           =
   =20
if ((np =3D=3D of_root) && (strcmp(name, "#address-cells") =3D=3D 0))+     =
       =20
          pr_info("root node: name =3D %s\n", pp->name);                if=
=20
(of_prop_cmp(pp->name, name) =3D=3D 0) {                        if (lenp)  =
   =20
                          *lenp =3D pp->length;*

before executing "*on_each_cpu(enter_hypervisor, header, 0)*", it is OK;

* OF: root node: name =3D compatible OF: root node: name =3D #address-cells=
*
but with "on_each_cpu(entery_hypervisor, header, 0)", the log is as=20
following:


* OF: root node: name =3D  OF: root node: name =3D *
* OF: root node: name =3D name*
Seems the propery name is =E2=80=9Chidden=E2=80=9D by something(?)

Could you please give me some advice on this=EF=BC=9Fwhat should I check ne=
xt?
Thank you very much


*---*
Yi Zhang

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dae2bca3-ec45-401a-be76-61ad2e83130an%40googlegroups.com.

------=_Part_7423_969602614.1664947927280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:<div><br></div><div>I am trying to use jailhouse-master on Ultra96 board=
, but met the problem as the title shows it:</div><div><br></div><div>My en=
vironment is as follows:</div><div><br></div><div>1. <b>The kernel is 5.15_=
LTS</b> with the patches picked from jailhouse-enabling/5.15, exporting __h=
yp_stub_vectors, __get_vm_area_caller..;</div><div>2. the command line is "=
earlycon console=3DttyPS0,115200 clk_ignore_unused <b>mem=3D1536M</b> root=
=3D/dev/mmcblk0p2 rw rootwait cma=3D512M rfkill.default_state=3D0"</div><di=
v>and the board has 2GB RAM;</div><div><i># cat /proc/iomem:</i></div><div>=
<i>00000000-3ecfffff : System RAM<br>&nbsp; 00210000-0157ffff : Kernel code=
<br>&nbsp; 01580000-0179ffff : reserved<br>&nbsp; 017a0000-0193ffff : Kerne=
l data<br>&nbsp; 1ec00000-3ebfffff : reserved<br>3ed00000-3ee47fff : reserv=
ed<br>3ee48000-5fffffff : System RAM<br>&nbsp; 5e100000-5fbfffff : reserved=
<br>&nbsp; 5fc60000-5fc60fff : reserved<br>&nbsp; 5fc61000-5fca8fff : reser=
ved<br>&nbsp; 5fcab000-5fcadfff : reserved<br>&nbsp; 5fcae000-5fcbefff : re=
served<br>&nbsp; 5fcbf000-5fffffff : reserved<br>a0030000-a003ffff : a00300=
00.gpio gpio@a0030000<br>a0040000-a004ffff : a0040000.gpio gpio@a0040000<br=
>a0050000-a005ffff : a0050000.gpio gpio@a0050000<br>a0061000-a006ffff : ser=
ial<br>a0071000-a007ffff : serial<br>fd0b0000-fd0bffff : fd0b0000.perf-moni=
tor perf-monitor@fd0b0000<br>fd3d0000-fd3d0fff : fd400000.phy siou<br>fd400=
000-fd43ffff : fd400000.phy serdes<br>fd490000-fd49ffff : fd490000.perf-mon=
itor perf-monitor@fd490000<br>fd4a0000-fd4a0fff : fd4a0000.display dp<br>fd=
4aa000-fd4aafff : fd4a0000.display blend<br>fd4ab000-fd4abfff : fd4a0000.di=
splay av_buf<br>fd4c0000-fd4c0fff : fd4c0000.dma-controller dma-controller@=
fd4c0000<br>fd4d0000-fd4d0fff : fd4d0000.watchdog watchdog@fd4d0000<br>fd50=
0000-fd500fff : fd500000.dma-controller dma-controller@fd500000<br>fd510000=
-fd510fff : fd510000.dma-controller dma-controller@fd510000<br>fd520000-fd5=
20fff : fd520000.dma-controller dma-controller@fd520000<br>fd530000-fd530ff=
f : fd530000.dma-controller dma-controller@fd530000<br>fd540000-fd540fff : =
fd540000.dma-controller dma-controller@fd540000<br>fd550000-fd550fff : fd55=
0000.dma-controller dma-controller@fd550000<br>fd560000-fd560fff : fd560000=
.dma-controller dma-controller@fd560000<br>fd570000-fd570fff : fd570000.dma=
-controller dma-controller@fd570000<br>fd6e9000-fd6edfff : fd6e9000.pmu pmu=
@9000<br>fe20c100-fe23ffff : fe200000.usb usb@fe200000<br>fe300000-fe307fff=
 : usb@fe300000<br>&nbsp; fe300000-fe307fff : xhci-hcd.1.auto usb@fe300000<=
br>fe30c100-fe33ffff : fe300000.usb usb@fe300000<br>ff000000-ff000fff : xua=
rtps<br>ff010000-ff010fff : xuartps<br>ff030000-ff030fff : ff030000.i2c i2c=
@ff030000<br>ff040000-ff040fff : ff040000.spi spi@ff040000<br>ff050000-ff05=
0fff : ff050000.spi spi@ff050000<br>ff0a0000-ff0a0fff : ff0a0000.gpio gpio@=
ff0a0000<br>ff150000-ff150fff : ff150000.watchdog watchdog@ff150000<br>ff16=
0000-ff160fff : ff160000.mmc mmc@ff160000<br>ff170000-ff170fff : ff170000.m=
mc mmc@ff170000<br>ff960000-ff960fff : ff960000.memory-controller memory-co=
ntroller@ff960000<br>ff9d0000-ff9d00ff : ff9d0000.usb0 usb0@ff9d0000<br>ff9=
e0000-ff9e00ff : ff9e0000.usb1 usb1@ff9e0000<br>ffa00000-ffa0ffff : ffa0000=
0.perf-monitor perf-monitor@ffa00000<br>ffa10000-ffa1ffff : ffa10000.perf-m=
onitor perf-monitor@ffa10000<br>ffa50000-ffa507ff : ffa50000.ams ams-base<b=
r>ffa60000-ffa600ff : ffa60000.rtc rtc@ffa60000<br>ffa80000-ffa80fff : ffa8=
0000.dma-controller dma-controller@ffa80000<br>ffa90000-ffa90fff : ffa90000=
.dma-controller dma-controller@ffa90000<br>ffaa0000-ffaa0fff : ffaa0000.dma=
-controller dma-controller@ffaa0000<br>ffab0000-ffab0fff : ffab0000.dma-con=
troller dma-controller@ffab0000<br>ffac0000-ffac0fff : ffac0000.dma-control=
ler dma-controller@ffac0000<br>ffad0000-ffad0fff : ffad0000.dma-controller =
dma-controller@ffad0000<br>ffae0000-ffae0fff : ffae0000.dma-controller dma-=
controller@ffae0000<br>ffaf0000-ffaf0fff : ffaf0000.dma-controller dma-cont=
roller@ffaf0000</i><br></div><div>---</div><div>The issue:</div><div><br></=
div><div><b>Everything seems OK until I tried to:</b></div><div><b># jailho=
use enable ultra96.cell;</b></div><div>it fails with <b>"jailhouse: failed =
to add virtual host controller</b>";</div><div><br></div><div>I did some de=
bug=EF=BC=9A</div><div>1. it fails in<b> of_property_read_u32(root, =E2=80=
=9C=E2=80=9D#address-cells=E2=80=9D...) </b>when create_vpic_of_overlay(); =
though the previouse "of_find_node_by_path("/")" successes.&nbsp;</div><div=
>I checked the address of this "root", it is expected;&nbsp;</div><div>even=
 if I tried of_property_read_u32(of_root, "#address-cells"...), it still fa=
ils;</div><div>2. I tried to dump the properity's name with the following k=
ernel patch:</div><div><i>diff --git a/drivers/of/base.c b/drivers/of/base.=
c<br>index 54719f8156ed..6dc7eb50bb11 100644<br>--- a/drivers/of/base.c<br>=
+++ b/drivers/of/base.c<br>@@ -198,6 +198,8 @@ static struct property *__of=
_find_property(const struct device_node *np,<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; return NULL;<br><br>&nbsp; &nbsp; &nbsp; &nbsp=
; for (pp =3D np-&gt;properties; pp; pp =3D pp-&gt;next) {<br>+ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ((np =3D=3D of_root) &amp;&amp; (s=
trcmp(name, "#address-cells") =3D=3D 0))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr_info("root node: name =
=3D %s\n", pp-&gt;name);<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; if (of_prop_cmp(pp-&gt;name, name) =3D=3D 0) {<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (len=
p)<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *lenp =3D pp-&gt;length;</i><br>=
</div><div><br></div><div>before executing "<b>on_each_cpu(enter_hypervisor=
, header, 0)</b>", it is OK;</div><div><i>&nbsp;<b>OF: root node: name =3D =
compatible<br>&nbsp;OF: root node: name =3D #address-cells</b></i><br></div=
><div>but with "on_each_cpu(entery_hypervisor, header, 0)", the log is as f=
ollowing:</div><div><b><i>&nbsp;OF: root node: name =3D&nbsp;<br>&nbsp;OF: =
root node: name =3D&nbsp;</i><br></b></div><div><i><b>&nbsp;OF: root node: =
name =3D name</b></i></div><div>Seems the propery name is =E2=80=9Chidden=
=E2=80=9D by something(?)</div><div><i><br></i></div><div>Could you please =
give me some advice on this=EF=BC=9Fwhat should I check next?</div><div>Tha=
nk you very much<br><i><br></i></div><div><i><br></i></div><div><i>---</i><=
/div><div>Yi Zhang</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/dae2bca3-ec45-401a-be76-61ad2e83130an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/dae2bca3-ec45-401a-be76-61ad2e83130an%40googlegroups.co=
m</a>.<br />

------=_Part_7423_969602614.1664947927280--

------=_Part_7422_124367082.1664947927280--
