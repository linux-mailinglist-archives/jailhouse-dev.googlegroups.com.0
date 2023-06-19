Return-Path: <jailhouse-dev+bncBD65FYEH6ABBBPN3YKSAMGQEQMWM3NQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id D5047735D76
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 20:26:07 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-bcef239a9fbsf9849407276.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687199166; x=1689791166;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijQlksacdVRBP1llzqfxt2WSj9OJ7a53zEIGjgKECcI=;
        b=P5UDc7LtQJsbPVAOQBYJn53xoZCjokiScm4717mQNnDsOcbIvkgS4m8UNbK/dqgy2j
         aJtLSKNwWv2QjoDpG/bahtznmtLAHA03ucK27PNLrsp+WlI5+e6Yuv0Uyq9lhgWnwqtM
         TDOF/qflTXkrkhbdAltbj5w+lcO4AL9z875BMaTR602kWMybaDBouQDxLcxOSrUAzy3z
         g4xEyXW/HkWwMhmwZE2OGAOCl7XKbxKD89L6hG5GW5qn8A4beRRvv4/ELVsKm3xllGzt
         KyB2aR4gazNR9rXuP6TlHy2YF99DXQsdowWR2qiBpr4ifDfXSFPeF5609jgghB4KM06v
         t8tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687199166; x=1689791166;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijQlksacdVRBP1llzqfxt2WSj9OJ7a53zEIGjgKECcI=;
        b=TOxplSn1btR+ZEEQcB1YbCQESQ+tYJtQlWL+8wSW1H3NhmQvHIHpFmO0dOFz6r1PIE
         JI/2pn/bX4UB2Xc/03kfj3XFAucye0rFt4VyknGgctUS69jLFQ5ta0z5fx2hjTqpcJ7G
         rgR63U7vfhysCOsJxLBcW+dOJ1W3H+ZCeTBU6XDelLhsVjHr54S72xRM/q/aHd9iGjmW
         RjY6hQYgJRF3tNhSkanXnzOSkCmeqS2NSqYtBpDKT/T5Kk2XGIUD1dRsvwXRSsdVH+1y
         OccgMHNhSH53L/hr4KFFyh0UndjV/Zu6T21OFQiloq4+xdOG43bd+cXv49Ce++PxG8ql
         zNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687199166; x=1689791166;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijQlksacdVRBP1llzqfxt2WSj9OJ7a53zEIGjgKECcI=;
        b=NMV+9AFRwsoEGHFPZdz2ef+AwyHfSaTPVGfwDe1E4dq04vAjiWI7zEomF/F5dKlqFv
         u/piDLxpTIhhmt23+8bk95H3FN+iAndpsKHQUx0OEUdx3dMd27pPUAMOIoFyLeWbEZKY
         ZTaaVlyQIaSSMkEzEl+NsHMA8WD+bzXriEJm+slhw+MeYsbMCiVna5b3r+1bkRJZlOS+
         qSfxv7wNCElNCC9Q5xCoXmUF6J+hNDPyJEZZ0oXGONwrrmV84eovR/34FloQ37ixjd/p
         fS00X9fS4aIss2Oif07K3cSsOxCuWYBDCI/fL4FgjctvL8Q+QbDHiKnl0AYLi+v7fRVf
         GIBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwNyUQO7lF8G4JKg/qsK7/PRL2nM6MPWFA4U/YTfhDj0T1njzq3
	ejzqtU0FuzJjVKQu29Ewybw=
X-Google-Smtp-Source: ACHHUZ64+X5j8fFatmcgRgUIv7wlfLRGzX7q7MPnzdStxsoWygV9696gF4HgVLrd7nhGDjG6VD5viA==
X-Received: by 2002:a25:188b:0:b0:bcf:e2a6:7085 with SMTP id 133-20020a25188b000000b00bcfe2a67085mr7650843yby.23.1687199166343;
        Mon, 19 Jun 2023 11:26:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:cac4:0:b0:bdd:85d:92e2 with SMTP id a187-20020a25cac4000000b00bdd085d92e2ls286940ybg.1.-pod-prod-07-us;
 Mon, 19 Jun 2023 11:26:05 -0700 (PDT)
X-Received: by 2002:a25:ad94:0:b0:ba6:e7ee:bb99 with SMTP id z20-20020a25ad94000000b00ba6e7eebb99mr3537949ybi.12.1687199164610;
        Mon, 19 Jun 2023 11:26:04 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:26:03 -0700 (PDT)
From: sai krishna Allu <saikrishna.allu@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <703038e6-c880-4f1c-b20c-3d06d7d5a852n@googlegroups.com>
In-Reply-To: <c439d69b-d40e-48aa-dd34-5b72f0ec9549@oth-regensburg.de>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
 <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
 <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
 <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
 <60a06afd-9ddd-4304-aee5-d61d8ebeb141n@googlegroups.com>
 <c7787605-7a3f-b392-f7e8-9fd10170ab57@oth-regensburg.de>
 <ff5f75fd-7b70-424a-ab0e-537d4242afffn@googlegroups.com>
 <c439d69b-d40e-48aa-dd34-5b72f0ec9549@oth-regensburg.de>
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14540_738870661.1687199163912"
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

------=_Part_14540_738870661.1687199163912
Content-Type: multipart/alternative; 
	boundary="----=_Part_14541_1760351767.1687199163912"

------=_Part_14541_1760351767.1687199163912
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

while building jailhouse-image for Raspberry Pi 4 I am getting following=20
error.

ubuntu@ubuntu:~/jailhouse-images$ ./kas-container menu
Unable to find image 'ghcr.io/siemens/kas/kas-isar:2.6.2' locally
2.6.2: Pulling from siemens/kas/kas-isar
02b45931a436: Pull complete
dcfd7acb405d: Pull complete
47e0d38ce80b: Pull complete
c666350ba0a8: Pull complete
09bc0d0edf48: Pull complete
63f9bdc9bba1: Pull complete
f9cf7793c177: Pull complete
9b2061fc2b0a: Pull complete
9502f2124a84: Pull complete
c92d8f8102d5: Pull complete
f527819c1742: Pull complete
Digest:=20
sha256:0efd35a3a595ce95e43662d6839ee542383e5b506bc9e73260d5b8bf7216ee04
Status: Downloaded newer image for ghcr.io/siemens/kas/kas-isar:2.6.2
2023-06-19 18:03:20 - INFO     - kas 2.6.2 started
2023-06-19 18:05:41 - INFO     - Saving configuration as /work/.config.yaml
2023-06-19 18:05:41 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-19 18:05:41 - INFO     - Using /repo as root for repository=20
jailhouse
2023-06-19 18:05:41 - INFO     - /work$ git clone -q=20
https://github.com/ilbers/isar /work/isar
2023-06-19 18:05:44 - INFO     - Repository isar cloned
2023-06-19 18:05:44 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-19 18:05:44 - INFO     - Using /repo as root for repository=20
jailhouse
2023-06-19 18:05:44 - INFO     - /work/isar$ git status -s
2023-06-19 18:05:44 - INFO     - /work/isar$ git rev-parse --verify -q=20
origin/5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-19 18:05:44 - INFO     - /work/isar$ git checkout -q=20
5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-19 18:05:45 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-19 18:05:45 - INFO     - Using /repo as root for repository=20
jailhouse
2023-06-19 18:05:45 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-19 18:05:45 - INFO     - Using /repo as root for repository=20
jailhouse
2023-06-19 18:05:45 - INFO     - /work/isar$ /tmp/tmpqebji13x/get_bb_env=20
/build
2023-06-19 18:05:45 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-19 18:05:45 - INFO     - Using /repo as root for repository=20
jailhouse
2023-06-19 18:05:45 - INFO     - /build$ /work/isar/bitbake/bin/bitbake -c=
=20
build mc:qemu-amd64-jailhouse-demo:demo-image=20
mc:rpi4-jailhouse-demo:demo-image
Parsing recipes: 100%=20
|##########################################################################=
###########################################################################=
##|=20
Time: 0:00:06
Parsing of 38 .bb files complete (0 cached, 38 parsed). 114 targets, 0=20
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100%=20
|##########################################################################=
##########################################################################|=
=20
Time: 0:00:03
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch:=20
Failed to fetch URL=20
https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84=
f6dee872cd9e553c9/tools/demos/ivshmem-demo.c;name=3Divshmem-demo,=20
attempting MIRRORS if available


















*ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch:=20
Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset=20
_PYTHON_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND=3D"oe-git-proxy"; expo=
rt=20
NO_PROXY=3D"*"; export=20
PATH=3D"/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbin:=
/bin";=20
export HOME=3D"/tmp/tmpp_e87orx"; /usr/bin/env wget -t 2 -T 30 --passive-ft=
p=20
--no-check-certificate -P /build/downloads=20
'https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e8=
4f6dee872cd9e553c9/tools/demos/ivshmem-demo.c'=20
--progress=3Ddot -v failed with exit code 4, output:--2023-06-19 18:08:47--=
=20
 https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e8=
4f6dee872cd9e553c9/tools/demos/ivshmem-demo.cResolving=20
raw.githubusercontent.com (raw.githubusercontent.com)... 49.44.79.236,=20
2405:200:1607:2820:41::36Connecting to raw.githubusercontent.com=20
(raw.githubusercontent.com)|49.44.79.236|:443... failed: Connection timed=
=20
out.Connecting to raw.githubusercontent.com=20
(raw.githubusercontent.com)|2405:200:1607:2820:41::36|:443... failed:=20
Cannot assign requested address.Retrying.--2023-06-19 18:09:18--  (try: 2)=
=20
 https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e8=
4f6dee872cd9e553c9/tools/demos/ivshmem-demo.cConnecting=20
to raw.githubusercontent.com=20
(raw.githubusercontent.com)|49.44.79.236|:443... failed: Connection timed=
=20
out.Connecting to raw.githubusercontent.com=20
(raw.githubusercontent.com)|2405:200:1607:2820:41::36|:443... failed:=20
Cannot assign requested address.Giving up.ERROR:=20
mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch: Fetcher=20
failure for URL:=20
'https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e8=
4f6dee872cd9e553c9/tools/demos/ivshmem-demo.c;name=3Divshmem-demo'.=20
Unable to fetch URL from any source.ERROR: Logfile of failure stored in:=20
/build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2021.02-r0/temp/log=
.do_fetch.7854ERROR:=20
Task=20
(mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-init=
ramfs_2021.02.bb:do_fetch)=20
failed with exit code '1'ERROR:=20
mc:rpi4-jailhouse-demo:jailhouse-jailhouse-rt-0.9999-next-r0 do_fetch:=20
Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset=20
_PYTHON_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND=3D"oe-git-proxy"; expo=
rt=20
NO_PROXY=3D"*"; export=20
PATH=3D"/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbin:=
/bin";=20
export HOME=3D"/tmp/tmpp_e87orx"; git -c core.fsyncobjectfiles=3D0 ls-remot=
e=20
git://github.com/siemens/jailhouse  failed with exit code 128,=20
output:2023/06/19 18:10:44 socat[7689] E connect(5, AF=3D2 20.207.73.82:941=
8,=20
16): Connection timed outfatal: Could not read from remote repository.*

Please make sure you have the correct access rights
and the repository exists.

ERROR: Logfile of failure stored in:=20
/build/tmp/work/jailhouse-demo-arm64/jailhouse-jailhouse-rt/0.9999-next-r0/=
temp/log.do_fetch.7453
ERROR: Task=20
(mc:rpi4-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_latest.=
bb:do_fetch)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 45 tasks of which 0 didn't need to be rerun=
=20
and 2 failed.

Summary: 2 tasks failed:
 =20
mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initr=
amfs_2021.02.bb:do_fetch
 =20
mc:rpi4-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_latest.b=
b:do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
2023-06-19 18:11:35 - ERROR    - Command returned non-zero exit status 1
ubuntu@ubuntu:~/jailhouse-images$=20

Is that timeout is occurring due to n/w issue or repo is not present, I am=
=20
not sure.

Regards,
Sai Krishna
On Monday, June 19, 2023 at 8:24:07=E2=80=AFPM UTC+5:30 Ralf Ramsauer wrote=
:

>
>
> On 19/06/2023 16:49, sai krishna Allu wrote:
> > Hi Ralf,
> >=20
> > Sorry, I forgot to load the module, I have loaded now.
> >=20
> > ubuntu@ubuntu:~/jailhouse$ sudo insmod driver/jailhouse.ko
> > ubuntu@ubuntu:~/jailhouse$ ls -l /dev/jailhouse
> > crw------- 1 root root 10, 59 Jun 19 14:45 /dev/jailhouse
> > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi4.cel=
l
> > *[ 4966.214157] jailhouse: request_mem_region failed for hypervisor=20
> memory.
>
> Okay. Interesting. I wonder why you didn't hit that error before.=20
> Jailhouse requires reserved memory where it, as well as inmates, reside.=
=20
> Linux must never claim those memory areas, hence you need to reserve=20
> that memory areas at boot time.
>
> See the comment in arch/arm64/rpi4.c:
> * Reservation via device tree: reg =3D <0x0 0x20000000 0x10000000>;
>
> Did you reserve memory in your device tree?
>
> I would recommend building a working image with jailhouse-images. There,=
=20
> are required patches and config tweaks are included out of the box.
>
>
> Ralf
>
> > JAILHOUSE_ENABLE: Invalid argument*
> > ubuntu@ubuntu:~/jailhouse$
> >=20
> >=20
> > I am getting the above error.
> >=20
> > Regards,
> > Sai Krishna
> > On Monday, June 19, 2023 at 8:09:37=E2=80=AFPM UTC+5:30 Ralf Ramsauer w=
rote:
> >=20
> >=20
> >=20
> > On 19/06/2023 16:23, sai krishna Allu wrote:
> > > Hi Ralf,
> > >
> > > I have downloaded the master branch and given make and I have got
> > the
> > > following error, I fixed the error with one of the reference
> > link, but
> > > didn't find the /dev/jailhouse post installation
> > >
> > > ubuntu@ubuntu:~/jailhouse$ git branch
> > > * master
> > > ubuntu@ubuntu:~/jailhouse$make
> > > ...
> > > ...
> > > ...
> > >   CC      /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.o
> > >   OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.cell
> > >   DTC=20
> > /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb
> > >
> > */home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:
> > > error: no include path in which to search for
> > > dt-bindings/interrupt-controller/arm-gic.h
> > >    17 | #include <dt-bindings/interrupt-controller/arm-gic.h>*
> > >       |                                                      ^
> > > make[3]: *** [scripts/Makefile.lib:286:
> > > /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb]
> > Error 1
> > > make[2]: *** [scripts/Makefile.build:519:
> > > /home/ubuntu/jailhouse/configs] Error 2
> > > make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2
> > > make: *** [Makefile:40: modules] Error 2
> > > ubuntu@ubuntu:~/jailhouse$
> > >
> > > To fix the above I have followed the link
> > > https://bbs.csdn.net/topics/615205697
> > <https://bbs.csdn.net/topics/615205697> and changed as per instruction,
> > > even I followed the earlier build from this link only. but I was not
> > > able to build jailhouse-image.
> >=20
> > Ok, perfect.
> >=20
> > >
> > >
> > > DTC_INCLUDE    +=3D /usr/src/linux-headers-5.4.0-1069-raspi/include
> > added
> > > in the file
> > -->/usr/src/linux-headers-5.4.0-1011-raspi/scripts/Makefile.lib
> > >
> > > After that I am able to install,
> > >
> > > ubuntu@ubuntu:~/jailhouse$ sudo make install
> > >   Building modules, stage 2.
> > >   MODPOST 1 modules
> > >   INSTALL /home/ubuntu/jailhouse/driver/jailhouse.ko
> > > At main.c:160:
> > > - SSL error:02001002:system library:fopen:No such file or directory:
> > > ../crypto/bio/bss_file.c:69
> > > - SSL error:2006D080:BIO routines:BIO_new_file:no such file:
> > > ../crypto/bio/bss_file.c:76
> > > sign-file: certs/signing_key.pem: No such file or directory
> > >   DEPMOD  5.4.0-1069-raspi
> > > Warning: modules_install: missing 'System.map' file. Skipping
> > depmod.
> > > install -m 644 hypervisor/jailhouse*.bin /lib/firmware
> > > install -d -m 755 /usr/local/libexec/jailhouse
> > > install -m 644 inmates/tools/arm64/*.bin
> > /usr/local/libexec/jailhouse
> > > install jailhouse demos/ivshmem-demo /usr/local/sbin
> > > install jailhouse-config-collect jailhouse-cell-linux
> > > jailhouse-cell-stats jailhouse-config-create jailhouse-config-check
> > > jailhouse-hardware-check /usr/local/libexec/jailhouse
> > > install -d -m 755 /usr/local/share/jailhouse
> > > install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.tmpl
> > > /usr/local/share/jailhouse
> > > install -m 644 jailhouse-completion.bash
> > > /usr/share/bash-completion/completions/jailhouse
> > > install -d -m 755 /usr/local/share/man/man8
> > > install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-enable.8
> > > /usr/local/share/man/man8
> > > python3 -m pip install --upgrade --force-reinstall  .
> > > Processing /home/ubuntu/jailhouse
> > > Building wheels for collected packages: pyjailhouse
> > >   Building wheel for pyjailhouse (setup.py) ... done
> > >   Created wheel for pyjailhouse:
> > > filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D22795
> > >
> > sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021a3853=
bb
> > >   Stored in directory:
> > >
> >=20
> /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a3693d675b8bd9=
bcdcb021956f8d467789b3be58740
> > > Successfully built pyjailhouse
> > > Installing collected packages: pyjailhouse
> > > Successfully installed pyjailhouse-0.12
> > > ubuntu@ubuntu:~/jailhouse$
> > >
> > > *but not able to get jailhouse in dev file.*
> >=20
> > Yeah, you need to load the jailhouse module first:
> >=20
> > insmod drivers/jailhouse.ko
> > or
> > modprobe jailhouse
> >=20
> > Thanks
> > Ralf
> >=20
> > >
> > > ubuntu@ubuntu:~/jailhouse$*ls -l /dev/jailhouse*
> > > *ls: cannot access '/dev/jailhouse': No such file or directory*
> > > ubuntu@ubuntu:~/jailhouse$
> > >
> > > Please suggest the correct way to install or anything else I need to
> > > change or need to follow different steps to fix this issue to get
> > the
> > > installation success.
> > >
> > > Regards,
> > > Sai Krishna
> > >
> > > On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsauer=
 wrote:
> > >
> > >
> > >
> > > On 19/06/2023 12:23, sai krishna Allu wrote:
> > > > Hi Ralf,
> > > >
> > > > I have attached the hypervisor.o and I have taken the dump of
> > > that which
> > > > is also attached too.
> > > > I have below command to extract, let me know is it ok or not.
> > > >
> > > > ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d
> > > > jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
> > > >
> > > > ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep "ffffc0203820"
> > > > *3338    ffffc0203820:       f9400282        ldr     x2, [x20]*
> > > > ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
> > > >       patch+0x218>
> > > >  3334     ffffc0203810:       f9400282        ldr     x2, [x20]
> > > >  3335     ffffc0203814:       f9400842        ldr     x2, [x2,
> > #16]
> > > >  3336     ffffc0203818:       8a130042        and     x2, x2, x19
> > > >  3337     ffffc020381c:       f90a4002        str     x2, [x0,
> > > #5248]
> > > > * 3338     ffffc0203820:       f9400282        ldr     x2, [x20]*
> > > >  3339     ffffc0203824:       f9400c42        ldr     x2, [x2,
> > #24]
> > > >  3340     ffffc0203828:       8a130053        and     x19, x2, x19
> > > >  3341     ffffc020382c:       52800022        mov     w2, #0x1
> > > >
> > > > The instruction at ffffc0203820 means it Load x2 from contents of
> > > x20
> > > > register.
> > > > Please suggest how to fix this.
> > >
> > > Keep calm, I'm still trying to figure out where the problem
> > exactly is.
> > >
> > > Now I know the line of code, where the exception exactly happens.
> > It's
> > > in hypervisor/arch/arm-common/psci.c:39
> > >
> > > ldr x2, [x20] <- Here we likely load ctx->regs[2], and the only
> > variant
> > > how this could fail is that ctx points to somewhere. Here we're
> > inside
> > > the routine psci_emulate_cpu_on, which shouldn't even be called when
> > > enabling the hypervisor. I don't know yet what could be the issue.
> > >
> > > Before we keep on debugging: I saw that you use Jailhouse v0.12.
> > >
> > > Could you please switch to the master and/or next branch of
> > jailhouse,
> > > and see if the error still occurs there?
> > >
> > > Thanks,
> > > Ralf
> > >
> > > >
> > > > Regards,
> > > > Sai Krishna
> > > >
> > > > On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf Rams=
auer
> > > wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 15/06/2023 10:11, sai krishna Allu wrote:
> > > > > Hi Team,
> > > > >
> > > > > I have Raspberry Pi 4, which is installed with Ubuntu 20.04.5
> > LTS
> > > > 64 bit.
> > > > > after loading the jailhouse.ko file, when I gave following
> > > > command I am
> > > > > getting the exception.
> > > > >
> > > > > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
> > > > configs/arm64/rpi4.cell
> > > > >
> > > > > Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
> > > > > Code location: 0x0000ffffc0200800
> > > > > Page pool usage after early setup: mem 39/994, remap 0/131072
> > > > > Initializing processors:
> > > > >  CPU 0...
> > > > > FATAL: Unhandled HYP exception: synchronous abort from EL2
> > > >
> > > > Synchronous abort from EL2 means that we have a fatal error inside
> > > > Jailhouse (e.g., segfault).
> > > >
> > > > >  pc: 0000ffffc0203820   lr: 0000ffffc020380c spsr: 800003c9
> > > EL2
> > > >
> > > > Could you please disassemble your hypervisor binary, and see
> > > where the
> > > > exception exactly occurs? Do this with:
> > > >
> > > > aarch64-objdump -d hypervisor/hypervisor.o
> > > >
> > > > And see what code executes behind 0x0000ffffc0203820.
> > Alternatively,
> > > > you
> > > > can also attach the hypervisor.o.
> > > >
> > > > Thanks,
> > > > Ralf
> > > >
> > > > >  sp: 0000ffffc021ee40  esr: 00 1 0000000
> > > > >  x0: 0000000084000000   x1: 0000000000000008   x2:
> > > 0000000080003580
> > > > >  x3: 0000ffffc020e170   x4: 0000000000000014   x5:
> > > 000003ffffffffff
> > > > >  x6: 0000000000000029   x7: 0000ffffc0219d30   x8:
> > > 000000000000002a
> > > > >  x9: 0000000000000000  x10: 0000000000000000  x11:
> > > 0000000000000001
> > > > > x12: 0000000000000015  x13: 0000000000000001  x14:
> > > 0000ffffc0219000
> > > > > x15: 0000ffffc0015040  x16: 0000ffffc020d1fc  x17:
> > > ffffbcae22826688
> > > > > x18: 0000000000000001  x19: 0000ffffc021e000  x20:
> > > 0000ffffc0219000
> > > > > x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23:
> > > 0000000000000000
> > > > > x24: 0000000000000001  x25: 0000ffffc021e000  x26:
> > > 0000ffffc021f000
> > > > > x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29:
> > > 0000ffffc021ee40
> > > > >
> > > > > Hypervisor stack before exception Stopping CPU 0 (Cell:
> > > > "Raspberry-Pi4")
> > > > >
> > > > >
> > > > > Please suggest how to fix this problem.
> > > > >
> > > > > Regards,
> > > > > Sai Krishna
> > > > >
> > > > > --
> > > > > You received this message because you are subscribed to the
> > Google
> > > > > Groups "Jailhouse" group.
> > > > > To unsubscribe from this group and stop receiving emails from
> > it,
> > > > send
> > > > > an email to jailhouse-de...@googlegroups.com
> > > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > > To view this discussion on the web visit
> > > > >
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
093a0b76300n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com>>>=20
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
093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>=20
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
> >>>>.
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
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d=
61d8ebeb141n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-5=
37d4242afffn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-5=
37d4242afffn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/703038e6-c880-4f1c-b20c-3d06d7d5a852n%40googlegroups.com.

------=_Part_14541_1760351767.1687199163912
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,<div><br /></div><div>while building jailhouse-image for Raspberry =
Pi 4 I am getting following error.</div><div><br /></div><div>ubuntu@ubuntu=
:~/jailhouse-images$ ./kas-container menu<br />Unable to find image 'ghcr.i=
o/siemens/kas/kas-isar:2.6.2' locally<br />2.6.2: Pulling from siemens/kas/=
kas-isar<br />02b45931a436: Pull complete<br />dcfd7acb405d: Pull complete<=
br />47e0d38ce80b: Pull complete<br />c666350ba0a8: Pull complete<br />09bc=
0d0edf48: Pull complete<br />63f9bdc9bba1: Pull complete<br />f9cf7793c177:=
 Pull complete<br />9b2061fc2b0a: Pull complete<br />9502f2124a84: Pull com=
plete<br />c92d8f8102d5: Pull complete<br />f527819c1742: Pull complete<br =
/>Digest: sha256:0efd35a3a595ce95e43662d6839ee542383e5b506bc9e73260d5b8bf72=
16ee04<br />Status: Downloaded newer image for ghcr.io/siemens/kas/kas-isar=
:2.6.2<br />2023-06-19 18:03:20 - INFO =C2=A0 =C2=A0 - kas 2.6.2 started<br=
 />2023-06-19 18:05:41 - INFO =C2=A0 =C2=A0 - Saving configuration as /work=
/.config.yaml<br />2023-06-19 18:05:41 - INFO =C2=A0 =C2=A0 - /repo$ git re=
v-parse --show-toplevel<br />2023-06-19 18:05:41 - INFO =C2=A0 =C2=A0 - Usi=
ng /repo as root for repository jailhouse<br />2023-06-19 18:05:41 - INFO =
=C2=A0 =C2=A0 - /work$ git clone -q https://github.com/ilbers/isar /work/is=
ar<br />2023-06-19 18:05:44 - INFO =C2=A0 =C2=A0 - Repository isar cloned<b=
r />2023-06-19 18:05:44 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse --show-=
toplevel<br />2023-06-19 18:05:44 - INFO =C2=A0 =C2=A0 - Using /repo as roo=
t for repository jailhouse<br />2023-06-19 18:05:44 - INFO =C2=A0 =C2=A0 - =
/work/isar$ git status -s<br />2023-06-19 18:05:44 - INFO =C2=A0 =C2=A0 - /=
work/isar$ git rev-parse --verify -q origin/5f87d48f279761c2fefef1db16b4ccb=
5b955a364<br />2023-06-19 18:05:44 - INFO =C2=A0 =C2=A0 - /work/isar$ git c=
heckout -q 5f87d48f279761c2fefef1db16b4ccb5b955a364<br />2023-06-19 18:05:4=
5 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse --show-toplevel<br />2023-06-=
19 18:05:45 - INFO =C2=A0 =C2=A0 - Using /repo as root for repository jailh=
ouse<br />2023-06-19 18:05:45 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse -=
-show-toplevel<br />2023-06-19 18:05:45 - INFO =C2=A0 =C2=A0 - Using /repo =
as root for repository jailhouse<br />2023-06-19 18:05:45 - INFO =C2=A0 =C2=
=A0 - /work/isar$ /tmp/tmpqebji13x/get_bb_env /build<br />2023-06-19 18:05:=
45 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse --show-toplevel<br />2023-06=
-19 18:05:45 - INFO =C2=A0 =C2=A0 - Using /repo as root for repository jail=
house<br />2023-06-19 18:05:45 - INFO =C2=A0 =C2=A0 - /build$ /work/isar/bi=
tbake/bin/bitbake -c build mc:qemu-amd64-jailhouse-demo:demo-image mc:rpi4-=
jailhouse-demo:demo-image<br />Parsing recipes: 100% |#####################=
###########################################################################=
#######################################################| Time: 0:00:06<br /=
>Parsing of 38 .bb files complete (0 cached, 38 parsed). 114 targets, 0 ski=
pped, 0 masked, 0 errors.<br />NOTE: Resolving any missing task queue depen=
dencies<br />NOTE: Resolving any missing task queue dependencies<br />NOTE:=
 Resolving any missing task queue dependencies<br />NOTE: Resolving any mis=
sing task queue dependencies<br />NOTE: Resolving any missing task queue de=
pendencies<br />NOTE: Resolving any missing task queue dependencies<br />In=
itialising tasks: 100% |###################################################=
###########################################################################=
######################| Time: 0:00:03<br />NOTE: No setscene tasks<br />NOT=
E: Executing Tasks<br />WARNING: mc:rpi4-jailhouse-demo:non-root-initramfs-=
2021.02-r0 do_fetch: Failed to fetch URL https://raw.githubusercontent.com/=
siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivsh=
mem-demo.c;name=3Divshmem-demo, attempting MIRRORS if available<br /><b>ERR=
OR: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch: Fetcher =
failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGD=
ATA_NAME; export GIT_PROXY_COMMAND=3D"oe-git-proxy"; export NO_PROXY=3D"*";=
 export PATH=3D"/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr/bi=
n:/sbin:/bin"; export HOME=3D"/tmp/tmpp_e87orx"; /usr/bin/env wget -t 2 -T =
30 --passive-ftp --no-check-certificate -P /build/downloads 'https://raw.gi=
thubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e55=
3c9/tools/demos/ivshmem-demo.c' --progress=3Ddot -v failed with exit code 4=
, output:<br />--2023-06-19 18:08:47-- =C2=A0https://raw.githubusercontent.=
com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/=
ivshmem-demo.c<br />Resolving raw.githubusercontent.com (raw.githubusercont=
ent.com)... 49.44.79.236, 2405:200:1607:2820:41::36<br />Connecting to raw.=
githubusercontent.com (raw.githubusercontent.com)|49.44.79.236|:443... fail=
ed: Connection timed out.<br />Connecting to raw.githubusercontent.com (raw=
.githubusercontent.com)|2405:200:1607:2820:41::36|:443... failed: Cannot as=
sign requested address.<br />Retrying.<br /><br />--2023-06-19 18:09:18-- =
=C2=A0(try: 2) =C2=A0https://raw.githubusercontent.com/siemens/jailhouse/93=
25b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c<br />Conn=
ecting to raw.githubusercontent.com (raw.githubusercontent.com)|49.44.79.23=
6|:443... failed: Connection timed out.<br />Connecting to raw.githubuserco=
ntent.com (raw.githubusercontent.com)|2405:200:1607:2820:41::36|:443... fai=
led: Cannot assign requested address.<br />Giving up.<br /><br /><br />ERRO=
R: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch: Fetcher f=
ailure for URL: 'https://raw.githubusercontent.com/siemens/jailhouse/9325b7=
65d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c;name=3Divshme=
m-demo'. Unable to fetch URL from any source.<br />ERROR: Logfile of failur=
e stored in: /build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2021.0=
2-r0/temp/log.do_fetch.7854<br />ERROR: Task (mc:rpi4-jailhouse-demo:/repo/=
recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb:do_fetch) fai=
led with exit code '1'<br />ERROR: mc:rpi4-jailhouse-demo:jailhouse-jailhou=
se-rt-0.9999-next-r0 do_fetch: Fetcher failure: Fetch command export PSEUDO=
_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND=
=3D"oe-git-proxy"; export NO_PROXY=3D"*"; export PATH=3D"/work/isar/scripts=
:/work/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbin:/bin"; export HOME=3D"/tmp=
/tmpp_e87orx"; git -c core.fsyncobjectfiles=3D0 ls-remote git://github.com/=
siemens/jailhouse =C2=A0failed with exit code 128, output:<br />2023/06/19 =
18:10:44 socat[7689] E connect(5, AF=3D2 20.207.73.82:9418, 16): Connection=
 timed out<br />fatal: Could not read from remote repository.</b><br /><br =
/>Please make sure you have the correct access rights<br />and the reposito=
ry exists.<br /><br />ERROR: Logfile of failure stored in: /build/tmp/work/=
jailhouse-demo-arm64/jailhouse-jailhouse-rt/0.9999-next-r0/temp/log.do_fetc=
h.7453<br />ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-jailhouse/jai=
lhouse/jailhouse_latest.bb:do_fetch) failed with exit code '1'<br />NOTE: T=
asks Summary: Attempted 45 tasks of which 0 didn't need to be rerun and 2 f=
ailed.<br /><br />Summary: 2 tasks failed:<br />=C2=A0 mc:rpi4-jailhouse-de=
mo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb:do_f=
etch<br />=C2=A0 mc:rpi4-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/j=
ailhouse_latest.bb:do_fetch<br />Summary: There was 1 WARNING message shown=
.<br />Summary: There were 3 ERROR messages shown, returning a non-zero exi=
t code.<br />2023-06-19 18:11:35 - ERROR =C2=A0 =C2=A0- Command returned no=
n-zero exit status 1<br />ubuntu@ubuntu:~/jailhouse-images$=C2=A0<br /><br =
/></div><div>Is that timeout is occurring due to n/w issue or repo is not p=
resent, I am not sure.</div><div><br /></div><div>Regards,</div><div>Sai Kr=
ishna</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">On Monday, June 19, 2023 at 8:24:07=E2=80=AFPM UTC+5:30 Ralf Ramsauer wro=
te:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 19/06/2023 16:49, sai krishna Allu wrote:
<br>&gt; Hi Ralf,
<br>&gt;=20
<br>&gt; Sorry, I forgot to load the module, I have loaded now.
<br>&gt;=20
<br>&gt; ubuntu@ubuntu:~/jailhouse$ sudo insmod driver/jailhouse.ko
<br>&gt; ubuntu@ubuntu:~/jailhouse$ ls -l /dev/jailhouse
<br>&gt; crw------- 1 root root 10, 59 Jun 19 14:45 /dev/jailhouse
<br>&gt; ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi=
4.cell
<br>&gt; *[ 4966.214157] jailhouse: request_mem_region failed for hyperviso=
r memory.
<br>
<br>Okay. Interesting. I wonder why you didn&#39;t hit that error before.=
=20
<br>Jailhouse requires reserved memory where it, as well as inmates, reside=
.=20
<br>Linux must never claim those memory areas, hence you need to reserve=20
<br>that memory areas at boot time.
<br>
<br>See the comment in arch/arm64/rpi4.c:
<br>  * Reservation via device tree: reg =3D &lt;0x0 0x20000000 0x10000000&=
gt;;
<br>
<br>Did you reserve memory in your device tree?
<br>
<br>I would recommend building a working image with jailhouse-images. There=
,=20
<br>are required patches and config tweaks are included out of the box.
<br>
<br>
<br>   Ralf
<br>
<br>&gt; JAILHOUSE_ENABLE: Invalid argument*
<br>&gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;=20
<br>&gt;=20
<br>&gt; I am getting the above error.
<br>&gt;=20
<br>&gt; Regards,
<br>&gt; Sai Krishna
<br>&gt; On Monday, June 19, 2023 at 8:09:37=E2=80=AFPM UTC+5:30 Ralf Ramsa=
uer wrote:
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;     On 19/06/2023 16:23, sai krishna Allu wrote:
<br>&gt;      &gt; Hi Ralf,
<br>&gt;      &gt;
<br>&gt;      &gt; I have downloaded the master branch and given make and I=
 have got
<br>&gt;     the
<br>&gt;      &gt; following error, I fixed the error with one of the refer=
ence
<br>&gt;     link, but
<br>&gt;      &gt; didn&#39;t find the /dev/jailhouse post installation
<br>&gt;      &gt;
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$ git branch
<br>&gt;      &gt; * master
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$make
<br>&gt;      &gt; ...
<br>&gt;      &gt; ...
<br>&gt;      &gt; ...
<br>&gt;      &gt; =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ubuntu/jailhouse/con=
figs/arm64/zynqmp-zcu102.o
<br>&gt;      &gt; =C2=A0 OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynq=
mp-zcu102.cell
<br>&gt;      &gt; =C2=A0 DTC   =20
<br>&gt;     /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dt=
b
<br>&gt;      &gt;
<br>&gt;     */home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.d=
ts:17:54:
<br>&gt;      &gt; error: no include path in which to search for
<br>&gt;      &gt; dt-bindings/interrupt-controller/arm-gic.h
<br>&gt;      &gt; =C2=A0 =C2=A017 | #include &lt;dt-bindings/interrupt-con=
troller/arm-gic.h&gt;*
<br>&gt;      &gt; =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^
<br>&gt;      &gt; make[3]: *** [scripts/Makefile.lib:286:
<br>&gt;      &gt; /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seat=
tle.dtb]
<br>&gt;     Error 1
<br>&gt;      &gt; make[2]: *** [scripts/Makefile.build:519:
<br>&gt;      &gt; /home/ubuntu/jailhouse/configs] Error 2
<br>&gt;      &gt; make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Err=
or 2
<br>&gt;      &gt; make: *** [Makefile:40: modules] Error 2
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;      &gt;
<br>&gt;      &gt; To fix the above I have followed the link
<br>&gt;      &gt; <a href=3D"https://bbs.csdn.net/topics/615205697" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://bbs.csdn.net/topics/615205697&amp;source=3Dgma=
il&amp;ust=3D1687285369865000&amp;usg=3DAOvVaw1-tEANwvvlkfrY64HOL_f3">https=
://bbs.csdn.net/topics/615205697</a>
<br>&gt;     &lt;<a href=3D"https://bbs.csdn.net/topics/615205697" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://bbs.csdn.net/topics/615205697&amp;source=3Dgma=
il&amp;ust=3D1687285369865000&amp;usg=3DAOvVaw1-tEANwvvlkfrY64HOL_f3">https=
://bbs.csdn.net/topics/615205697</a>&gt; and changed as per instruction,
<br>&gt;      &gt; even I followed the earlier build from this link only. b=
ut I was not
<br>&gt;      &gt; able to build jailhouse-image.
<br>&gt;=20
<br>&gt;     Ok, perfect.
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; DTC_INCLUDE =C2=A0 =C2=A0+=3D /usr/src/linux-headers-5.4=
.0-1069-raspi/include
<br>&gt;     added
<br>&gt;      &gt; in the file
<br>&gt;     --&gt;/usr/src/linux-headers-5.4.0-1011-raspi/scripts/Makefile=
.lib
<br>&gt;      &gt;
<br>&gt;      &gt; After that I am able to install,
<br>&gt;      &gt;
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$ sudo make install
<br>&gt;      &gt; =C2=A0 Building modules, stage 2.
<br>&gt;      &gt; =C2=A0 MODPOST 1 modules
<br>&gt;      &gt; =C2=A0 INSTALL /home/ubuntu/jailhouse/driver/jailhouse.k=
o
<br>&gt;      &gt; At main.c:160:
<br>&gt;      &gt; - SSL error:02001002:system library:fopen:No such file o=
r directory:
<br>&gt;      &gt; ../crypto/bio/bss_file.c:69
<br>&gt;      &gt; - SSL error:2006D080:BIO routines:BIO_new_file:no such f=
ile:
<br>&gt;      &gt; ../crypto/bio/bss_file.c:76
<br>&gt;      &gt; sign-file: certs/signing_key.pem: No such file or direct=
ory
<br>&gt;      &gt; =C2=A0 DEPMOD =C2=A05.4.0-1069-raspi
<br>&gt;      &gt; Warning: modules_install: missing &#39;System.map&#39; f=
ile. Skipping
<br>&gt;     depmod.
<br>&gt;      &gt; install -m 644 hypervisor/jailhouse*.bin /lib/firmware
<br>&gt;      &gt; install -d -m 755 /usr/local/libexec/jailhouse
<br>&gt;      &gt; install -m 644 inmates/tools/arm64/*.bin
<br>&gt;     /usr/local/libexec/jailhouse
<br>&gt;      &gt; install jailhouse demos/ivshmem-demo /usr/local/sbin
<br>&gt;      &gt; install jailhouse-config-collect jailhouse-cell-linux
<br>&gt;      &gt; jailhouse-cell-stats jailhouse-config-create jailhouse-c=
onfig-check
<br>&gt;      &gt; jailhouse-hardware-check /usr/local/libexec/jailhouse
<br>&gt;      &gt; install -d -m 755 /usr/local/share/jailhouse
<br>&gt;      &gt; install -m 644 jailhouse-config-collect.tmpl root-cell-c=
onfig.c.tmpl
<br>&gt;      &gt; /usr/local/share/jailhouse
<br>&gt;      &gt; install -m 644 jailhouse-completion.bash
<br>&gt;      &gt; /usr/share/bash-completion/completions/jailhouse
<br>&gt;      &gt; install -d -m 755 /usr/local/share/man/man8
<br>&gt;      &gt; install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-en=
able.8
<br>&gt;      &gt; /usr/local/share/man/man8
<br>&gt;      &gt; python3 -m pip install --upgrade --force-reinstall =C2=
=A0.
<br>&gt;      &gt; Processing /home/ubuntu/jailhouse
<br>&gt;      &gt; Building wheels for collected packages: pyjailhouse
<br>&gt;      &gt; =C2=A0 Building wheel for pyjailhouse (setup.py) ... don=
e
<br>&gt;      &gt; =C2=A0 Created wheel for pyjailhouse:
<br>&gt;      &gt; filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D2279=
5
<br>&gt;      &gt;
<br>&gt;     sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf5=
5021a3853bb
<br>&gt;      &gt; =C2=A0 Stored in directory:
<br>&gt;      &gt;
<br>&gt;     /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a36=
93d675b8bd9bcdcb021956f8d467789b3be58740
<br>&gt;      &gt; Successfully built pyjailhouse
<br>&gt;      &gt; Installing collected packages: pyjailhouse
<br>&gt;      &gt; Successfully installed pyjailhouse-0.12
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;      &gt;
<br>&gt;      &gt; *but not able to get jailhouse in dev file.*
<br>&gt;=20
<br>&gt;     Yeah, you need to load the jailhouse module first:
<br>&gt;=20
<br>&gt;     insmod drivers/jailhouse.ko
<br>&gt;     or
<br>&gt;     modprobe jailhouse
<br>&gt;=20
<br>&gt;     Thanks
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$*ls -l /dev/jailhouse*
<br>&gt;      &gt; *ls: cannot access &#39;/dev/jailhouse&#39;: No such fil=
e or directory*
<br>&gt;      &gt; ubuntu@ubuntu:~/jailhouse$
<br>&gt;      &gt;
<br>&gt;      &gt; Please suggest the correct way to install or anything el=
se I need to
<br>&gt;      &gt; change or need to follow different steps to fix this iss=
ue to get
<br>&gt;     the
<br>&gt;      &gt; installation success.
<br>&gt;      &gt;
<br>&gt;      &gt; Regards,
<br>&gt;      &gt; Sai Krishna
<br>&gt;      &gt;
<br>&gt;      &gt; On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 =
Ralf Ramsauer wrote:
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; On 19/06/2023 12:23, sai krishna Allu wrote:
<br>&gt;      &gt; &gt; Hi Ralf,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I have attached the hypervisor.o and I have taken t=
he dump of
<br>&gt;      &gt; that which
<br>&gt;      &gt; &gt; is also attached too.
<br>&gt;      &gt; &gt; I have below command to extract, let me know is it =
ok or not.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d
<br>&gt;      &gt; &gt; jailhouse/hypervisor/hypervisor.o|tee hypervisor_du=
mp.txt
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep &=
quot;ffffc0203820&quot;
<br>&gt;      &gt; &gt; *3338 =C2=A0 =C2=A0ffffc0203820: =C2=A0 =C2=A0 =C2=
=A0 f9400282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
<br>&gt;      &gt; &gt; ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
<br>&gt;      &gt; &gt; =C2=A0 =C2=A0 =C2=A0 patch+0x218&gt;
<br>&gt;      &gt; &gt; =C2=A03334 =C2=A0 =C2=A0 ffffc0203810: =C2=A0 =C2=
=A0 =C2=A0 f9400282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]
<br>&gt;      &gt; &gt; =C2=A03335 =C2=A0 =C2=A0 ffffc0203814: =C2=A0 =C2=
=A0 =C2=A0 f9400842 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2,
<br>&gt;     #16]
<br>&gt;      &gt; &gt; =C2=A03336 =C2=A0 =C2=A0 ffffc0203818: =C2=A0 =C2=
=A0 =C2=A0 8a130042 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x2, x2, x1=
9
<br>&gt;      &gt; &gt; =C2=A03337 =C2=A0 =C2=A0 ffffc020381c: =C2=A0 =C2=
=A0 =C2=A0 f90a4002 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 x2, [x0,
<br>&gt;      &gt; #5248]
<br>&gt;      &gt; &gt; *=C2=A03338 =C2=A0 =C2=A0 ffffc0203820: =C2=A0 =C2=
=A0 =C2=A0 f9400282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
<br>&gt;      &gt; &gt; =C2=A03339 =C2=A0 =C2=A0 ffffc0203824: =C2=A0 =C2=
=A0 =C2=A0 f9400c42 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2,
<br>&gt;     #24]
<br>&gt;      &gt; &gt; =C2=A03340 =C2=A0 =C2=A0 ffffc0203828: =C2=A0 =C2=
=A0 =C2=A0 8a130053 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x19, x2, x=
19
<br>&gt;      &gt; &gt; =C2=A03341 =C2=A0 =C2=A0 ffffc020382c: =C2=A0 =C2=
=A0 =C2=A0 52800022 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 w2, #0x1
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; The instruction at=C2=A0ffffc0203820=C2=A0means it =
Load x2 from contents of
<br>&gt;      &gt; x20
<br>&gt;      &gt; &gt; register.
<br>&gt;      &gt; &gt; Please suggest how to fix this.
<br>&gt;      &gt;
<br>&gt;      &gt; Keep calm, I&#39;m still trying to figure out where the =
problem
<br>&gt;     exactly is.
<br>&gt;      &gt;
<br>&gt;      &gt; Now I know the line of code, where the exception exactly=
 happens.
<br>&gt;     It&#39;s
<br>&gt;      &gt; in hypervisor/arch/arm-common/psci.c:39
<br>&gt;      &gt;
<br>&gt;      &gt; ldr x2, [x20] &lt;- Here we likely load ctx-&gt;regs[2],=
 and the only
<br>&gt;     variant
<br>&gt;      &gt; how this could fail is that ctx points to somewhere. Her=
e we&#39;re
<br>&gt;     inside
<br>&gt;      &gt; the routine psci_emulate_cpu_on, which shouldn&#39;t eve=
n be called when
<br>&gt;      &gt; enabling the hypervisor. I don&#39;t know yet what could=
 be the issue.
<br>&gt;      &gt;
<br>&gt;      &gt; Before we keep on debugging: I saw that you use Jailhous=
e v0.12.
<br>&gt;      &gt;
<br>&gt;      &gt; Could you please switch to the master and/or next branch=
 of
<br>&gt;     jailhouse,
<br>&gt;      &gt; and see if the error still occurs there?
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks,
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Regards,
<br>&gt;      &gt; &gt; Sai Krishna
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UT=
C+5:30 Ralf Ramsauer
<br>&gt;      &gt; wrote:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hi,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On 15/06/2023 10:11, sai krishna Allu wrote:
<br>&gt;      &gt; &gt; &gt; Hi Team,
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; I have=C2=A0Raspberry Pi 4, which is installed=
 with Ubuntu 20.04.5
<br>&gt;     LTS
<br>&gt;      &gt; &gt; 64 bit.
<br>&gt;      &gt; &gt; &gt; after loading the jailhouse.ko file, when I ga=
ve following
<br>&gt;      &gt; &gt; command I am
<br>&gt;      &gt; &gt; &gt; getting the exception.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enab=
le
<br>&gt;      &gt; &gt; configs/arm64/rpi4.cell
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Initializing Jailhouse hypervisor v0.12 (0-g92=
db71f2) on CPU 0
<br>&gt;      &gt; &gt; &gt; Code location: 0x0000ffffc0200800
<br>&gt;      &gt; &gt; &gt; Page pool usage after early setup: mem 39/994,=
 remap 0/131072
<br>&gt;      &gt; &gt; &gt; Initializing processors:
<br>&gt;      &gt; &gt; &gt; =C2=A0CPU 0...
<br>&gt;      &gt; &gt; &gt; FATAL: Unhandled HYP exception: synchronous ab=
ort from EL2
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Synchronous abort from EL2 means that we have a fat=
al error inside
<br>&gt;      &gt; &gt; Jailhouse (e.g., segfault).
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffff=
c020380c spsr: 800003c9
<br>&gt;      &gt; EL2
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Could you please disassemble your hypervisor binary=
, and see
<br>&gt;      &gt; where the
<br>&gt;      &gt; &gt; exception exactly occurs? Do this with:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; aarch64-objdump -d hypervisor/hypervisor.o
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; And see what code executes behind 0x0000ffffc020382=
0.
<br>&gt;     Alternatively,
<br>&gt;      &gt; &gt; you
<br>&gt;      &gt; &gt; can also attach the hypervisor.o.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thanks,
<br>&gt;      &gt; &gt; Ralf
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 000=
0000
<br>&gt;      &gt; &gt; &gt; =C2=A0x0: 0000000084000000 =C2=A0 x1: 00000000=
00000008 =C2=A0 x2:
<br>&gt;      &gt; 0000000080003580
<br>&gt;      &gt; &gt; &gt; =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 00000000=
00000014 =C2=A0 x5:
<br>&gt;      &gt; 000003ffffffffff
<br>&gt;      &gt; &gt; &gt; =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffff=
c0219d30 =C2=A0 x8:
<br>&gt;      &gt; 000000000000002a
<br>&gt;      &gt; &gt; &gt; =C2=A0x9: 0000000000000000 =C2=A0x10: 00000000=
00000000 =C2=A0x11:
<br>&gt;      &gt; 0000000000000001
<br>&gt;      &gt; &gt; &gt; x12: 0000000000000015 =C2=A0x13: 0000000000000=
001 =C2=A0x14:
<br>&gt;      &gt; 0000ffffc0219000
<br>&gt;      &gt; &gt; &gt; x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d=
1fc =C2=A0x17:
<br>&gt;      &gt; ffffbcae22826688
<br>&gt;      &gt; &gt; &gt; x18: 0000000000000001 =C2=A0x19: 0000ffffc021e=
000 =C2=A0x20:
<br>&gt;      &gt; 0000ffffc0219000
<br>&gt;      &gt; &gt; &gt; x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219=
000 =C2=A0x23:
<br>&gt;      &gt; 0000000000000000
<br>&gt;      &gt; &gt; &gt; x24: 0000000000000001 =C2=A0x25: 0000ffffc021e=
000 =C2=A0x26:
<br>&gt;      &gt; 0000ffffc021f000
<br>&gt;      &gt; &gt; &gt; x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218=
000 =C2=A0x29:
<br>&gt;      &gt; 0000ffffc021ee40
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Hypervisor stack before exception Stopping CPU=
 0 (Cell:
<br>&gt;      &gt; &gt; &quot;Raspberry-Pi4&quot;)
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Please suggest how to fix this problem.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Regards,
<br>&gt;      &gt; &gt; &gt; Sai Krishna
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; --
<br>&gt;      &gt; &gt; &gt; You received this message because you are subs=
cribed to the
<br>&gt;     Google
<br>&gt;      &gt; &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; &gt; To unsubscribe from this group and stop receiv=
ing emails from
<br>&gt;     it,
<br>&gt;      &gt; &gt; send
<br>&gt;      &gt; &gt; &gt; an email to <a href data-email-masked rel=3D"n=
ofollow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"no=
follow">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687285=
369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687285=
369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4d=
a0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D168=
7285369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https://groups.google=
.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4d=
a0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D168=
7285369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https://groups.google=
.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f=
38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1687285369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https://gro=
ups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%=
40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f=
38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1687285369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https://gro=
ups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%=
40googlegroups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e=
6d4f38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https:/=
/groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b763=
00n%40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e=
6d4f38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw1NtzDalhWSPTtTQjf-_sNQ">https:/=
/groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b763=
00n%40googlegroups.com</a>&gt;&gt;&gt; &lt;<a href=3D"https://groups.google=
.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegr=
oups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-96=
66-9093a0b76300n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfoo=
ter&amp;source=3Dgmail&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw3tTMcBbnc=
32YT6y116m2Pz">https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-593=
8-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_sou=
rce=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.go=
ogle.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540go=
oglegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&=
amp;ust=3D1687285369866000&amp;usg=3DAOvVaw3tTMcBbnc32YT6y116m2Pz">https://=
groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b7630=
0n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-=
4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D168728536=
9866000&amp;usg=3DAOvVaw3tTMcBbnc32YT6y116m2Pz">https://groups.google.com/d=
/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gr=
oups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n=
%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-59=
38-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_medium%3Demail%26utm_so=
urce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687285369866000&amp;usg=3DAOvVa=
w3tTMcBbnc32YT6y116m2Pz">https://groups.google.com/d/msgid/jailhouse-dev/3e=
6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&a=
mp;utm_source=3Dfooter</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com=
/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-=
9093a0b76300n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter=
&amp;source=3Dgmail&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw3tTMcBbnc32Y=
T6y116m2Pz">https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4=
da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Dema=
il&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.googl=
e.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540googl=
egroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp=
;ust=3D1687285369866000&amp;usg=3DAOvVaw3tTMcBbnc32YT6y116m2Pz">https://gro=
ups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<=
a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da=
0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jai=
lhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_m=
edium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687285369=
866000&amp;usg=3DAOvVaw3tTMcBbnc32YT6y116m2Pz">https://groups.google.com/d/=
msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_b=
lank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-593=
8-4da0-9666-9093a0b76300n%2540googlegroups.com?utm_medium%3Demail%26utm_sou=
rce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw=
3tTMcBbnc32YT6y116m2Pz">https://groups.google.com/d/msgid/jailhouse-dev/3e6=
d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter</a>&gt;&gt;&gt;&gt;.
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bda=
a1499-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a=
59d-812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687285=
369866000&amp;usg=3DAOvVaw2MH7aBKB32v4MTdjxIWHzx">https://groups.google.com=
/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bda=
a1499-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a=
59d-812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687285=
369866000&amp;usg=3DAOvVaw2MH7aBKB32v4MTdjxIWHzx">https://groups.google.com=
/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-42=
3f-a59d-812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D168=
7285369866000&amp;usg=3DAOvVaw2MH7aBKB32v4MTdjxIWHzx">https://groups.google=
.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-42=
3f-a59d-812557f8162an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D168=
7285369866000&amp;usg=3DAOvVaw2MH7aBKB32v4MTdjxIWHzx">https://groups.google=
.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw0tQeVIcZeZiz1Dl4Dsg4lS">http=
s://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f=
8162an%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-=
423f-a59d-812557f8162an%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D168728536=
9866000&amp;usg=3DAOvVaw0tQeVIcZeZiz1Dl4Dsg4lS">https://groups.google.com/d=
/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f81=
62an%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/bdaa14=
99-4532-423f-a59d-812557f8162an%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687285369866000&amp;usg=3D=
AOvVaw0tQeVIcZeZiz1Dl4Dsg4lS">https://groups.google.com/d/msgid/jailhouse-d=
ev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-81255=
7f8162an%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1687285369866000&amp;usg=3DAOvVaw0tQeVIcZeZiz1Dl4D=
sg4lS">https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a=
59d-812557f8162an%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/60a=
06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-a=
ee5-d61d8ebeb141n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687285=
369866000&amp;usg=3DAOvVaw2LcGlO5RX76uxlV6xantYO">https://groups.google.com=
/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/60a=
06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-a=
ee5-d61d8ebeb141n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1687285=
369866000&amp;usg=3DAOvVaw2LcGlO5RX76uxlV6xantYO">https://groups.google.com=
/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1687285369866000&amp;usg=3DAOvVaw1Vvi9-O0UBSQK-TqYxZrmk">https://grou=
ps.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee=
5-d61d8ebeb141n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1687285369866000&=
amp;usg=3DAOvVaw1Vvi9-O0UBSQK-TqYxZrmk">https://groups.google.com/d/msgid/j=
ailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/ff5f75f=
d-7b70-424a-ab0e-537d4242afffn%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-=
537d4242afffn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16872853698=
66000&amp;usg=3DAOvVaw3ICBk7JheftQTkHXrch05T">https://groups.google.com/d/m=
sgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/ff5f75f=
d-7b70-424a-ab0e-537d4242afffn%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
687285369866000&amp;usg=3DAOvVaw2cejx7QLn79TtLQVNRbBiU">https://groups.goog=
le.com/d/msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%40google=
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
om/d/msgid/jailhouse-dev/703038e6-c880-4f1c-b20c-3d06d7d5a852n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/703038e6-c880-4f1c-b20c-3d06d7d5a852n%40googlegroups.co=
m</a>.<br />

------=_Part_14541_1760351767.1687199163912--

------=_Part_14540_738870661.1687199163912--
