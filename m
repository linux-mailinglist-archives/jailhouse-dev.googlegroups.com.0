Return-Path: <jailhouse-dev+bncBDSMF24UTUGRB55OYT4AKGQENOLOECA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc38.google.com (mail-oo1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id DD644223188
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jul 2020 05:14:01 +0200 (CEST)
Received: by mail-oo1-xc38.google.com with SMTP id d143sf3833284oob.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jul 2020 20:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tgBXP8veFC4JwEPU86Suu3W5AcxGMfI2xffKHhPSWn4=;
        b=STQsqU522pY7LkbRqhEdcLDhGH8SqUxlEFwYDAYqisF5zVcZTv0l1BK2NPJDE34s1F
         uklRaB/ohVJ2C2WFbT2wDGtO/rca7PIYMGsF04Yq39gxfK47lIEw3ExFomaxZ458yzBq
         S+vjv/LoDVGbWigodGrF3aGKzdXj28jpk+OBswh4ZnzVWTfyZ+sXfMdSrvQYIAOZMDig
         MDQJ++d1BXI/5TcP0gl50FiSIlJVQ0A+K3vQFukcG0StpxxXrKSKXwYiWlzPjaBX3aIO
         YGLGhszl2B7wSjkp8YeGUxTwr/oVxzWbgNauYzsiQSIeVUfkpCePSWOwLx+dWZQ4Dyba
         L8IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tgBXP8veFC4JwEPU86Suu3W5AcxGMfI2xffKHhPSWn4=;
        b=GM7RNTEo+ONRHh/5peRJCAQ+8P9lQFCVCh3yrijDuWpd8ztJy/kvAHckutrr0Ck5Md
         WOL65oENBXvna6XsL1wMciRu2EkyJc4YPcAVCxD0PmIwDz7kKO+gNtx0dGYfVe2e00BR
         51ebLd4N6nzdns2KGKoV9TcPBT0FOkk/tc9cnvMmmZNebGvvzc6X9E1I2BD1rQurBs4W
         LZM+HU4CYx5hCl+YQTq/zXZiYfAPPe7MglySqBy/awTHH9Oaufkaf7jyX79sGpDc1nAd
         cy1lOnyKRnuAzPCAFICVCqvHDfh1bVaquwwMEYo8FVB3zNs2pN47u3AzWvkKUdGGenFj
         LEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tgBXP8veFC4JwEPU86Suu3W5AcxGMfI2xffKHhPSWn4=;
        b=oWuxt36E8XnF4UowULcflpd4xZD0q0DKG5Nezc3abkRfHNi9TaIXvLczxEFwPzCD1P
         q1AoOvmxqULeFh9hCHFQDjps4X6MlkGshVceW4J24LHLXGIH+3YtAlDoN0H0UAe8tHMO
         O2va+rZIvW/yP7zdgKICP22W1nx90RkVbwexYaeTSfST2PU0mOvmxJFQyYzo+GYjSY2S
         VQujDMyZpi7k3bM8OhzVqKik5ZMSEjiBqFgZexJjATBoHUjeU13DB3aoBx4ESgcryxeJ
         mH6TVizCj/u1GipyRowhqa+4oj1c1KUd3y0jyN8kDvLidz0FH2ql886jJ37jSg1fPi78
         Ws/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531l1apnfk9UwK5i9YD8Fg2Ti+glJGLJdASvlZ1t0eC/nDfg8B7r
	iZ5dENvAZvtfYFil9watbBw=
X-Google-Smtp-Source: ABdhPJyo1lFEtuCZ3FbQGP+aDbBYaOFAv6p5NL5dsH/R2mftzcMZ86Jm0dC931rNdT4JsZhQlf3H5A==
X-Received: by 2002:a05:6830:1ad7:: with SMTP id r23mr6710904otc.96.1594955640140;
        Thu, 16 Jul 2020 20:14:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:544a:: with SMTP id i71ls1093689oib.9.gmail; Thu, 16 Jul
 2020 20:13:59 -0700 (PDT)
X-Received: by 2002:aca:50d5:: with SMTP id e204mr6319848oib.60.1594955639241;
        Thu, 16 Jul 2020 20:13:59 -0700 (PDT)
Date: Thu, 16 Jul 2020 20:13:58 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
Subject: error: implicit declaration of function 'cpu_down'
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2593_1562624976.1594955638729"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_2593_1562624976.1594955638729
Content-Type: multipart/alternative; 
	boundary="----=_Part_2594_131681807.1594955638729"

------=_Part_2594_131681807.1594955638729
Content-Type: text/plain; charset="UTF-8"

I am using  yocto to build jailhouse module in agl   for rpi4 .
This is the error Im getting, please help figure out

NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile
Summary: There were 2 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
parth@Debian-95-stretch-64-minimal:~/meta-yocto-jailhouse-rpi4$ 
x/9.3.0/include 
-I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-
source/arch/arm64/include -I./arch/arm64/include/generated 
-I/home/parth/AGL/build-agl-jailhouse
-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include -I./include 
-I/home/parth/AGL/build-ag
l-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/arch/arm64/include/uapi 
-I./arch/ar
m64/include/generated/uapi 
-I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4
-64/kernel-source/include/uapi -I./include/generated/uapi -include 
/home/parth/AGL/build-agl-jail
house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/linux/kconfig.h 
-D__KERNEL__ -mli
ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=1 -mabi=lp64 
-Wa,-gdwarf-2 -DMODULE -c -o /h
ome/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOIN
C+4ce7658ddd-r0/git/driver/vpci_template.dtb.o 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r
aspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/vpci_template.dtb.S
| (cat /dev/null; ) > 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/
jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/modules.order 
| 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU
TOINC+4ce7658ddd-r0/git/driver/cell.c: In function 
'jailhouse_cmd_cell_create':
| 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU
TOINC+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit declaration of 
function 'cpu_down' [
-Werror=implicit-function-declaration]
| 31 | #define remove_cpu(cpu) cpu_down(cpu)
| | ^~~~~~~~
| 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU
TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion of macro 
'remove_cpu'
| 243 | err = remove_cpu(cpu);
| | ^~~~~~~~~~
| if [ "-pg" = "-pg" ]; then if [ 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o != 
"scripts/mod/empty.o"
]; then ./scripts/recordmcount 
"/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_6
4-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o"; 
fi; fi;
| cc1: all warnings being treated as errors
| make[5]: *** 
[/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-so
urce/scripts/Makefile.build:303: 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64
-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o] Error 
1
| make[5]: *** Waiting for unfinished jobs....
| if [ "-pg" = "-pg" ]; then if [ 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o != 
"scripts/mod/empty.o" ]
; then ./scripts/recordmcount 
"/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o"; 
fi; fi;
| make[4]: *** 
[/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/scripts/Makefile.build:544: 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver] 
Error 2
| make[3]: *** 
[/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/Makefile:1527: 
_module_/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git] 
Error 2
| make[2]: *** [Makefile:146: sub-make] Error 2
| make[1]: *** [Makefile:24: __sub-make] Error 2
| make: *** [Makefile:40: modules] Error 2
| WARNING: 
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:1 
exit 1 from 'exit 1'
|
ERROR: Task 
(/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile
Summary: There were 2 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/375baf50-dcb2-486b-9ddf-3de231f22ea8o%40googlegroups.com.

------=_Part_2594_131681807.1594955638729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am using=C2=A0 yocto to build jailhouse module in agl=C2=
=A0 =C2=A0for rpi4 .<div>This is the error Im getting, please help figure o=
ut<div><br></div><div><div data-pm-slice=3D"0 1 []" data-en-clipboard=3D"tr=
ue">NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn&#39;t need=
 to be rerun and 1 failed.</div><div><br></div><div>Summary: 1 task failed:=
</div><div>  /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse=
/jailhouse_git.bb:do_compile</div><div>Summary: There were 2 WARNING messag=
es shown.</div><div>Summary: There were 2 ERROR messages shown, returning a=
 non-zero exit code.</div><div>parth@Debian-95-stretch-64-minimal:~/meta-yo=
cto-jailhouse-rpi4$ </div><div>x/9.3.0/include -I/home/parth/AGL/build-agl-=
jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-</div><div>source/arch=
/arm64/include -I./arch/arm64/include/generated  -I/home/parth/AGL/build-ag=
l-jailhouse</div><div>-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/in=
clude -I./include -I/home/parth/AGL/build-ag</div><div>l-jailhouse-rpi/tmp/=
work-shared/raspberrypi4-64/kernel-source/arch/arm64/include/uapi -I./arch/=
ar</div><div>m64/include/generated/uapi -I/home/parth/AGL/build-agl-jailhou=
se-rpi/tmp/work-shared/raspberrypi4</div><div>-64/kernel-source/include/uap=
i -I./include/generated/uapi -include /home/parth/AGL/build-agl-jail</div><=
div>house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/linux/k=
config.h -D__KERNEL__ -mli</div><div>ttle-endian -D__ASSEMBLY__ -fno-PIE -D=
CONFIG_AS_LSE=3D1 -mabi=3Dlp64 -Wa,-gdwarf-2 -DMODULE  -c -o /h</div><div>o=
me/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jai=
lhouse/0.12+gitAUTOIN</div><div>C+4ce7658ddd-r0/git/driver/vpci_template.dt=
b.o /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r</div><div>aspberrypi=
4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/vpci_temp=
late.dtb.S</div><div>| (cat /dev/null; ) &gt; /home/parth/AGL/build-agl-jai=
lhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/</div><div>jailhouse/0.12+git=
AUTOINC+4ce7658ddd-r0/git/tools/modules.order </div><div>| /home/parth/AGL/=
build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+g=
itAU</div><div>TOINC+4ce7658ddd-r0/git/driver/cell.c: In function &#39;jail=
house_cmd_cell_create&#39;:</div><div>| /home/parth/AGL/build-agl-jailhouse=
-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU</div><div>TOIN=
C+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit declaration of fun=
ction &#39;cpu_down&#39; [</div><div>-Werror=3Dimplicit-function-declaratio=
n]</div><div>|    31 | #define remove_cpu(cpu)  cpu_down(cpu)</div><div>|  =
     |                          ^~~~~~~~</div><div>| /home/parth/AGL/build-=
agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU</=
div><div>TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion o=
f macro &#39;remove_cpu&#39;</div><div>|   243 |    err =3D remove_cpu(cpu)=
;</div><div>|       |          ^~~~~~~~~~</div><div>|   if [ &quot;-pg&quot=
; =3D &quot;-pg&quot; ]; then if [ /home/parth/AGL/build-agl-jailhouse-rpi/=
tmp/work/raspberrypi4</div><div>_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce=
7658ddd-r0/git/driver/sysfs.o !=3D &quot;scripts/mod/empty.o&quot;</div><di=
v> ]; then ./scripts/recordmcount  &quot;/home/parth/AGL/build-agl-jailhous=
e-rpi/tmp/work/raspberrypi4_6</div><div>4-agl-linux/jailhouse/0.12+gitAUTOI=
NC+4ce7658ddd-r0/git/driver/sysfs.o&quot;; fi; fi;</div><div>| cc1: all war=
nings being treated as errors</div><div>| make[5]: *** [/home/parth/AGL/bui=
ld-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-so</div><div>ur=
ce/scripts/Makefile.build:303: /home/parth/AGL/build-agl-jailhouse-rpi/tmp/=
work/raspberrypi4_64</div><div>-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658=
ddd-r0/git/driver/cell.o] Error 1</div><div>| make[5]: *** Waiting for unfi=
nished jobs....</div><div>|   if [ &quot;-pg&quot; =3D &quot;-pg&quot; ]; t=
hen if [ /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4</div=
><div>_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.=
o !=3D &quot;scripts/mod/empty.o&quot; ]</div><div>; then ./scripts/recordm=
count  &quot;/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_=
64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o&quot;=
; fi; fi;</div><div>| make[4]: *** [/home/parth/AGL/build-agl-jailhouse-rpi=
/tmp/work-shared/raspberrypi4-64/kernel-source/scripts/Makefile.build:544: =
/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/=
jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver] Error 2</div><div>| mak=
e[3]: *** [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberr=
ypi4-64/kernel-source/Makefile:1527: _module_/home/parth/AGL/build-agl-jail=
house-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7=
658ddd-r0/git] Error 2</div><div>| make[2]: *** [Makefile:146: sub-make] Er=
ror 2</div><div>| make[1]: *** [Makefile:24: __sub-make] Error 2</div><div>=
| make: *** [Makefile:40: modules] Error 2</div><div>| WARNING: /home/parth=
/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0=
.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:1 exit 1 from &#39;e=
xit 1&#39;</div><div>|</div><div>ERROR: Task (/home/parth/meta-yocto-jailho=
use-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile) failed with =
exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempted 1466 tasks o=
f which 1465 didn&#39;t need to be rerun and 1 failed.</div><div><br></div>=
<div>Summary: 1 task failed:</div><div>  /home/parth/meta-yocto-jailhouse-r=
pi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile</div><div>Summary:=
 There were 2 WARNING messages shown.</div><div>Summary: There were 2 ERROR=
 messages shown, returning a non-zero exit code.</div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/375baf50-dcb2-486b-9ddf-3de231f22ea8o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/375baf50-dcb2-486b-9ddf-3de231f22ea8o%40googlegroups.co=
m</a>.<br />

------=_Part_2594_131681807.1594955638729--

------=_Part_2593_1562624976.1594955638729--
