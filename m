Return-Path: <jailhouse-dev+bncBD65FYEH6ABBB7GVYGSAMGQELAWHGRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D83735A08
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 16:49:33 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-bf0ba82473dsf1656599276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687186173; x=1689778173;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ffbm/+//lVuq022oJWGYuK2iAT4hh+4B71LuxrNSTjw=;
        b=dGUukexaV4ZHWm5PdfTuOY8KtvISurezOtnuk0cosDmEad+wnhDY87BPz2TWD6jfbR
         OIPmZHG03q1ijlwsAsMxY5sHWYuke5Nna+1/klnr6irkk0SoR5aIKhZDFJCohWjzKY5J
         bz8hrzdR8ZoEnsHmR9KnoyxNOKsBjKQdijUIN9G80igDYrzfCUST0vniS9VldhR05Afj
         wxEaF6FAJqAXYkjmw2cRAR+Rrx9VQnyW2ui3YyuQbgQuAAtF+7vVHc4fGuxAsfy/gFmF
         DXtxZa5IqzMobfHLDxG8imAqpHPk1Dm4rdGpPI9sFJCjSYEu7eJIwz21SUxxfXFs8aee
         UJ8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687186173; x=1689778173;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ffbm/+//lVuq022oJWGYuK2iAT4hh+4B71LuxrNSTjw=;
        b=aPcXwrzJH0SVUU2huTN7plBMpjBpKmV5Ab2bIwmwELVpNZCf3bofzm9vJUHMZPqdk9
         6gnMG6xxkLGf5d1t30gmKRdLAG9UkaoMfqk5MgSJsiAzO1BVEvULc87DXGaCRSGXQONs
         8siaoso31m5cyo6qikwHw6sETUUZeQyqTLFE8rjSjQGpabF9ElRkZcCwrFO/hMhM+d7m
         NF7Fz1JQkVtUJ/djdmbvRfSgAYrb2XrUTMAyCfiqRxm3bEDWvuZ30lSs16iDmG8fFsaV
         fB3Q+URxYK7y7VYhpj3cdVBMc+8eafp3argTeA1LXUSjlCb+8bWn6g3/+9LeEkdS6ud7
         QAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687186173; x=1689778173;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ffbm/+//lVuq022oJWGYuK2iAT4hh+4B71LuxrNSTjw=;
        b=ZyEH5r6u7u7qJNUiw9LsxZc5Oaupn80QjHFwk8eCkfbigszNp1ypWBLviTupYaj49T
         Er+QB+sSz4GZdrprYzKRPVCBXq79BhBsd3l5kC8uiDVjQgnSsQ8FZa1OHCSMqcYktJ9V
         f2vs5Dc6qR0w3oUkU+obPvad3HchJ9WcbWZdXwK0lMOpUnQ6uBd1XT325FUsvYNoNC3F
         g145CmuS5Likryz7fA5SlCGZFuL6l5Xog2+YngKrhNLW75Hx8GdAapCViBQDjh3pa1vI
         djaX9e/cQ/fRHpeE6/TyHajmqYZJyF3qPC7KAfVm7l9j69ys/x9eHWzLV41uGKfQH8kE
         0EoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDySvnvRlEbP7mAo0XefkRbJzJqPRJnMeBXJx06RviBklWP4kTMP
	NIzOQqKcedLIM2mQo/s5mmk=
X-Google-Smtp-Source: ACHHUZ4uN5Uyk8ongY7/8tDylkyXcEme7wW6XhH1Gky6GaokoXH5A4KS4FLkPth4xCEiucUVKTHWPg==
X-Received: by 2002:a25:32c7:0:b0:bce:f883:e0b2 with SMTP id y190-20020a2532c7000000b00bcef883e0b2mr6571822yby.42.1687186172647;
        Mon, 19 Jun 2023 07:49:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e086:0:b0:bc6:8043:4e9f with SMTP id x128-20020a25e086000000b00bc680434e9fls1965317ybg.0.-pod-prod-02-us;
 Mon, 19 Jun 2023 07:49:31 -0700 (PDT)
X-Received: by 2002:a25:aea2:0:b0:bac:faf4:78fd with SMTP id b34-20020a25aea2000000b00bacfaf478fdmr921798ybj.7.1687186171237;
        Mon, 19 Jun 2023 07:49:31 -0700 (PDT)
