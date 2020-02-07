Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBB4WV67YQKGQEIGKVTHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8115615E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Feb 2020 23:55:47 +0100 (CET)
Received: by mail-oi1-x23b.google.com with SMTP id c4sf1941800oiy.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Feb 2020 14:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oQfpVL9xn/kCh4+n+Rkbv15di7OHidGJl9MGLt5lxCo=;
        b=Xmn1wSYKVpXSYPbSOPiinC337RzeZCreHE+Hn9nX7Q5yT6xPYH4ZlFM84OepYkReND
         1nFU1zNPMSl5nhfkji0TfbogSn/Elcn6iB9XA1r57RnY9Us2kz2ofvkCMRo1CGa8noS1
         g8AHMrkVbCcbiuZ4qVOqp+kyfj+jc9yOwCkZFL6Gmz4r80xIRrVuYoIE5zLiCY8NWb+X
         j2/QXwvFk8pXNGmdgq6fzURUZV099Nmh9JA13Zmh+k0KhhXZ++hGr3KzNHCES5wmmwKC
         p7rmoq7sYUhCJtNZ/7fMLullz1pXAL22sy9UwXQar+kjhQ5Q+Dzh0ijK2wyLVrUw7jgu
         xn2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oQfpVL9xn/kCh4+n+Rkbv15di7OHidGJl9MGLt5lxCo=;
        b=mPihzPmmEEHeX7XzW3jdol8JAmyc8qQhr4QPX16z1ooEyRSStXageSvIv+j02b8bx4
         hvf9feB0UEN1HiXGUuZjL7NQFm5dCzhJO4CHlo55Awl4fmyHEyYgmbNWATixQbUaEB/b
         CuQsXsFN4awqVp6cj0F5tX4BxA5vIpoLr+5iYFHxgQC6Xz0mLwLPXcTgV8PO26saCqii
         2/mdBUp1nTy2S9pjlAZG4PM7D7gw2KgVvagsCHwC6f75r40Ym1QvfCmJ7y++lIFU76Nt
         EUI0nMHrXAkCzgQlo/nR2HNd7EXu1HyolWl2hplYvk3ywQ83/P68RVAhVoAxZ8j6z839
         9RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oQfpVL9xn/kCh4+n+Rkbv15di7OHidGJl9MGLt5lxCo=;
        b=eAsWkfy96srS8F0yVZBUAPf6fO6QCsviiforID/uvJn8Ho8YW+bo+xkbK5iISOgRC3
         +OeAMQtG7KyhlU+3YlsAlyCBX3cJY7djGCKbxoaSLUR4fx9WmwrI7aftOLQgVVQI0sPF
         CIWEhCFoBm5+JwK0AWlSj3Opy2irWVfxv4DFZMadBO5EZ0L17jFQdCLmIdzj5nxzdx5k
         ntM6HF5MsZ5+m3Op+Z1x9dZz4DylGp2k1PiYpoBolMr/elj/B4anWu35afJrLqS5Ujj9
         eVtp//Gpsej5i11CWn2H5gW06d5N6DTvEdQ77wzK+BDuHuq2Oo11IvOcHgMQUDsoacvg
         d7YQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVU3+lpHRFXYPxZhTe+hZtKYcnYuUTUz0kwRcpnPNi0XGcxjnfC
	6rz2IYz7aQQUqlSmWRFV9ko=
X-Google-Smtp-Source: APXvYqzFbZ00JDLQrrDkcOmk3bdTBuaLpGeEMvPB9jqppx1cdTXlU+lZj//2o/CMSqUYcgv4Drro3g==
X-Received: by 2002:aca:be56:: with SMTP id o83mr3714201oif.25.1581116146379;
        Fri, 07 Feb 2020 14:55:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5a87:: with SMTP id w7ls254477oth.1.gmail; Fri, 07 Feb
 2020 14:55:45 -0800 (PST)
X-Received: by 2002:a05:6830:12d5:: with SMTP id a21mr1352801otq.296.1581116145597;
        Fri, 07 Feb 2020 14:55:45 -0800 (PST)
