Return-Path: <jailhouse-dev+bncBD255JNDXQHRBXXEWKGQMGQE43YO74Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 64397468AD4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Dec 2021 13:36:47 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id j19-20020a05620a411300b0046dcad11010sf2492289qko.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Dec 2021 04:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PELlMZ60g8GFq0pjhagGkwW2YZbgLyW0RBt+Ka8ApuI=;
        b=iiFg9/AbFik0Gv/M/H4cHlsJ5WaJpbR5Ou9223Q3XACwKTEbR96jIvf7p/nXvIJ6bu
         AFtldqLEO8C+zxYNYDVvVc/2jDCU7Nj1MsGLMiQs0amvHoTCPk6kzVNN1qZO3YyL0M5K
         uA2D74OhtIUyo+dNHNn9nYqnu6PmiemvyPWIc0dGGLObmN/+TSiszTNJa0qNsg0EXY1W
         mMhXShLk3413uNixDAcsTE+WjbE+M8EZ3YHrz4tbH3ueKlHXQgh+uTotKJHhbarL6qkG
         WjcQ/pJdNzCCElTkJedc4A9liL7tByMejs8NF8QdiIfGtBNf0qgp/bg6AmYy9MnExTJe
         D0yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PELlMZ60g8GFq0pjhagGkwW2YZbgLyW0RBt+Ka8ApuI=;
        b=Y+ONIYERlphRJbgthdOxLLt4hNPJ1acy+HjJg+hptVIMRP3LMCTcOXEYXRFfptZ1ek
         HvLbCfudYWPKt9Nt4Jk0vWdeQrVgLZMQP0gH/gsjB+3bc8uzQShkC2ZuN9mP19uakHkm
         gQUMNNF5wBtkwE2deDUe7V0Ood4WFeiBUqkD/6lPnu7A/c136S5HYBAQmCZYsV2k3PIc
         UkmOsSrHjpSSb38pajVMKz8LYBFqFdIReOtPJYZVxj8bo4lw1vxXz7M6gvc8oz95lJan
         tKEgYMdQ3eaHHQgNdIEphIf6MNQakq6pHE0MRmdlRz6k5vA+L4CY2Q5r3nhFNSSmP5zK
         xHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PELlMZ60g8GFq0pjhagGkwW2YZbgLyW0RBt+Ka8ApuI=;
        b=knLLXRqHAbiLLBC6+v/Za2ZpRGlsSjKUNkm1RMQkQbOMBsiTFqSXsmM0ARRm2J091k
         SBjvN2ulf19MJFY2BvKz3Itcj+410u0YjiDoEqTiEpuICgpq910uWdbeAb5+pDIbYVZR
         sU4ReI2Y/Y2nssgQqs55PAkSYC6ZUkeCVNFjWPbYEnkx+sOvbS2o+kxmdoWxRMHgokMM
         MPhXm0lD9NMxI2XO7RMkkBeMbLX+9pzvv7lFQoTNG1Zhx6drFepOIAE7Z7GlKHvZt8BX
         IZdPj1Fzk2uNeFVrtUQdSvRTtXzl8nJL/3ll9b5+xHlOAnBXRgW8rWN7gNcKXGrkPqVA
         eH4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532C3/59K67Jlud30unqUtab+a6YK80tDrV9JNIEv6fFnBoHsi/I
	ZSYejjSyspn/JvYEse68Nq8=
X-Google-Smtp-Source: ABdhPJzSYtFx71WenrXcFpL9lFsdI6fAflaBwoQuehMBlcT2R86JuAisK3E0NgR1l3GA2UDCwbcVcQ==
X-Received: by 2002:ac8:7f8b:: with SMTP id z11mr32626504qtj.513.1638707806246;
        Sun, 05 Dec 2021 04:36:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:1866:: with SMTP id eh6ls7155631qvb.1.gmail; Sun,
 05 Dec 2021 04:36:45 -0800 (PST)