Date: Mon, 19 Jun 2023 07:49:30 -0700 (PDT)
From: sai krishna Allu <saikrishna.allu@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ff5f75fd-7b70-424a-ab0e-537d4242afffn@googlegroups.com>
In-Reply-To: <c7787605-7a3f-b392-f7e8-9fd10170ab57@oth-regensburg.de>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
 <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
 <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
 <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
 <60a06afd-9ddd-4304-aee5-d61d8ebeb141n@googlegroups.com>
 <c7787605-7a3f-b392-f7e8-9fd10170ab57@oth-regensburg.de>
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_27448_1289545135.1687186170813"
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

------=_Part_27448_1289545135.1687186170813
Content-Type: multipart/alternative; 
	boundary="----=_Part_27449_1364493560.1687186170813"

------=_Part_27449_1364493560.1687186170813
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Sorry, I forgot to load the module, I have loaded now.

ubuntu@ubuntu:~/jailhouse$ sudo insmod driver/jailhouse.ko
ubuntu@ubuntu:~/jailhouse$ ls -l /dev/jailhouse
crw------- 1 root root 10, 59 Jun 19 14:45 /dev/jailhouse
ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi4.cell

*[ 4966.214157] jailhouse: request_mem_region failed for hypervisor=20
memory.JAILHOUSE_ENABLE: Invalid argument*
ubuntu@ubuntu:~/jailhouse$


I am getting the above error.

Regards,
Sai Krishna
On Monday, June 19, 2023 at 8:09:37=E2=80=AFPM UTC+5:30 Ralf Ramsauer wrote=
:

>
>
> On 19/06/2023 16:23, sai krishna Allu wrote:
> > Hi Ralf,
> >=20
> > I have downloaded the master branch and given make and I have got the=
=20
> > following error, I fixed the error with one of the reference link, but=
=20
> > didn't find the /dev/jailhouse post installation
> >=20
> > ubuntu@ubuntu:~/jailhouse$ git branch
> > * master
> > ubuntu@ubuntu:~/jailhouse$make
> > ...
> > ...
> > ...
> >   CC      /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.o
> >   OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.cell
> >   DTC     /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.d=
tb
> > */home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:=
=20
> > error: no include path in which to search for=20
> > dt-bindings/interrupt-controller/arm-gic.h
> >    17 | #include <dt-bindings/interrupt-controller/arm-gic.h>*
> >       |                                                      ^
> > make[3]: *** [scripts/Makefile.lib:286:=20
> > /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error =
1
> > make[2]: *** [scripts/Makefile.build:519:=20
> > /home/ubuntu/jailhouse/configs] Error 2
> > make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2
> > make: *** [Makefile:40: modules] Error 2
> > ubuntu@ubuntu:~/jailhouse$
> >=20
> > To fix the above I have followed the link=20
> > https://bbs.csdn.net/topics/615205697 and changed as per instruction,=
=20
> > even I followed the earlier build from this link only. but I was not=20
> > able to build jailhouse-image.
>
> Ok, perfect.
>
> >=20
> >=20
> > DTC_INCLUDE    +=3D /usr/src/linux-headers-5.4.0-1069-raspi/include add=
ed=20
> > in the file=20
> -->/usr/src/linux-headers-5.4.0-1011-raspi/scripts/Makefile.lib
> >=20
> > After that I am able to install,
> >=20
> > ubuntu@ubuntu:~/jailhouse$ sudo make install
> >   Building modules, stage 2.
> >   MODPOST 1 modules
> >   INSTALL /home/ubuntu/jailhouse/driver/jailhouse.ko
> > At main.c:160:
> > - SSL error:02001002:system library:fopen:No such file or directory:=20
> > ../crypto/bio/bss_file.c:69
> > - SSL error:2006D080:BIO routines:BIO_new_file:no such file:=20
> > ../crypto/bio/bss_file.c:76
> > sign-file: certs/signing_key.pem: No such file or directory
> >   DEPMOD  5.4.0-1069-raspi
> > Warning: modules_install: missing 'System.map' file. Skipping depmod.
> > install -m 644 hypervisor/jailhouse*.bin /lib/firmware
> > install -d -m 755 /usr/local/libexec/jailhouse
> > install -m 644 inmates/tools/arm64/*.bin /usr/local/libexec/jailhouse
> > install jailhouse demos/ivshmem-demo /usr/local/sbin
> > install jailhouse-config-collect jailhouse-cell-linux=20
> > jailhouse-cell-stats jailhouse-config-create jailhouse-config-check=20
> > jailhouse-hardware-check /usr/local/libexec/jailhouse
> > install -d -m 755 /usr/local/share/jailhouse
> > install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.tmpl=20
> > /usr/local/share/jailhouse
> > install -m 644 jailhouse-completion.bash=20
> > /usr/share/bash-completion/completions/jailhouse
> > install -d -m 755 /usr/local/share/man/man8
> > install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-enable.8=20
> > /usr/local/share/man/man8
> > python3 -m pip install --upgrade --force-reinstall  .
> > Processing /home/ubuntu/jailhouse
> > Building wheels for collected packages: pyjailhouse
> >   Building wheel for pyjailhouse (setup.py) ... done
> >   Created wheel for pyjailhouse:=20
> > filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D22795=20
> > sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021a3853=
bb
> >   Stored in directory:=20
> >=20
> /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a3693d675b8bd9=
bcdcb021956f8d467789b3be58740
> > Successfully built pyjailhouse
> > Installing collected packages: pyjailhouse
> > Successfully installed pyjailhouse-0.12
> > ubuntu@ubuntu:~/jailhouse$
> >=20
> > *but not able to get jailhouse in dev file.*
>
> Yeah, you need to load the jailhouse module first:
>
> insmod drivers/jailhouse.ko
> or
> modprobe jailhouse
>
> Thanks
> Ralf
>
> >=20
> > ubuntu@ubuntu:~/jailhouse$*ls -l /dev/jailhouse*
> > *ls: cannot access '/dev/jailhouse': No such file or directory*
> > ubuntu@ubuntu:~/jailhouse$
> >=20
> > Please suggest the correct way to install or anything else I need to=20
> > change or need to follow different steps to fix this issue to get the=
=20
> > installation success.
> >=20
> > Regards,
> > Sai Krishna
> >=20
> > On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsauer w=
rote:
> >=20
> >=20
> >=20
> > On 19/06/2023 12:23, sai krishna Allu wrote:
> > > Hi Ralf,
> > >
> > > I have attached the hypervisor.o and I have taken the dump of
> > that which
> > > is also attached too.
> > > I have below command to extract, let me know is it ok or not.
> > >
> > > ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d
> > > jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
> > >
> > > ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep "ffffc0203820"
> > > *3338    ffffc0203820:       f9400282        ldr     x2, [x20]*
> > > ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
> > >       patch+0x218>
> > >  3334     ffffc0203810:       f9400282        ldr     x2, [x20]
> > >  3335     ffffc0203814:       f9400842        ldr     x2, [x2, #16]
> > >  3336     ffffc0203818:       8a130042        and     x2, x2, x19
> > >  3337     ffffc020381c:       f90a4002        str     x2, [x0,
> > #5248]
> > > * 3338     ffffc0203820:       f9400282        ldr     x2, [x20]*
> > >  3339     ffffc0203824:       f9400c42        ldr     x2, [x2, #24]
> > >  3340     ffffc0203828:       8a130053        and     x19, x2, x19
> > >  3341     ffffc020382c:       52800022        mov     w2, #0x1
> > >
> > > The instruction at ffffc0203820 means it Load x2 from contents of
> > x20
> > > register.
> > > Please suggest how to fix this.
> >=20
> > Keep calm, I'm still trying to figure out where the problem exactly is.
> >=20
> > Now I know the line of code, where the exception exactly happens. It's
> > in hypervisor/arch/arm-common/psci.c:39
> >=20
> > ldr x2, [x20] <- Here we likely load ctx->regs[2], and the only variant
> > how this could fail is that ctx points to somewhere. Here we're inside
> > the routine psci_emulate_cpu_on, which shouldn't even be called when
> > enabling the hypervisor. I don't know yet what could be the issue.
> >=20
> > Before we keep on debugging: I saw that you use Jailhouse v0.12.
> >=20
> > Could you please switch to the master and/or next branch of jailhouse,
> > and see if the error still occurs there?
> >=20
> > Thanks,
> > Ralf
> >=20
> > >
> > > Regards,
> > > Sai Krishna
> > >
> > > On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf Ramsau=
er
> > wrote:
> > >
> > > Hi,
> > >
> > > On 15/06/2023 10:11, sai krishna Allu wrote:
> > > > Hi Team,
> > > >
> > > > I have Raspberry Pi 4, which is installed with Ubuntu 20.04.5 LTS
> > > 64 bit.
> > > > after loading the jailhouse.ko file, when I gave following
> > > command I am
> > > > getting the exception.
> > > >
> > > > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
> > > configs/arm64/rpi4.cell
> > > >
> > > > Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
> > > > Code location: 0x0000ffffc0200800
> > > > Page pool usage after early setup: mem 39/994, remap 0/131072
> > > > Initializing processors:
> > > >  CPU 0...
> > > > FATAL: Unhandled HYP exception: synchronous abort from EL2
> > >
> > > Synchronous abort from EL2 means that we have a fatal error inside
> > > Jailhouse (e.g., segfault).
> > >
> > > >  pc: 0000ffffc0203820   lr: 0000ffffc020380c spsr: 800003c9=20
> > EL2
> > >
> > > Could you please disassemble your hypervisor binary, and see
> > where the
> > > exception exactly occurs? Do this with:
> > >
> > > aarch64-objdump -d hypervisor/hypervisor.o
> > >
> > > And see what code executes behind 0x0000ffffc0203820. Alternatively,
> > > you
> > > can also attach the hypervisor.o.
> > >
> > > Thanks,
> > > Ralf
> > >
> > > >  sp: 0000ffffc021ee40  esr: 00 1 0000000
> > > >  x0: 0000000084000000   x1: 0000000000000008   x2:
> > 0000000080003580
> > > >  x3: 0000ffffc020e170   x4: 0000000000000014   x5:
> > 000003ffffffffff
> > > >  x6: 0000000000000029   x7: 0000ffffc0219d30   x8:
> > 000000000000002a
> > > >  x9: 0000000000000000  x10: 0000000000000000  x11:
> > 0000000000000001
> > > > x12: 0000000000000015  x13: 0000000000000001  x14:
> > 0000ffffc0219000
> > > > x15: 0000ffffc0015040  x16: 0000ffffc020d1fc  x17:
> > ffffbcae22826688
> > > > x18: 0000000000000001  x19: 0000ffffc021e000  x20:
> > 0000ffffc0219000
> > > > x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23:
> > 0000000000000000
> > > > x24: 0000000000000001  x25: 0000ffffc021e000  x26:
> > 0000ffffc021f000
> > > > x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29:
> > 0000ffffc021ee40
> > > >
> > > > Hypervisor stack before exception Stopping CPU 0 (Cell:
> > > "Raspberry-Pi4")
> > > >
> > > >
> > > > Please suggest how to fix this problem.
> > > >
> > > > Regards,
> > > > Sai Krishna
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google
> > > > Groups "Jailhouse" group.
> > > > To unsubscribe from this group and stop receiving emails from it,
> > > send
> > > > an email to jailhouse-de...@googlegroups.com
> > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > To view this discussion on the web visit
> > > >
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>>.
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
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%40googlegroups.com.

------=_Part_27449_1364493560.1687186170813
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,<div><br /></div><div>Sorry, I forgot to load the module, I have lo=
aded now.</div><div><br /></div><div>ubuntu@ubuntu:~/jailhouse$ sudo insmod=
 driver/jailhouse.ko<br />ubuntu@ubuntu:~/jailhouse$ ls -l /dev/jailhouse<b=
r />crw------- 1 root root 10, 59 Jun 19 14:45 /dev/jailhouse<br />ubuntu@u=
buntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi4.cell<br /><b>[ =
4966.214157] jailhouse: request_mem_region failed for hypervisor memory.<br=
 />JAILHOUSE_ENABLE: Invalid argument</b><br />ubuntu@ubuntu:~/jailhouse$<b=
r /><div><br /></div></div><div><br /></div><div>I am getting the above err=
or.<br /><br />Regards,</div><div>Sai Krishna</div><div class=3D"gmail_quot=
e"><div dir=3D"auto" class=3D"gmail_attr">On Monday, June 19, 2023 at 8:09:=
37=E2=80=AFPM UTC+5:30 Ralf Ramsauer wrote:<br/></div><blockquote class=3D"=
gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">
<br>
<br>On 19/06/2023 16:23, sai krishna Allu wrote:
<br>&gt; Hi Ralf,
<br>&gt;=20
<br>&gt; I have downloaded the master branch and given make and I have got =
the=20
<br>&gt; following error, I fixed the error with one of the reference link,=
 but=20
<br>&gt; didn&#39;t find the /dev/jailhouse post installation
<br>&gt;=20
<br>&gt; ubuntu@ubuntu:~/jailhouse$ git branch
<br>&gt; * master
<br>&gt; ubuntu@ubuntu:~/jailhouse$make
<br>&gt; ...
<br>&gt; ...
<br>&gt; ...
<br>&gt;  =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ubuntu/jailhouse/configs/arm6=
4/zynqmp-zcu102.o
<br>&gt;  =C2=A0 OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102=
.cell
<br>&gt;  =C2=A0 DTC =C2=A0 =C2=A0 /home/ubuntu/jailhouse/configs/arm64/dts=
/inmate-amd-seattle.dtb
<br>&gt; */home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:1=
7:54:=20
<br>&gt; error: no include path in which to search for=20
<br>&gt; dt-bindings/interrupt-controller/arm-gic.h
<br>&gt;  =C2=A0 =C2=A017 | #include &lt;dt-bindings/interrupt-controller/a=
rm-gic.h&gt;*
<br>&gt;  =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^
<br>&gt; make[3]: *** [scripts/Makefile.lib:286:=20
<br>&gt; /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] E=
rror 1
<br>&gt; make[2]: *** [scripts/Makefile.build:519:=20
<br>&gt; /home/ubuntu/jailhouse/configs] Error 2
<br>&gt; make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2
<br>&gt; make: *** [Makefile:40: modules] Error 2
<br>&gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;=20
<br>&gt; To fix the above I have followed the link=20
<br>&gt; <a href=3D"https://bbs.csdn.net/topics/615205697" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://bbs.csdn.net/topics/615205697&amp;source=3Dgmail&amp;ust=
=3D1687272465119000&amp;usg=3DAOvVaw2odpsnSRkkTEHStj_v1Q-8">https://bbs.csd=
n.net/topics/615205697</a> and changed as per instruction,=20
<br>&gt; even I followed the earlier build from this link only. but I was n=
ot=20
<br>&gt; able to build jailhouse-image.
<br>
<br>Ok, perfect.
<br>
<br>&gt;=20
<br>&gt;=20
<br>&gt; DTC_INCLUDE =C2=A0 =C2=A0+=3D /usr/src/linux-headers-5.4.0-1069-ra=
spi/include added=20
<br>&gt; in the file --&gt;/usr/src/linux-headers-5.4.0-1011-raspi/scripts/=
Makefile.lib
<br>&gt;=20
<br>&gt; After that I am able to install,
<br>&gt;=20
<br>&gt; ubuntu@ubuntu:~/jailhouse$ sudo make install
<br>&gt;  =C2=A0 Building modules, stage 2.
<br>&gt;  =C2=A0 MODPOST 1 modules
<br>&gt;  =C2=A0 INSTALL /home/ubuntu/jailhouse/driver/jailhouse.ko
<br>&gt; At main.c:160:
<br>&gt; - SSL error:02001002:system library:fopen:No such file or director=
y:=20
<br>&gt; ../crypto/bio/bss_file.c:69
<br>&gt; - SSL error:2006D080:BIO routines:BIO_new_file:no such file:=20
<br>&gt; ../crypto/bio/bss_file.c:76
<br>&gt; sign-file: certs/signing_key.pem: No such file or directory
<br>&gt;  =C2=A0 DEPMOD =C2=A05.4.0-1069-raspi
<br>&gt; Warning: modules_install: missing &#39;System.map&#39; file. Skipp=
ing depmod.
<br>&gt; install -m 644 hypervisor/jailhouse*.bin /lib/firmware
<br>&gt; install -d -m 755 /usr/local/libexec/jailhouse
<br>&gt; install -m 644 inmates/tools/arm64/*.bin /usr/local/libexec/jailho=
use
<br>&gt; install jailhouse demos/ivshmem-demo /usr/local/sbin
<br>&gt; install jailhouse-config-collect jailhouse-cell-linux=20
<br>&gt; jailhouse-cell-stats jailhouse-config-create jailhouse-config-chec=
k=20
<br>&gt; jailhouse-hardware-check /usr/local/libexec/jailhouse
<br>&gt; install -d -m 755 /usr/local/share/jailhouse
<br>&gt; install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.tm=
pl=20
<br>&gt; /usr/local/share/jailhouse
<br>&gt; install -m 644 jailhouse-completion.bash=20
<br>&gt; /usr/share/bash-completion/completions/jailhouse
<br>&gt; install -d -m 755 /usr/local/share/man/man8
<br>&gt; install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-enable.8=20
<br>&gt; /usr/local/share/man/man8
<br>&gt; python3 -m pip install --upgrade --force-reinstall =C2=A0.
<br>&gt; Processing /home/ubuntu/jailhouse
<br>&gt; Building wheels for collected packages: pyjailhouse
<br>&gt;  =C2=A0 Building wheel for pyjailhouse (setup.py) ... done
<br>&gt;  =C2=A0 Created wheel for pyjailhouse:=20
<br>&gt; filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D22795=20
<br>&gt; sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021=
a3853bb
<br>&gt;  =C2=A0 Stored in directory:=20
<br>&gt; /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a3693d6=
75b8bd9bcdcb021956f8d467789b3be58740
<br>&gt; Successfully built pyjailhouse
<br>&gt; Installing collected packages: pyjailhouse
<br>&gt; Successfully installed pyjailhouse-0.12
<br>&gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;=20
<br>&gt; *but not able to get jailhouse in dev file.*
<br>
<br>Yeah, you need to load the jailhouse module first:
<br>
<br>insmod drivers/jailhouse.ko
<br>or
<br>modprobe jailhouse
<br>
<br>Thanks
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; ubuntu@ubuntu:~/jailhouse$*ls -l /dev/jailhouse*
<br>&gt; *ls: cannot access &#39;/dev/jailhouse&#39;: No such file or direc=
tory*
<br>&gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;=20
<br>&gt; Please suggest the correct way to install or anything else I need =
to=20
<br>&gt; change or need to follow different steps to fix this issue to get =
the=20
<br>&gt; installation success.
<br>&gt;=20
<br>&gt; Regards,
<br>&gt; Sai Krishna
<br>&gt;=20
<br>&gt; On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsa=
uer wrote:
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;     On 19/06/2023 12:23, sai krishna Allu wrote:
<br>&gt;      &gt; Hi Ralf,
<br>&gt;      &gt;
<br>&gt;      &gt; I have attached the hypervisor.o and I have taken the du=
mp of
<br>&gt;     that which
<br>&gt;      &gt; is also attached too.
<br>&gt;      &gt; I have below command to extract, let me know is it ok or=
 not.
<br>&gt;      &gt;
<br>&gt;      &gt; ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d
<br>&gt;      &gt; jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.tx=
t
<br>&gt;      &gt;
<br>&gt;      &gt; ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep &quot;=
ffffc0203820&quot;
<br>&gt;      &gt; *3338 =C2=A0 =C2=A0ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9=
400282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
<br>&gt;      &gt; ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
<br>&gt;      &gt; =C2=A0 =C2=A0 =C2=A0 patch+0x218&gt;
<br>&gt;      &gt; =C2=A03334 =C2=A0 =C2=A0 ffffc0203810: =C2=A0 =C2=A0 =C2=
=A0 f9400282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]
<br>&gt;      &gt; =C2=A03335 =C2=A0 =C2=A0 ffffc0203814: =C2=A0 =C2=A0 =C2=
=A0 f9400842 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #16]
<br>&gt;      &gt; =C2=A03336 =C2=A0 =C2=A0 ffffc0203818: =C2=A0 =C2=A0 =C2=
=A0 8a130042 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x2, x2, x19
<br>&gt;      &gt; =C2=A03337 =C2=A0 =C2=A0 ffffc020381c: =C2=A0 =C2=A0 =C2=
=A0 f90a4002 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 x2, [x0,
<br>&gt;     #5248]
<br>&gt;      &gt; *=C2=A03338 =C2=A0 =C2=A0 ffffc0203820: =C2=A0 =C2=A0 =
=C2=A0 f9400282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
<br>&gt;      &gt; =C2=A03339 =C2=A0 =C2=A0 ffffc0203824: =C2=A0 =C2=A0 =C2=
=A0 f9400c42 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #24]
<br>&gt;      &gt; =C2=A03340 =C2=A0 =C2=A0 ffffc0203828: =C2=A0 =C2=A0 =C2=
=A0 8a130053 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x19, x2, x19
<br>&gt;      &gt; =C2=A03341 =C2=A0 =C2=A0 ffffc020382c: =C2=A0 =C2=A0 =C2=
=A0 52800022 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 w2, #0x1
<br>&gt;      &gt;
<br>&gt;      &gt; The instruction at=C2=A0ffffc0203820=C2=A0means it Load =
x2 from contents of
<br>&gt;     x20
<br>&gt;      &gt; register.
<br>&gt;      &gt; Please suggest how to fix this.
<br>&gt;=20
<br>&gt;     Keep calm, I&#39;m still trying to figure out where the proble=
m exactly is.
<br>&gt;=20
<br>&gt;     Now I know the line of code, where the exception exactly happe=
ns. It&#39;s
<br>&gt;     in hypervisor/arch/arm-common/psci.c:39
<br>&gt;=20
<br>&gt;     ldr x2, [x20] &lt;- Here we likely load ctx-&gt;regs[2], and t=
he only variant
<br>&gt;     how this could fail is that ctx points to somewhere. Here we&#=
39;re inside
<br>&gt;     the routine psci_emulate_cpu_on, which shouldn&#39;t even be c=
alled when
<br>&gt;     enabling the hypervisor. I don&#39;t know yet what could be th=
e issue.
<br>&gt;=20
<br>&gt;     Before we keep on debugging: I saw that you use Jailhouse v0.1=
2.
<br>&gt;=20
<br>&gt;     Could you please switch to the master and/or next branch of ja=
ilhouse,
<br>&gt;     and see if the error still occurs there?
<br>&gt;=20
<br>&gt;     Thanks,
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Regards,
<br>&gt;      &gt; Sai Krishna
<br>&gt;      &gt;
<br>&gt;      &gt; On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:3=
0 Ralf Ramsauer
<br>&gt;     wrote:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; On 15/06/2023 10:11, sai krishna Allu wrote:
<br>&gt;      &gt; &gt; Hi Team,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I have=C2=A0Raspberry Pi 4, which is installed with=
 Ubuntu 20.04.5 LTS
<br>&gt;      &gt; 64 bit.
<br>&gt;      &gt; &gt; after loading the jailhouse.ko file, when I gave fo=
llowing
<br>&gt;      &gt; command I am
<br>&gt;      &gt; &gt; getting the exception.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
<br>&gt;      &gt; configs/arm64/rpi4.cell
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Initializing Jailhouse hypervisor v0.12 (0-g92db71f=
2) on CPU 0
<br>&gt;      &gt; &gt; Code location: 0x0000ffffc0200800
<br>&gt;      &gt; &gt; Page pool usage after early setup: mem 39/994, rema=
p 0/131072
<br>&gt;      &gt; &gt; Initializing processors:
<br>&gt;      &gt; &gt; =C2=A0CPU 0...
<br>&gt;      &gt; &gt; FATAL: Unhandled HYP exception: synchronous abort f=
rom EL2
<br>&gt;      &gt;
<br>&gt;      &gt; Synchronous abort from EL2 means that we have a fatal er=
ror inside
<br>&gt;      &gt; Jailhouse (e.g., segfault).
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffffc0203=
80c spsr: 800003c9   =20
<br>&gt;     EL2
<br>&gt;      &gt;
<br>&gt;      &gt; Could you please disassemble your hypervisor binary, and=
 see
<br>&gt;     where the
<br>&gt;      &gt; exception exactly occurs? Do this with:
<br>&gt;      &gt;
<br>&gt;      &gt; aarch64-objdump -d hypervisor/hypervisor.o
<br>&gt;      &gt;
<br>&gt;      &gt; And see what code executes behind 0x0000ffffc0203820. Al=
ternatively,
<br>&gt;      &gt; you
<br>&gt;      &gt; can also attach the hypervisor.o.
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks,
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 0000000
<br>&gt;      &gt; &gt; =C2=A0x0: 0000000084000000 =C2=A0 x1: 0000000000000=
008 =C2=A0 x2:
<br>&gt;     0000000080003580
<br>&gt;      &gt; &gt; =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 0000000000000=
014 =C2=A0 x5:
<br>&gt;     000003ffffffffff
<br>&gt;      &gt; &gt; =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffffc0219=
d30 =C2=A0 x8:
<br>&gt;     000000000000002a
<br>&gt;      &gt; &gt; =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000=
000 =C2=A0x11:
<br>&gt;     0000000000000001
<br>&gt;      &gt; &gt; x12: 0000000000000015 =C2=A0x13: 0000000000000001 =
=C2=A0x14:
<br>&gt;     0000ffffc0219000
<br>&gt;      &gt; &gt; x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =
=C2=A0x17:
<br>&gt;     ffffbcae22826688
<br>&gt;      &gt; &gt; x18: 0000000000000001 =C2=A0x19: 0000ffffc021e000 =
=C2=A0x20:
<br>&gt;     0000ffffc0219000
<br>&gt;      &gt; &gt; x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219000 =
=C2=A0x23:
<br>&gt;     0000000000000000
<br>&gt;      &gt; &gt; x24: 0000000000000001 =C2=A0x25: 0000ffffc021e000 =
=C2=A0x26:
<br>&gt;     0000ffffc021f000
<br>&gt;      &gt; &gt; x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218000 =
=C2=A0x29:
<br>&gt;     0000ffffc021ee40
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hypervisor stack before exception Stopping CPU 0 (C=
ell:
<br>&gt;      &gt; &quot;Raspberry-Pi4&quot;)
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Please suggest how to fix this problem.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Regards,
<br>&gt;      &gt; &gt; Sai Krishna
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; --
<br>&gt;      &gt; &gt; You received this message because you are subscribe=
d to the Google
<br>&gt;      &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; To unsubscribe from this group and stop receiving e=
mails from it,
<br>&gt;      &gt; send
<br>&gt;      &gt; &gt; an email to <a href data-email-masked rel=3D"nofoll=
ow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollo=
w">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687272=
465119000&amp;usg=3DAOvVaw3S1SevoNl35LRo0Os0Kc4Y">https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687272=
465119000&amp;usg=3DAOvVaw3S1SevoNl35LRo0Os0Kc4Y">https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4d=
a0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D168=
7272465119000&amp;usg=3DAOvVaw3S1SevoNl35LRo0Os0Kc4Y">https://groups.google=
.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4d=
a0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D168=
7272465119000&amp;usg=3DAOvVaw3S1SevoNl35LRo0Os0Kc4Y">https://groups.google=
.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1687272465119000&amp;usg=3DAOvVaw3KMweIoOnpqmolQl9GQ6xJ">http=
s://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b=
76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-=
4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D168727246=
5119000&amp;usg=3DAOvVaw3KMweIoOnpqmolQl9GQ6xJ">https://groups.google.com/d=
/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76=
300n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f=
38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687272465119000&amp;usg=3D=
AOvVaw3KMweIoOnpqmolQl9GQ6xJ">https://groups.google.com/d/msgid/jailhouse-d=
ev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a=
0b76300n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1687272465119000&amp;usg=3DAOvVaw3KMweIoOnpqmolQl9=
GQ6xJ">https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
oter</a>&gt;&gt;&gt;.
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bda=
a1499-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a=
59d-812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687272=
465120000&amp;usg=3DAOvVaw1uPFRI0JR3zkknIEtTXqbh">https://groups.google.com=
/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bda=
a1499-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a=
59d-812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687272=
465120000&amp;usg=3DAOvVaw1uPFRI0JR3zkknIEtTXqbh">https://groups.google.com=
/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1687272465120000&amp;usg=3DAOvVaw1hWPRziQOKtKNYGAjKPmCY">https://grou=
ps.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59=
d-812557f8162an%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/bdaa1499-4532-423f-a59d-812557f8162an%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687272465120000&=
amp;usg=3DAOvVaw1hWPRziQOKtKNYGAjKPmCY">https://groups.google.com/d/msgid/j=
ailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/60a06af=
d-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-=
d61d8ebeb141n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16872724651=
20000&amp;usg=3DAOvVaw1VhYhVN9JZUGypBvfczpes">https://groups.google.com/d/m=
sgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/60a06af=
d-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
687272465120000&amp;usg=3DAOvVaw2T-IY-hG4O9KJucPHn09qU">https://groups.goog=
le.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40google=
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
om/d/msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%40googlegroups.co=
m</a>.<br />

------=_Part_27449_1364493560.1687186170813--

------=_Part_27448_1289545135.1687186170813--
