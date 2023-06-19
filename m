Return-Path: <jailhouse-dev+bncBD65FYEH6ABBBZWJYGSAMGQE756WHFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id C260A735969
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 16:23:36 +0200 (CEST)
Received: by mail-oo1-xc3e.google.com with SMTP id 006d021491bc7-55e54605e67sf392125eaf.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687184615; x=1689776615;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xwaLMsPNIXklwLidw/JX3xJFljb4SaoTHmRdSBlr+g0=;
        b=mqkuoyhy7pZBsTaLF18n/LIiyKbJb2ZN7Y5KTIPYDL2EXCfw+omtd+n4ChYbYOg55a
         UDsgjVSaWVjZ0c/0f+58ZwscC3C44hCRhESQjq44edKFLiUpfJggDOA17pGiVA0MeAbA
         biCbLI0YjyxwL76dTdV1XWdNi0ToZe3zVtzBysX+sbLgbugCmkFRzPZrQIxuRwwtYsOq
         zvaDHEKCATaaumln2PAJE7zJg86oHvIwhGyb+Ob2ULRoteNpsRvgqLs0saQ7L4fXosY1
         ZJzXJuSdakXR3nZjKFjbyfkWHBtXvNNHVHxNwgoBC1VgWlGxdRl4sVIJdec0PzAbE3M3
         0NzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687184615; x=1689776615;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwaLMsPNIXklwLidw/JX3xJFljb4SaoTHmRdSBlr+g0=;
        b=BpBjTSAqnFTnGpsDaKEQmzkxUlUtGMQzcL2XDWlBu7JDkwg2Z/0vLQO77jaQ1WysSB
         yaLwM9HNbeL/5Mn2/mFHweOyeJknluYadheMEWH2tubxmxyCXHi1hPIyG1mwCwS9J5dU
         yYYACKh3N8Hcf8Pqn4OI4Zx/NTnB4AeBrhfTp9DuQqO0YoNyvvULT+FJAeVw+P3Kc/YE
         ozVqYDUewQRBliHAcgMtTUdmTpHac4slaixSafJuHcMjbMdVnhwzjnO5RwPaQvDmA64j
         arZbK/3L2UzXJs6Wcy1OUD6qKav4AXPt5civyDUv0m6g5VqEVkTXfNTALEM/uBHg2/LC
         iC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184615; x=1689776615;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xwaLMsPNIXklwLidw/JX3xJFljb4SaoTHmRdSBlr+g0=;
        b=gbipiutmKsbZk/OgXjt5/4XxICpmyEmlZcFjdzgYoh+VNglqPy11gFzoCpuqjxfMBb
         4gwQMP0pt1xHDbX9ZqJ2HX8L8JNpUq3XOuOxOWp1rcjmqB7VIcAmnl0H/3hnUFdYejuf
         EJ/UmZl3URz+mYwChQ3GOWMnd2g4xoP8VfjBxNcQ+GnGXIxmWxF2tRu1R4SDA8W6/w9k
         Ww92ZqdhCmpYzCj/7mCwjQxxtb79RLD0oM77chf/9o3QhiM7c2HcTllyiD3m8RGhQ/Sp
         dBRTUWqiccs7k261+c7x9XVH+pd3wTXZWge+GFw/AGuyoZqs1/C0WlgYGdf5BVME6lTc
         t1hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz3MU/sCu/ckHJArElB8jnunHJe17apBsuYI9HPsmwyoIkfylTm
	icqw718DxUHv1GbedIGCNJo=
X-Google-Smtp-Source: ACHHUZ5Yd4eA7Y94GrNOjM7vNBU0Kaftw8NTuIncEX4InoVZ3C0PJV+qmGj21UXriuM47omh0Lg+Sg==
X-Received: by 2002:a05:6359:284:b0:130:e830:41d0 with SMTP id ek4-20020a056359028400b00130e83041d0mr574657rwb.14.1687184615180;
        Mon, 19 Jun 2023 07:23:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:cac4:0:b0:bdd:85d:92e2 with SMTP id a187-20020a25cac4000000b00bdd085d92e2ls13312ybg.1.-pod-prod-07-us;
 Mon, 19 Jun 2023 07:23:34 -0700 (PDT)
X-Received: by 2002:a25:6608:0:b0:bec:f29c:51dd with SMTP id a8-20020a256608000000b00becf29c51ddmr2566763ybc.3.1687184613760;
        Mon, 19 Jun 2023 07:23:33 -0700 (PDT)