Date: Fri, 7 Feb 2020 14:55:44 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8@googlegroups.com>
Subject: jailhouse compilation error (no include path)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_554_2100323965.1581116144923"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_554_2100323965.1581116144923
Content-Type: multipart/alternative; 
	boundary="----=_Part_555_607626947.1581116144923"

------=_Part_555_607626947.1581116144923
Content-Type: text/plain; charset="UTF-8"

While trying to built on jailhouse(master version) on jetson tx2 board I 
get the following  error:
kernel version-4.9--tegra
nvidia@jetson-0320218169735:~/jailhouse$ sudo make:
 CHK      /home/nvidia/jailhouse/hypervisor/include/generated/config.mk
  UPD     /home/nvidia/jailhouse/hypervisor/include/generated/config.mk
 CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle.cell
  CC      /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/espressobin.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin.cell
  CC      /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.o
  OBJCOPY 
/home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/foundation-v8.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8.cell
  CC      /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/hikey.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.cell
  CC      /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/imx8mq.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq.cell
  CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1.cell
  CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx2.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2.cell
  CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.cell
  CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.cell
  CC      /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/macchiatobin.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin.cell
  CC      
/home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.o
  OBJCOPY 
/home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.cell
  CC      
/home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.o
  OBJCOPY 
/home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.cell
  CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64.cell
  CC      /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/rpi4.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cell
  CC      /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/ultra96.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.cell
  CC      /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.o
  OBJCOPY 
/home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.o
  OBJCOPY 
/home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.cell
  CC      /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.cell
  CC      /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.o
  OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.cell
  DTC     /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb

/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54: 
error: no include path in which to search for 
dt-bindings/interrupt-controller/arm-gic.h
scripts/Makefile.lib:291: recipe for target 
'/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb' failed
make[3]: *** 
[/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error 1
scripts/Makefile.build:479: recipe for target 
'/home/nvidia/jailhouse/configs' failed
make[2]: *** [/home/nvidia/jailhouse/configs] Error 2
Makefile:1429: recipe for target '_module_/home/nvidia/jailhouse' failed
make[1]: *** [_module_/home/nvidia/jailhouse] Error 2
Makefile:40: recipe for target 'modules' failed
make: *** [modules] Error 2
I also tried it cross compiling in host machine and I got the same error. 
(i also tried cross compiling in different x86 machine one with kernel-4.4 
(ubuntu 16.04) and another with kernel-5.01(ubuntu 18.04) but same error as 
above pops up)
please give me some guide
Thank you!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8%40googlegroups.com.

------=_Part_555_607626947.1581116144923
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>While trying to built on jailhouse(master version) on=
 jetson tx2 board I get the following=C2=A0 error:</div><div>kernel version=
-4.9--tegra<br></div><div>nvidia@jetson-0320218169735:~/jailhouse$ sudo mak=
e:</div><div>=C2=A0CHK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse=
/hypervisor/include/generated/config.mk<br>=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/nvidia/jailhouse/hypervisor/include/generated/config.mk</div><div=
>=C2=A0CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm6=
4/amd-seattle-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/config=
s/arm64/amd-seattle-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.o<br>=C2=
=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.cel=
l<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs=
/arm64/amd-seattle.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64=
/amd-seattle.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/j=
ailhouse/configs/arm64/espressobin-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nv=
idia/jailhouse/configs/arm64/espressobin-inmate-demo.cell<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/espressobi=
n-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espre=
ssobin-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvi=
dia/jailhouse/configs/arm64/espressobin.o<br>=C2=A0 OBJCOPY /home/nvidia/ja=
ilhouse/configs/arm64/espressobin.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.o<br>=
=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-de=
mo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/c=
onfigs/arm64/foundation-v8-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jail=
house/configs/arm64/foundation-v8-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/foundation-v8.o<br>=
=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8.cell<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm6=
4/hikey-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm6=
4/hikey-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/n=
vidia/jailhouse/configs/arm64/hikey-linux-demo.o<br>=C2=A0 OBJCOPY /home/nv=
idia/jailhouse/configs/arm64/hikey-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/hikey.o<br>=C2=A0 O=
BJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.cell<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate=
-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq-inmat=
e-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/imx8mq.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/=
arm64/imx8mq.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/j=
ailhouse/configs/arm64/jetson-tx1-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvi=
dia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.cell<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/jetson-tx1-li=
nux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx=
1-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/j=
ailhouse/configs/arm64/jetson-tx1.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhous=
e/configs/arm64/jetson-tx1.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.o<br>=C2=A0 OBJ=
COPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.cell<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm6=
4/jetson-tx2.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetso=
n-tx2.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhous=
e/configs/arm64/k3-am654-idk-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/ja=
ilhouse/configs/arm64/k3-am654-idk-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.o<br>=
=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.cell<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm6=
4/k3-am654-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/a=
rm64/k3-am654-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.o<br>=C2=A0 OB=
JCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell<br=
>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm=
64/k3-j721e-evm-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/confi=
gs/arm64/k3-j721e-evm-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.o<br>=C2=A0 OBJCOP=
Y /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.cell<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/macchiatobin-=
inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchi=
atobin-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nv=
idia/jailhouse/configs/arm64/macchiatobin-linux-demo.o<br>=C2=A0 OBJCOPY /h=
ome/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.cell<br>=C2=A0 C=
C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/macchi=
atobin.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobi=
n.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/co=
nfigs/arm64/miriac-sbc-ls1046a-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia=
/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.cell<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/miriac-=
sbc-ls1046a-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/a=
rm64/miriac-sbc-ls1046a-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.o<br>=C2=
=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.cell<br=
>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm=
64/qemu-arm64-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/config=
s/arm64/qemu-arm64-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.o<br>=C2=A0 =
OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.cell<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm6=
4/qemu-arm64.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-=
arm64.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhous=
e/configs/arm64/rpi4-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse=
/configs/arm64/rpi4-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.o<br>=C2=A0 OBJ=
COPY /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.cell<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/rpi4.o<=
br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cell<br>=C2=A0 =
CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/ultra=
96-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ult=
ra96-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvid=
ia/jailhouse/configs/arm64/ultra96-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvi=
dia/jailhouse/configs/arm64/ultra96-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/ultra96.o<br>=C2=
=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.cell<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/zynqmp-=
zcu102-inmate-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64=
/zynqmp-zcu102-inmate-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.o<br>=C2=A0=
 OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.ce=
ll<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/config=
s/arm64/zynqmp-zcu102-linux-demo.o<br>=C2=A0 OBJCOPY /home/nvidia/jailhouse=
/configs/arm64/zynqmp-zcu102-linux-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.o<br>=C2=A0=
 OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.cell<br>=C2=A0 =
DTC=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/dts/inmate=
-amd-seattle.dtb<br><br></div><div>/home/nvidia/jailhouse/configs/arm64/dts=
/inmate-amd-seattle.dts:17:54: error: no include path in which to search fo=
r dt-bindings/interrupt-controller/arm-gic.h<br>scripts/Makefile.lib:291: r=
ecipe for target &#39;/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-s=
eattle.dtb&#39; failed<br>make[3]: *** [/home/nvidia/jailhouse/configs/arm6=
4/dts/inmate-amd-seattle.dtb] Error 1<br>scripts/Makefile.build:479: recipe=
 for target &#39;/home/nvidia/jailhouse/configs&#39; failed<br>make[2]: ***=
 [/home/nvidia/jailhouse/configs] Error 2<br>Makefile:1429: recipe for targ=
et &#39;_module_/home/nvidia/jailhouse&#39; failed<br>make[1]: *** [_module=
_/home/nvidia/jailhouse] Error 2<br>Makefile:40: recipe for target &#39;mod=
ules&#39; failed<br>make: *** [modules] Error 2</div><div>I also tried it c=
ross compiling in host machine and I got the same error. (i also tried cros=
s compiling in different x86 machine one with kernel-4.4 (ubuntu 16.04) and=
 another with kernel-5.01(ubuntu 18.04) but same error as above pops up)</d=
iv><div>please give me some guide</div><div>Thank you!<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8%40googlegroups.com<=
/a>.<br />

------=_Part_555_607626947.1581116144923--

------=_Part_554_2100323965.1581116144923--