X-Received: by 2002:a05:6214:250d:: with SMTP id gf13mr31573543qvb.39.1638707805807;
        Sun, 05 Dec 2021 04:36:45 -0800 (PST)
Date: Sun, 5 Dec 2021 04:36:45 -0800 (PST)
From: Dirk Boris <dirkboris12@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2e90b2d1-9f38-49cf-b639-d6379acac961n@googlegroups.com>
Subject: Jailhouse-image
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1328_1477575689.1638707805166"
X-Original-Sender: dirkboris12@gmail.com
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

------=_Part_1328_1477575689.1638707805166
Content-Type: multipart/alternative; 
	boundary="----=_Part_1329_1193313633.1638707805166"

------=_Part_1329_1193313633.1638707805166
Content-Type: text/plain; charset="UTF-8"

Hello, 
I am trying to build a jailhouse-enabled image for Raspberry Pi4. I am 
encountering this error:

Preparing to unpack .../73-wpasupplicant_2%3a2.9.0-21_arm64.deb ...
Unpacking wpasupplicant (2:2.9.0-21) ...
Errors were encountered while processing:
 /tmp/apt-dpkg-install-QpxilU/67-rpi-firmware-brcm80211_1.0_arm64.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
WARNING: exit code 100 from a shell command.


ERROR: Logfile of failure stored in: 
/work/build/tmp/work/jailhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/temp/log.do_rootfs_install.73
ERROR: Task 
(mc:rpi4-jailhouse-demo:/repo/recipes-core/images/demo-image.bb:do_rootfs_install) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 139 tasks of which 138 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
  
mc:rpi4-jailhouse-demo:/repo/recipes-core/images/demo-image.bb:do_rootfs_install
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
2021-12-05 12:30:19 - ERROR    - Command returned non-zero exit status 1

As I understand, a docker is required, so I installed docker, added user to 
the group and ran ./build-images.sh without root. So, I would really 
appreciate any help.

Thanks in Advance
Dirk Boris

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2e90b2d1-9f38-49cf-b639-d6379acac961n%40googlegroups.com.

------=_Part_1329_1193313633.1638707805166
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, <br>I am trying to build a jailhouse-enabled image for Raspberry Pi4=
. I am encountering this error:<br><br>Preparing to unpack .../73-wpasuppli=
cant_2%3a2.9.0-21_arm64.deb ...<br>Unpacking wpasupplicant (2:2.9.0-21) ...=
<br>Errors were encountered while processing:<br>&nbsp;/tmp/apt-dpkg-instal=
l-QpxilU/67-rpi-firmware-brcm80211_1.0_arm64.deb<br>E: Sub-process /usr/bin=
/dpkg returned an error code (1)<br>WARNING: exit code 100 from a shell com=
mand.<br><br><br>ERROR: Logfile of failure stored in: /work/build/tmp/work/=
jailhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/temp/log.do_rootfs_inst=
all.73<br>ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-core/images/dem=
o-image.bb:do_rootfs_install) failed with exit code '1'<br>NOTE: Tasks Summ=
ary: Attempted 139 tasks of which 138 didn't need to be rerun and 1 failed.=
<br><br>Summary: 1 task failed:<br>&nbsp; mc:rpi4-jailhouse-demo:/repo/reci=
pes-core/images/demo-image.bb:do_rootfs_install<br>Summary: There was 1 ERR=
OR message shown, returning a non-zero exit code.<br>2021-12-05 12:30:19 - =
ERROR&nbsp;&nbsp;&nbsp; - Command returned non-zero exit status 1<br><div><=
br></div><div>As I understand, a docker is required, so I installed docker,=
 added user to the group and ran ./build-images.sh without root. So, I woul=
d really appreciate any help.<br><br>Thanks in Advance<br>Dirk Boris<br></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2e90b2d1-9f38-49cf-b639-d6379acac961n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2e90b2d1-9f38-49cf-b639-d6379acac961n%40googlegroups.co=
m</a>.<br />

------=_Part_1329_1193313633.1638707805166--

------=_Part_1328_1477575689.1638707805166--