Date: Mon, 19 Jun 2023 07:23:32 -0700 (PDT)
From: sai krishna Allu <saikrishna.allu@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <60a06afd-9ddd-4304-aee5-d61d8ebeb141n@googlegroups.com>
In-Reply-To: <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
 <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
 <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
 <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16456_246730814.1687184612939"
X-Original-Sender: saikrishna.allu@gmail.com
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

------=_Part_16456_246730814.1687184612939
Content-Type: multipart/alternative; 
	boundary="----=_Part_16457_1517341716.1687184612939"

------=_Part_16457_1517341716.1687184612939
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

I have downloaded the master branch and given make and I have got the=20
following error, I fixed the error with one of the reference link, but=20
didn't find the /dev/jailhouse post installation

ubuntu@ubuntu:~/jailhouse$ git branch
* master
ubuntu@ubuntu:~/jailhouse$make
...
...
...
  CC      /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.o
  OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.cell
  DTC     /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb

*/home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:=20
error: no include path in which to search for=20
dt-bindings/interrupt-controller/arm-gic.h   17 | #include=20
<dt-bindings/interrupt-controller/arm-gic.h>*
      |                                                      ^
make[3]: *** [scripts/Makefile.lib:286:=20
/home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error 1
make[2]: *** [scripts/Makefile.build:519: /home/ubuntu/jailhouse/configs]=
=20
Error 2
make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2
make: *** [Makefile:40: modules] Error 2
ubuntu@ubuntu:~/jailhouse$

To fix the above I have followed the link=20
https://bbs.csdn.net/topics/615205697 and changed as per instruction, even=
=20
I followed the earlier build from this link only. but I was not able to=20
build jailhouse-image.


DTC_INCLUDE    +=3D /usr/src/linux-headers-5.4.0-1069-raspi/include added i=
n=20
the file -->/usr/src/linux-headers-5.4.0-1011-raspi/scripts/Makefile.lib

After that I am able to install,=20

ubuntu@ubuntu:~/jailhouse$ sudo make install
  Building modules, stage 2.
  MODPOST 1 modules
  INSTALL /home/ubuntu/jailhouse/driver/jailhouse.ko
At main.c:160:
- SSL error:02001002:system library:fopen:No such file or directory:=20
../crypto/bio/bss_file.c:69
- SSL error:2006D080:BIO routines:BIO_new_file:no such file:=20
../crypto/bio/bss_file.c:76
sign-file: certs/signing_key.pem: No such file or directory
  DEPMOD  5.4.0-1069-raspi
Warning: modules_install: missing 'System.map' file. Skipping depmod.
install -m 644 hypervisor/jailhouse*.bin /lib/firmware
install -d -m 755 /usr/local/libexec/jailhouse
install -m 644 inmates/tools/arm64/*.bin /usr/local/libexec/jailhouse
install jailhouse demos/ivshmem-demo /usr/local/sbin
install jailhouse-config-collect jailhouse-cell-linux jailhouse-cell-stats=
=20
jailhouse-config-create jailhouse-config-check jailhouse-hardware-check=20
/usr/local/libexec/jailhouse
install -d -m 755 /usr/local/share/jailhouse
install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.tmpl=20
/usr/local/share/jailhouse
install -m 644 jailhouse-completion.bash=20
/usr/share/bash-completion/completions/jailhouse
install -d -m 755 /usr/local/share/man/man8
install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-enable.8=20
/usr/local/share/man/man8
python3 -m pip install --upgrade --force-reinstall  .
Processing /home/ubuntu/jailhouse
Building wheels for collected packages: pyjailhouse
  Building wheel for pyjailhouse (setup.py) ... done
  Created wheel for pyjailhouse: filename=3Dpyjailhouse-0.12-py3-none-any.w=
hl=20
size=3D22795=20
sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021a3853bb
  Stored in directory:=20
/tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a3693d675b8bd9bc=
dcb021956f8d467789b3be58740
Successfully built pyjailhouse
Installing collected packages: pyjailhouse
Successfully installed pyjailhouse-0.12
ubuntu@ubuntu:~/jailhouse$

*but not able to get jailhouse in dev file.*

ubuntu@ubuntu:~/jailhouse$* ls -l /dev/jailhouse*
*ls: cannot access '/dev/jailhouse': No such file or directory*
ubuntu@ubuntu:~/jailhouse$

Please suggest the correct way to install or anything else I need to change=
=20
or need to follow different steps to fix this issue to get the installation=
=20
success.=20

Regards,
Sai Krishna

On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsauer wrote=
:

>
>
> On 19/06/2023 12:23, sai krishna Allu wrote:
> > Hi Ralf,
> >=20
> > I have attached the hypervisor.o and I have taken the dump of that whic=
h=20
> > is also attached too.
> > I have below command to extract, let me know is it ok or not.
> >=20
> > ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d=20
> > jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
> >=20
> > ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep "ffffc0203820"
> > *3338    ffffc0203820:       f9400282        ldr     x2, [x20]*
> > ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
> >       patch+0x218>
> >  3334     ffffc0203810:       f9400282        ldr     x2, [x20]
> >  3335     ffffc0203814:       f9400842        ldr     x2, [x2, #16]
> >  3336     ffffc0203818:       8a130042        and     x2, x2, x19
> >  3337     ffffc020381c:       f90a4002        str     x2, [x0, #5248]
> > * 3338     ffffc0203820:       f9400282        ldr     x2, [x20]*
> >  3339     ffffc0203824:       f9400c42        ldr     x2, [x2, #24]
> >  3340     ffffc0203828:       8a130053        and     x19, x2, x19
> >  3341     ffffc020382c:       52800022        mov     w2, #0x1
> >=20
> > The instruction at ffffc0203820 means it Load x2 from contents of x20=
=20
> > register.
> > Please suggest how to fix this.
>
> Keep calm, I'm still trying to figure out where the problem exactly is.
>
> Now I know the line of code, where the exception exactly happens. It's=20
> in hypervisor/arch/arm-common/psci.c:39
>
> ldr x2, [x20] <- Here we likely load ctx->regs[2], and the only variant=
=20
> how this could fail is that ctx points to somewhere. Here we're inside=20
> the routine psci_emulate_cpu_on, which shouldn't even be called when=20
> enabling the hypervisor. I don't know yet what could be the issue.
>
> Before we keep on debugging: I saw that you use Jailhouse v0.12.
>
> Could you please switch to the master and/or next branch of jailhouse,=20
> and see if the error still occurs there?
>
> Thanks,
> Ralf
>
> >=20
> > Regards,
> > Sai Krishna
> >=20
> > On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf Ramsauer=
 wrote:
> >=20
> > Hi,
> >=20
> > On 15/06/2023 10:11, sai krishna Allu wrote:
> > > Hi Team,
> > >
> > > I have Raspberry Pi 4, which is installed with Ubuntu 20.04.5 LTS
> > 64 bit.
> > > after loading the jailhouse.ko file, when I gave following
> > command I am
> > > getting the exception.
> > >
> > > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
> > configs/arm64/rpi4.cell
> > >
> > > Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
> > > Code location: 0x0000ffffc0200800
> > > Page pool usage after early setup: mem 39/994, remap 0/131072
> > > Initializing processors:
> > >  CPU 0...
> > > FATAL: Unhandled HYP exception: synchronous abort from EL2
> >=20
> > Synchronous abort from EL2 means that we have a fatal error inside
> > Jailhouse (e.g., segfault).
> >=20
> > >  pc: 0000ffffc0203820   lr: 0000ffffc020380c spsr: 800003c9     EL2
> >=20
> > Could you please disassemble your hypervisor binary, and see where the
> > exception exactly occurs? Do this with:
> >=20
> > aarch64-objdump -d hypervisor/hypervisor.o
> >=20
> > And see what code executes behind 0x0000ffffc0203820. Alternatively,
> > you
> > can also attach the hypervisor.o.
> >=20
> > Thanks,
> > Ralf
> >=20
> > >  sp: 0000ffffc021ee40  esr: 00 1 0000000
> > >  x0: 0000000084000000   x1: 0000000000000008   x2: 0000000080003580
> > >  x3: 0000ffffc020e170   x4: 0000000000000014   x5: 000003ffffffffff
> > >  x6: 0000000000000029   x7: 0000ffffc0219d30   x8: 000000000000002a
> > >  x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001
> > > x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000
> > > x15: 0000ffffc0015040  x16: 0000ffffc020d1fc  x17: ffffbcae22826688
> > > x18: 0000000000000001  x19: 0000ffffc021e000  x20: 0000ffffc0219000
> > > x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000000
> > > x24: 0000000000000001  x25: 0000ffffc021e000  x26: 0000ffffc021f000
> > > x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc021ee40
> > >
> > > Hypervisor stack before exception Stopping CPU 0 (Cell:
> > "Raspberry-Pi4")
> > >
> > >
> > > Please suggest how to fix this problem.
> > >
> > > Regards,
> > > Sai Krishna
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>.
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com.

------=_Part_16457_1517341716.1687184612939
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,<br /><br />I have downloaded the master branch and given make and =
I have got the following error, I fixed the error with one of the reference=
 link, but didn't find the /dev/jailhouse post installation<br /><br />ubun=
tu@ubuntu:~/jailhouse$ git branch<br />* master<br />ubuntu@ubuntu:~/jailho=
use$make<br />...<br />...<br />...<br />=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/hom=
e/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.o<br />=C2=A0 OBJCOPY /home/=
ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.cell<br />=C2=A0 DTC =C2=A0 =
=C2=A0 /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb<br /=
><b>/home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54: =
error: no include path in which to search for dt-bindings/interrupt-control=
ler/arm-gic.h<br />=C2=A0 =C2=A017 | #include &lt;dt-bindings/interrupt-con=
troller/arm-gic.h&gt;</b><br />=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^<br />make[3]: *** [scripts/Makefile.lib:286: /home/ub=
untu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error 1<br />make[=
2]: *** [scripts/Makefile.build:519: /home/ubuntu/jailhouse/configs] Error =
2<br />make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2<br />ma=
ke: *** [Makefile:40: modules] Error 2<br />ubuntu@ubuntu:~/jailhouse$<br /=
><br />To fix the above I have followed the link https://bbs.csdn.net/topic=
s/615205697 and changed as per instruction, even I followed the earlier bui=
ld from this link only. but I was not able to build jailhouse-image.<br /><=
br /><br />DTC_INCLUDE =C2=A0 =C2=A0+=3D /usr/src/linux-headers-5.4.0-1069-=
raspi/include added in the file --&gt;/usr/src/linux-headers-5.4.0-1011-ras=
pi/scripts/Makefile.lib<br /><br />After that I am able to install, <br /><=
br />ubuntu@ubuntu:~/jailhouse$ sudo make install<br />=C2=A0 Building modu=
les, stage 2.<br />=C2=A0 MODPOST 1 modules<br />=C2=A0 INSTALL /home/ubunt=
u/jailhouse/driver/jailhouse.ko<br />At main.c:160:<br />- SSL error:020010=
02:system library:fopen:No such file or directory: ../crypto/bio/bss_file.c=
:69<br />- SSL error:2006D080:BIO routines:BIO_new_file:no such file: ../cr=
ypto/bio/bss_file.c:76<br />sign-file: certs/signing_key.pem: No such file =
or directory<br />=C2=A0 DEPMOD =C2=A05.4.0-1069-raspi<br />Warning: module=
s_install: missing 'System.map' file. Skipping depmod.<br />install -m 644 =
hypervisor/jailhouse*.bin /lib/firmware<br />install -d -m 755 /usr/local/l=
ibexec/jailhouse<br />install -m 644 inmates/tools/arm64/*.bin /usr/local/l=
ibexec/jailhouse<br />install jailhouse demos/ivshmem-demo /usr/local/sbin<=
br />install jailhouse-config-collect jailhouse-cell-linux jailhouse-cell-s=
tats jailhouse-config-create jailhouse-config-check jailhouse-hardware-chec=
k /usr/local/libexec/jailhouse<br />install -d -m 755 /usr/local/share/jail=
house<br />install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.=
tmpl /usr/local/share/jailhouse<br />install -m 644 jailhouse-completion.ba=
sh /usr/share/bash-completion/completions/jailhouse<br />install -d -m 755 =
/usr/local/share/man/man8<br />install -m 644 jailhouse.8 jailhouse-cell.8 =
jailhouse-enable.8 /usr/local/share/man/man8<br />python3 -m pip install --=
upgrade --force-reinstall =C2=A0.<br />Processing /home/ubuntu/jailhouse<br=
 />Building wheels for collected packages: pyjailhouse<br />=C2=A0 Building=
 wheel for pyjailhouse (setup.py) ... done<br />=C2=A0 Created wheel for py=
jailhouse: filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D22795 sha256=
=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021a3853bb<br />=
=C2=A0 Stored in directory: /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/7=
0/5f/41e4b42a3693d675b8bd9bcdcb021956f8d467789b3be58740<br />Successfully b=
uilt pyjailhouse<br />Installing collected packages: pyjailhouse<br />Succe=
ssfully installed pyjailhouse-0.12<br />ubuntu@ubuntu:~/jailhouse$<br /><br=
 /><b>but not able to get jailhouse in dev file.</b><br /><br />ubuntu@ubun=
tu:~/jailhouse$<b> ls -l /dev/jailhouse</b><br /><b>ls: cannot access '/dev=
/jailhouse': No such file or directory</b><br />ubuntu@ubuntu:~/jailhouse$<=
br /><br />Please suggest the correct way to install or anything else I nee=
d to change or need to follow different steps to fix this issue to get the =
installation success. <br /><br />Regards,<br />Sai Krishna<br /><br /><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, Ju=
ne 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsauer wrote:<br/></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 19/06/2023 12:23, sai krishna Allu wrote:
<br>&gt; Hi Ralf,
<br>&gt;=20
<br>&gt; I have attached the hypervisor.o and I have taken the dump of that=
 which=20
<br>&gt; is also attached too.
<br>&gt; I have below command to extract, let me know is it ok or not.
<br>&gt;=20
<br>&gt; ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d=20
<br>&gt; jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
<br>&gt;=20
<br>&gt; ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep &quot;ffffc02038=
20&quot;
<br>&gt; *3338 =C2=A0 =C2=A0ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400282 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
<br>&gt; ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
<br>&gt;  =C2=A0 =C2=A0 =C2=A0 patch+0x218&gt;
<br>&gt;  =C2=A03334 =C2=A0 =C2=A0 ffffc0203810: =C2=A0 =C2=A0 =C2=A0 f9400=
282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]
<br>&gt;  =C2=A03335 =C2=A0 =C2=A0 ffffc0203814: =C2=A0 =C2=A0 =C2=A0 f9400=
842 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #16]
<br>&gt;  =C2=A03336 =C2=A0 =C2=A0 ffffc0203818: =C2=A0 =C2=A0 =C2=A0 8a130=
042 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x2, x2, x19
<br>&gt;  =C2=A03337 =C2=A0 =C2=A0 ffffc020381c: =C2=A0 =C2=A0 =C2=A0 f90a4=
002 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 x2, [x0, #5248]
<br>&gt; *=C2=A03338 =C2=A0 =C2=A0 ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400=
282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
<br>&gt;  =C2=A03339 =C2=A0 =C2=A0 ffffc0203824: =C2=A0 =C2=A0 =C2=A0 f9400=
c42 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #24]
<br>&gt;  =C2=A03340 =C2=A0 =C2=A0 ffffc0203828: =C2=A0 =C2=A0 =C2=A0 8a130=
053 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x19, x2, x19
<br>&gt;  =C2=A03341 =C2=A0 =C2=A0 ffffc020382c: =C2=A0 =C2=A0 =C2=A0 52800=
022 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 w2, #0x1
<br>&gt;=20
<br>&gt; The instruction at=C2=A0ffffc0203820=C2=A0means it Load x2 from co=
ntents of x20=20
<br>&gt; register.
<br>&gt; Please suggest how to fix this.
<br>
<br>Keep calm, I&#39;m still trying to figure out where the problem exactly=
 is.
<br>
<br>Now I know the line of code, where the exception exactly happens. It&#3=
9;s=20
<br>in hypervisor/arch/arm-common/psci.c:39
<br>
<br>ldr x2, [x20] &lt;- Here we likely load ctx-&gt;regs[2], and the only v=
ariant=20
<br>how this could fail is that ctx points to somewhere. Here we&#39;re ins=
ide=20
<br>the routine psci_emulate_cpu_on, which shouldn&#39;t even be called whe=
n=20
<br>enabling the hypervisor. I don&#39;t know yet what could be the issue.
<br>
<br>Before we keep on debugging: I saw that you use Jailhouse v0.12.
<br>
<br>Could you please switch to the master and/or next branch of jailhouse,=
=20
<br>and see if the error still occurs there?
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Regards,
<br>&gt; Sai Krishna
<br>&gt;=20
<br>&gt; On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf Ram=
sauer wrote:
<br>&gt;=20
<br>&gt;     Hi,
<br>&gt;=20
<br>&gt;     On 15/06/2023 10:11, sai krishna Allu wrote:
<br>&gt;      &gt; Hi Team,
<br>&gt;      &gt;
<br>&gt;      &gt; I have=C2=A0Raspberry Pi 4, which is installed with Ubun=
tu 20.04.5 LTS
<br>&gt;     64 bit.
<br>&gt;      &gt; after loading the jailhouse.ko file, when I gave followi=
ng
<br>&gt;     command I am
<br>&gt;      &gt; getting the exception.
<br>&gt;      &gt;
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
<br>&gt;     configs/arm64/rpi4.cell
<br>&gt;      &gt;
<br>&gt;      &gt; Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on=
 CPU 0
<br>&gt;      &gt; Code location: 0x0000ffffc0200800
<br>&gt;      &gt; Page pool usage after early setup: mem 39/994, remap 0/1=
31072
<br>&gt;      &gt; Initializing processors:
<br>&gt;      &gt; =C2=A0CPU 0...
<br>&gt;      &gt; FATAL: Unhandled HYP exception: synchronous abort from E=
L2
<br>&gt;=20
<br>&gt;     Synchronous abort from EL2 means that we have a fatal error in=
side
<br>&gt;     Jailhouse (e.g., segfault).
<br>&gt;=20
<br>&gt;      &gt; =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffffc020380c s=
psr: 800003c9 =C2=A0 =C2=A0 EL2
<br>&gt;=20
<br>&gt;     Could you please disassemble your hypervisor binary, and see w=
here the
<br>&gt;     exception exactly occurs? Do this with:
<br>&gt;=20
<br>&gt;     aarch64-objdump -d hypervisor/hypervisor.o
<br>&gt;=20
<br>&gt;     And see what code executes behind 0x0000ffffc0203820. Alternat=
ively,
<br>&gt;     you
<br>&gt;     can also attach the hypervisor.o.
<br>&gt;=20
<br>&gt;     Thanks,
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt; =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 0000000
<br>&gt;      &gt; =C2=A0x0: 0000000084000000 =C2=A0 x1: 0000000000000008 =
=C2=A0 x2: 0000000080003580
<br>&gt;      &gt; =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 0000000000000014 =
=C2=A0 x5: 000003ffffffffff
<br>&gt;      &gt; =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffffc0219d30 =
=C2=A0 x8: 000000000000002a
<br>&gt;      &gt; =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =
=C2=A0x11: 0000000000000001
<br>&gt;      &gt; x12: 0000000000000015 =C2=A0x13: 0000000000000001 =C2=A0=
x14: 0000ffffc0219000
<br>&gt;      &gt; x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =C2=A0=
x17: ffffbcae22826688
<br>&gt;      &gt; x18: 0000000000000001 =C2=A0x19: 0000ffffc021e000 =C2=A0=
x20: 0000ffffc0219000
<br>&gt;      &gt; x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219000 =C2=A0=
x23: 0000000000000000
<br>&gt;      &gt; x24: 0000000000000001 =C2=A0x25: 0000ffffc021e000 =C2=A0=
x26: 0000ffffc021f000
<br>&gt;      &gt; x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218000 =C2=A0=
x29: 0000ffffc021ee40
<br>&gt;      &gt;
<br>&gt;      &gt; Hypervisor stack before exception Stopping CPU 0 (Cell:
<br>&gt;     &quot;Raspberry-Pi4&quot;)
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; Please suggest how to fix this problem.
<br>&gt;      &gt;
<br>&gt;      &gt; Regards,
<br>&gt;      &gt; Sai Krishna
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687270=
758222000&amp;usg=3DAOvVaw3JMRLg1EEdKiixE4p74YE3">https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687270=
758222000&amp;usg=3DAOvVaw3JMRLg1EEdKiixE4p74YE3">https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1687270758222000&amp;usg=3DAOvVaw1InfsbxmcGkjhAGXtMD18L">https://grou=
ps.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-966=
6-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687270758222000&=
amp;usg=3DAOvVaw1InfsbxmcGkjhAGXtMD18L">https://groups.google.com/d/msgid/j=
ailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bdaa149=
9-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-=
812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16872707582=
23000&amp;usg=3DAOvVaw3dJS-BCUFH6xQ9cV_-AgGf">https://groups.google.com/d/m=
sgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bdaa149=
9-4532-423f-a59d-812557f8162an%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
687270758223000&amp;usg=3DAOvVaw0t51eirs92YY4HMt5aW7k5">https://groups.goog=
le.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.co=
m</a>.<br />

------=_Part_16457_1517341716.1687184612939--

------=_Part_16456_246730814.1687184612939--
