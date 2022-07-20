Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBQXE4CLAMGQE4YZ4NQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98C57BBDA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Jul 2022 18:50:11 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id od5-20020a0562142f0500b00473838e0feesf9717377qvb.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Jul 2022 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xUpIcLgBCMwmQBEmidiWhAR0LONZiWY5WhhfqqSaPKg=;
        b=oVBBzjYydep4jWvaCj9bRFf4GVJKGrV6QlKPytOGq/6VcY2akOFN5jqa4PskQfvkM/
         WAgDZDRIGsl6A77X1ThCpOXvI+sp9+8ik3OMwHXxXSHK0wnCGf5c/Vqkdtc+nKAMfUVi
         33KfgXOshM+Ygl4435SaE69BCZG3c4Gh3Tp/uJoooacWkvrH0ik7i/LsVstX9SYCwUeh
         +urc8F5iIiemOlgwDk0m8lDZJtk11McKdr5cHdnf7nNuWbaAupaWp9aNCCj0rmGqR01k
         zIwyvZiK9XocI6LQrfbK+368QHbtMHzxbJIkHxPjM4AqRBATLviWa4/jPNOdqo80uFrI
         CZEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xUpIcLgBCMwmQBEmidiWhAR0LONZiWY5WhhfqqSaPKg=;
        b=JBvpeyvHJcfZRC6jJO68cOSNYQw3Z9mFKrVFpBIzz2WXaLWiWkHC35zWLfAglByM+C
         NsKHuIrDG3uV/JSHzE2aFl+65A7RT+bCJOrDaaxfLRPMjHI3AKUZBDB4xdOByr1YIAZS
         MWXxNw1i0ccSAmoaIHUZF04NBbzflz/ykVljRjQhvr1tgTYLqUfNn4XWRa9ej65xi+3f
         uqbAeffiOFEPbXjYZIqKwDVcWy/UM6TVscpJE8Bsg3pQ+dgOmJo/2NCzDHhmh5PErYnz
         aFvYFWXZ/JVhUF6SPwm82JcwJy9NW+BJ1y6y/yEGorMl/fr1kIyf59YhrQYHGI2Q1Fpy
         lWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xUpIcLgBCMwmQBEmidiWhAR0LONZiWY5WhhfqqSaPKg=;
        b=V6z73d7CHNPHKOJPTGrgF525vqIUvdidHeswFEbhOPPLuVxYwhJRXq8TNyL1d0o5d5
         ci5PJ+rqhgyOs5lpdb4rhVgMz/1MFox+u6f965mhuq5KO2L1Uojch+greFOEWCbay9PK
         GkGvBLXvyYy5t3/4c/pR3wXBhYeJktM/UZ3DQDp18hMfroq8VbJ70QbpwlzsrfKCHrZo
         vLyCu3CLxv+oK2KpH96/P8SEnekIj7MYp3eVSisAUlDHwI3XpWWyuq0PkNw5hQP8AkqQ
         RrCpc3r0tGd7wV9SSSBZ7zQJ5O6/FN/C4JO0WvGlpsRrzJ9v8/I3Yrk7JY7iZDtYV2zM
         X/mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9lpaAoTrNyF7uj+tfxJcZ7/CjJ9z6SedohYQDLnJp5AFhTZ5o6
	el6MpHGGrz6u4A1sJ4wN3vE=
X-Google-Smtp-Source: AGRyM1u2LWxpftjD/kLaZpdJwkBEo5sHEV8pXFH0mjtELCqbqyEHJgbHRJfXAKiy5CS75x90eSZsYg==
X-Received: by 2002:ac8:7dca:0:b0:31e:f231:6f76 with SMTP id c10-20020ac87dca000000b0031ef2316f76mr11743330qte.568.1658335810547;
        Wed, 20 Jul 2022 09:50:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f386:0:b0:472:fdeb:6fda with SMTP id i6-20020a0cf386000000b00472fdeb6fdals368481qvk.3.-pod-prod-gmail;
 Wed, 20 Jul 2022 09:50:09 -0700 (PDT)
X-Received: by 2002:a05:6214:1c4a:b0:473:2e4a:8e30 with SMTP id if10-20020a0562141c4a00b004732e4a8e30mr30881093qvb.32.1658335809540;
        Wed, 20 Jul 2022 09:50:09 -0700 (PDT)
Date: Wed, 20 Jul 2022 09:50:08 -0700 (PDT)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6d9e7efd-e936-47b9-adb0-29b9407dfaben@googlegroups.com>
Subject: failed to build Jailhouse image for Raspberry Pi 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3808_782283646.1658335808766"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_3808_782283646.1658335808766
Content-Type: multipart/alternative; 
	boundary="----=_Part_3809_851661558.1658335808767"

------=_Part_3809_851661558.1658335808767
Content-Type: text/plain; charset="UTF-8"


I would very much appreciate any help with the following issue:

I have been trying to build Jailhouse demo image for Raspberry Pi 4 from 
v0.12 tag, on Ubuntu 16.04.
The build has failed with:

"I: Running command: chroot 
/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs 
/debootstrap/debootstrap --second-stage
| W: Failure trying to run:  mount -t proc proc /proc
| W: See //debootstrap/debootstrap.log for details
| W: Failure trying to run:  /sbin/ldconfig
| W: See //debootstrap/debootstrap.log for details
| WARNING: exit code 1 from a shell command.
| 
ERROR: Task 
(mc:rpi4-jailhouse-demo:/work/isar/meta/recipes-core/isar-bootstrap/isar-bootstrap-target.bb:do_bootstrap) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 120 tasks of which 0 didn't need to be rerun 
and 1 failed.

Summary: 1 task failed:
  
mc:rpi4-jailhouse-demo:/work/isar/meta/recipes-core/isar-bootstrap/isar-bootstrap-target.bb:do_bootstrap
Summary: There was 1 ERROR message shown, returning a non-zero exit code."

The log of the build console output and debootstrap.log are attached.

Thank you

Yelena

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d9e7efd-e936-47b9-adb0-29b9407dfaben%40googlegroups.com.

------=_Part_3809_851661558.1658335808767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>I would very much appreciate any help with the following issue:<br><br>=
I have been trying to build Jailhouse demo image for Raspberry Pi 4 from v0=
.12 tag, on Ubuntu 16.04.<br>The build has failed with:<br><br>"I: Running =
command: chroot /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-ta=
rget/1.0-r0/rootfs /debootstrap/debootstrap --second-stage<br>| W: Failure =
trying to run: &nbsp;mount -t proc proc /proc<br>| W: See //debootstrap/deb=
ootstrap.log for details<br>| W: Failure trying to run: &nbsp;/sbin/ldconfi=
g<br>| W: See //debootstrap/debootstrap.log for details<br>| WARNING: exit =
code 1 from a shell command.<br>| <br>ERROR: Task (mc:rpi4-jailhouse-demo:/=
work/isar/meta/recipes-core/isar-bootstrap/isar-bootstrap-target.bb:do_boot=
strap) failed with exit code '1'<br>NOTE: Tasks Summary: Attempted 120 task=
s of which 0 didn't need to be rerun and 1 failed.<br><br>Summary: 1 task f=
ailed:<br>&nbsp; mc:rpi4-jailhouse-demo:/work/isar/meta/recipes-core/isar-b=
ootstrap/isar-bootstrap-target.bb:do_bootstrap<br>Summary: There was 1 ERRO=
R message shown, returning a non-zero exit code."<br><br>The log of the bui=
ld console output and debootstrap.log are attached.<br><br>Thank you<br><br=
>Yelena<br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6d9e7efd-e936-47b9-adb0-29b9407dfaben%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6d9e7efd-e936-47b9-adb0-29b9407dfaben%40googlegroups.co=
m</a>.<br />

------=_Part_3809_851661558.1658335808767--

------=_Part_3808_782283646.1658335808766
Content-Type: text/x-log; charset=UTF-8; name=debootstrap.log
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=debootstrap.log
X-Attachment-Id: 11d18427-4c72-4505-9cb0-3a1f0f053110
Content-ID: <11d18427-4c72-4505-9cb0-3a1f0f053110>

--2022-07-20 15:39:42--  http://deb.debian.org/debian/dists/buster/InReleas=
e
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 121566 (119K)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_InRelease=E2=80=99

     0K .......... .......... .......... .......... .......... 42% 11.1M 0s
    50K .......... .......... .......... .......... .......... 84% 26.7M 0s
   100K .......... ........                                   100% 92.2M=3D=
0.006s

2022-07-20 15:39:42 (18.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb=
.debian.org_debian_dists_buster_InRelease=E2=80=99 saved [121566/121566]

gpgv: Signature made Sat 26 Mar 2022 11:37:18 AM UTC
gpgv:                using RSA key 0146DC6D4A0B2914BDED34DB648ACFD622F3D138
gpgv: Good signature from "Debian Archive Automatic Signing Key (10/buster)=
 <ftpmaster@debian.org>"
gpgv: Signature made Sat 26 Mar 2022 11:37:19 AM UTC
gpgv:                using RSA key A7236886F3CCCAAD148A27F80E98404D386FA1D9
gpgv: Can't check signature: No public key
gpgv: Signature made Sat 26 Mar 2022 11:39:30 AM UTC
gpgv:                using RSA key 6D33866EDD8FFA41C0143AEDDCC9EFBF77E11517
gpgv:                issuer "debian-release@lists.debian.org"
gpgv: Good signature from "Debian Stable Release Key (10/buster) <debian-re=
lease@lists.debian.org>"
--2022-07-20 15:39:43--  http://deb.debian.org/debian/dists/buster/main/bin=
ary-arm64/by-hash/SHA256/c07a7dacf0abca663118261f26a389517c80dd0d7ee76c6b4b=
d97a3153decf51
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 7739396 (7.4M)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_main_binary-arm64_Packages.xz=E2=80=99

     0K .......... .......... .......... .......... ..........  0% 11.2M 1s
    50K .......... .......... .......... .......... ..........  1% 27.2M 0s
   100K .......... .......... .......... .......... ..........  1% 15.3M 0s
   150K .......... .......... .......... .......... ..........  2% 43.7M 0s
   200K .......... .......... .......... .......... ..........  3% 19.5M 0s
   250K .......... .......... .......... .......... ..........  3% 63.0M 0s
   300K .......... .......... .......... .......... ..........  4% 68.2M 0s
   350K .......... .......... .......... .......... ..........  5% 94.4M 0s
   400K .......... .......... .......... .......... ..........  5% 92.2M 0s
   450K .......... .......... .......... .......... ..........  6% 51.7M 0s
   500K .......... .......... .......... .......... ..........  7% 61.6M 0s
   550K .......... .......... .......... .......... ..........  7% 52.0M 0s
   600K .......... .......... .......... .......... ..........  8% 99.2M 0s
   650K .......... .......... .......... .......... ..........  9% 93.3M 0s
   700K .......... .......... .......... .......... ..........  9% 96.1M 0s
   750K .......... .......... .......... .......... .......... 10%  102M 0s
   800K .......... .......... .......... .......... .......... 11%  102M 0s
   850K .......... .......... .......... .......... .......... 11% 98.5M 0s
   900K .......... .......... .......... .......... .......... 12% 97.2M 0s
   950K .......... .......... .......... .......... .......... 13%  147M 0s
  1000K .......... .......... .......... .......... .......... 13% 71.8M 0s
  1050K .......... .......... .......... .......... .......... 14% 96.9M 0s
  1100K .......... .......... .......... .......... .......... 15%  101M 0s
  1150K .......... .......... .......... .......... .......... 15% 97.9M 0s
  1200K .......... .......... .......... .......... .......... 16%  165M 0s
  1250K .......... .......... .......... .......... .......... 17%  104M 0s
  1300K .......... .......... .......... .......... .......... 17%  101M 0s
  1350K .......... .......... .......... .......... .......... 18% 98.0M 0s
  1400K .......... .......... .......... .......... .......... 19%  168M 0s
  1450K .......... .......... .......... .......... .......... 19%  102M 0s
  1500K .......... .......... .......... .......... .......... 20%  102M 0s
  1550K .......... .......... .......... .......... .......... 21%  129M 0s
  1600K .......... .......... .......... .......... .......... 21%  120M 0s
  1650K .......... .......... .......... .......... .......... 22% 69.0M 0s
  1700K .......... .......... .......... .......... .......... 23% 94.2M 0s
  1750K .......... .......... .......... .......... .......... 23% 4.82M 0s
  1800K .......... .......... .......... .......... .......... 24% 90.4M 0s
  1850K .......... .......... .......... .......... .......... 25% 51.4M 0s
  1900K .......... .......... .......... .......... .......... 25% 14.6M 0s
  1950K .......... .......... .......... .......... .......... 26% 72.2M 0s
  2000K .......... .......... .......... .......... .......... 27% 13.4M 0s
  2050K .......... .......... .......... .......... .......... 27% 37.7M 0s
  2100K .......... .......... .......... .......... .......... 28% 88.6M 0s
  2150K .......... .......... .......... .......... .......... 29% 37.7M 0s
  2200K .......... .......... .......... .......... .......... 29% 60.8M 0s
  2250K .......... .......... .......... .......... .......... 30% 40.8M 0s
  2300K .......... .......... .......... .......... .......... 31% 70.1M 0s
  2350K .......... .......... .......... .......... .......... 31% 75.2M 0s
  2400K .......... .......... .......... .......... .......... 32% 67.6M 0s
  2450K .......... .......... .......... .......... .......... 33% 58.2M 0s
  2500K .......... .......... .......... .......... .......... 33% 89.8M 0s
  2550K .......... .......... .......... .......... .......... 34% 65.4M 0s
  2600K .......... .......... .......... .......... .......... 35% 51.2M 0s
  2650K .......... .......... .......... .......... .......... 35% 65.9M 0s
  2700K .......... .......... .......... .......... .......... 36%  159M 0s
  2750K .......... .......... .......... .......... .......... 37%  157M 0s
  2800K .......... .......... .......... .......... .......... 37%  108M 0s
  2850K .......... .......... .......... .......... .......... 38% 75.0M 0s
  2900K .......... .......... .......... .......... .......... 39% 90.7M 0s
  2950K .......... .......... .......... .......... .......... 39% 89.0M 0s
  3000K .......... .......... .......... .......... .......... 40% 81.4M 0s
  3050K .......... .......... .......... .......... .......... 41% 89.3M 0s
  3100K .......... .......... .......... .......... .......... 41% 88.9M 0s
  3150K .......... .......... .......... .......... .......... 42% 81.8M 0s
  3200K .......... .......... .......... .......... .......... 43% 70.2M 0s
  3250K .......... .......... .......... .......... .......... 43% 80.2M 0s
  3300K .......... .......... .......... .......... .......... 44%  123M 0s
  3350K .......... .......... .......... .......... .......... 44% 88.7M 0s
  3400K .......... .......... .......... .......... .......... 45% 64.8M 0s
  3450K .......... .......... .......... .......... .......... 46% 65.3M 0s
  3500K .......... .......... .......... .......... .......... 46% 64.6M 0s
  3550K .......... .......... .......... .......... .......... 47% 66.9M 0s
  3600K .......... .......... .......... .......... .......... 48%  108M 0s
  3650K .......... .......... .......... .......... .......... 48%  109M 0s
  3700K .......... .......... .......... .......... .......... 49% 96.4M 0s
  3750K .......... .......... .......... .......... .......... 50% 82.8M 0s
  3800K .......... .......... .......... .......... .......... 50% 89.0M 0s
  3850K .......... .......... .......... .......... .......... 51% 89.1M 0s
  3900K .......... .......... .......... .......... .......... 52% 79.3M 0s
  3950K .......... .......... .......... .......... .......... 52% 82.7M 0s
  4000K .......... .......... .......... .......... .......... 53% 74.4M 0s
  4050K .......... .......... .......... .......... .......... 54% 76.7M 0s
  4100K .......... .......... .......... .......... .......... 54% 89.0M 0s
  4150K .......... .......... .......... .......... .......... 55% 98.2M 0s
  4200K .......... .......... .......... .......... .......... 56% 79.4M 0s
  4250K .......... .......... .......... .......... .......... 56% 98.6M 0s
  4300K .......... .......... .......... .......... .......... 57% 79.5M 0s
  4350K .......... .......... .......... .......... .......... 58% 92.4M 0s
  4400K .......... .......... .......... .......... .......... 58% 89.9M 0s
  4450K .......... .......... .......... .......... .......... 59% 89.1M 0s
  4500K .......... .......... .......... .......... .......... 60% 81.3M 0s
  4550K .......... .......... .......... .......... .......... 60% 89.1M 0s
  4600K .......... .......... .......... .......... .......... 61% 88.1M 0s
  4650K .......... .......... .......... .......... .......... 62% 64.7M 0s
  4700K .......... .......... .......... .......... .......... 62% 50.5M 0s
  4750K .......... .......... .......... .......... .......... 63%  115M 0s
  4800K .......... .......... .......... .......... .......... 64% 61.4M 0s
  4850K .......... .......... .......... .......... .......... 64% 73.3M 0s
  4900K .......... .......... .......... .......... .......... 65% 91.8M 0s
  4950K .......... .......... .......... .......... .......... 66% 74.4M 0s
  5000K .......... .......... .......... .......... .......... 66%  109M 0s
  5050K .......... .......... .......... .......... .......... 67%  102M 0s
  5100K .......... .......... .......... .......... .......... 68% 73.2M 0s
  5150K .......... .......... .......... .......... .......... 68%  110M 0s
  5200K .......... .......... .......... .......... .......... 69% 69.3M 0s
  5250K .......... .......... .......... .......... .......... 70% 99.4M 0s
  5300K .......... .......... .......... .......... .......... 70% 81.6M 0s
  5350K .......... .......... .......... .......... .......... 71% 65.2M 0s
  5400K .......... .......... .......... .......... .......... 72% 88.0M 0s
  5450K .......... .......... .......... .......... .......... 72% 88.9M 0s
  5500K .......... .......... .......... .......... .......... 73% 69.9M 0s
  5550K .......... .......... .......... .......... .......... 74% 61.5M 0s
  5600K .......... .......... .......... .......... .......... 74% 60.9M 0s
  5650K .......... .......... .......... .......... .......... 75% 60.5M 0s
  5700K .......... .......... .......... .......... .......... 76%  109M 0s
  5750K .......... .......... .......... .......... .......... 76% 76.3M 0s
  5800K .......... .......... .......... .......... .......... 77% 88.9M 0s
  5850K .......... .......... .......... .......... .......... 78% 81.4M 0s
  5900K .......... .......... .......... .......... .......... 78% 98.0M 0s
  5950K .......... .......... .......... .......... .......... 79% 81.0M 0s
  6000K .......... .......... .......... .......... .......... 80% 68.6M 0s
  6050K .......... .......... .......... .......... .......... 80% 90.3M 0s
  6100K .......... .......... .......... .......... .......... 81% 74.7M 0s
  6150K .......... .......... .......... .......... .......... 82% 74.7M 0s
  6200K .......... .......... .......... .......... .......... 82%  110M 0s
  6250K .......... .......... .......... .......... .......... 83% 98.2M 0s
  6300K .......... .......... .......... .......... .......... 84% 74.5M 0s
  6350K .......... .......... .......... .......... .......... 84% 46.7M 0s
  6400K .......... .......... .......... .......... .......... 85% 97.6M 0s
  6450K .......... .......... .......... .......... .......... 86% 58.0M 0s
  6500K .......... .......... .......... .......... .......... 86% 70.4M 0s
  6550K .......... .......... .......... .......... .......... 87% 63.5M 0s
  6600K .......... .......... .......... .......... .......... 87% 82.7M 0s
  6650K .......... .......... .......... .......... .......... 88% 82.7M 0s
  6700K .......... .......... .......... .......... .......... 89% 82.0M 0s
  6750K .......... .......... .......... .......... .......... 89% 81.5M 0s
  6800K .......... .......... .......... .......... .......... 90% 75.1M 0s
  6850K .......... .......... .......... .......... .......... 91% 60.9M 0s
  6900K .......... .......... .......... .......... .......... 91%  110M 0s
  6950K .......... .......... .......... .......... .......... 92% 69.5M 0s
  7000K .......... .......... .......... .......... .......... 93% 89.5M 0s
  7050K .......... .......... .......... .......... .......... 93% 54.1M 0s
  7100K .......... .......... .......... .......... .......... 94% 74.8M 0s
  7150K .......... .......... .......... .......... .......... 95% 64.7M 0s
  7200K .......... .......... .......... .......... .......... 95% 83.2M 0s
  7250K .......... .......... .......... .......... .......... 96% 88.7M 0s
  7300K .......... .......... .......... .......... .......... 97% 75.3M 0s
  7350K .......... .......... .......... .......... .......... 97% 89.2M 0s
  7400K .......... .......... .......... .......... .......... 98% 64.5M 0s
  7450K .......... .......... .......... .......... .......... 99% 88.6M 0s
  7500K .......... .......... .......... .......... .......... 99%  111M 0s
  7550K ........                                              100%  157M=3D=
0.1s

2022-07-20 15:39:43 (62.3 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb=
.debian.org_debian_dists_buster_main_binary-arm64_Packages.xz=E2=80=99 save=
d [7739396/7739396]

--2022-07-20 15:39:44--  http://deb.debian.org/debian/dists/buster/contrib/=
binary-arm64/by-hash/SHA256/16790e97d536f892d096261d7b6ac147bd27e428a01eac2=
fe33397fff62f3d21
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 38400 (38K)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_contrib_binary-arm64_Packages.xz=E2=80=99

     0K .......... .......... .......... .......              100%  119M=3D=
0s

2022-07-20 15:39:44 (119 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.=
debian.org_debian_dists_buster_contrib_binary-arm64_Packages.xz=E2=80=99 sa=
ved [38400/38400]

--2022-07-20 15:39:44--  http://deb.debian.org/debian/dists/buster/non-free=
/binary-arm64/by-hash/SHA256/8310401868c970c1626145193d65a657ca55b3b89b7c8e=
8ca4500eed2c37d5e7
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 53856 (53K)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_non-free_binary-arm64_Packages.xz=E2=80=99

     0K .......... .......... .......... .......... .......... 95% 13.5M 0s
    50K ..                                                    100% 4947G=3D=
0.004s

2022-07-20 15:39:44 (14.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb=
.debian.org_debian_dists_buster_non-free_binary-arm64_Packages.xz=E2=80=99 =
saved [53856/53856]

--2022-07-20 15:39:52--  http://deb.debian.org/debian/pool/main/a/acl/libac=
l1_2.2.53-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 29572 (29K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libacl1_2.2.53-4_arm=
64.deb=E2=80=99

     0K .......... .......... ........                        100%  138M=3D=
0s

2022-07-20 15:39:52 (138 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libacl1_2.2.53-4_arm64.deb=E2=80=99 saved [29572/29572]

--2022-07-20 15:39:52--  http://deb.debian.org/debian/pool/main/a/adduser/a=
dduser_3.118_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 240384 (235K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/adduser_3.118_all.de=
b=E2=80=99

     0K .......... .......... .......... .......... .......... 21% 7.72M 0s
    50K .......... .......... .......... .......... .......... 42% 30.3M 0s
   100K .......... .......... .......... .......... .......... 63% 6.56M 0s
   150K .......... .......... .......... .......... .......... 85% 83.3M 0s
   200K .......... .......... .......... ....                 100%  152M=3D=
0.02s

2022-07-20 15:39:53 (14.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/adduser_3.118_all.deb=E2=80=99 saved [240384/240384]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/a/apt/apt_1=
.8.2.3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 1369964 (1.3M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/apt_1.8.2.3_arm64.de=
b=E2=80=99

     0K .......... .......... .......... .......... ..........  3% 4.65M 0s
    50K .......... .......... .......... .......... ..........  7%  102M 0s
   100K .......... .......... .......... .......... .......... 11% 6.03M 0s
   150K .......... .......... .......... .......... .......... 14%  121M 0s
   200K .......... .......... .......... .......... .......... 18% 4.84M 0s
   250K .......... .......... .......... .......... .......... 22%  116M 0s
   300K .......... .......... .......... .......... .......... 26%  112M 0s
   350K .......... .......... .......... .......... .......... 29%  110M 0s
   400K .......... .......... .......... .......... .......... 33%  109M 0s
   450K .......... .......... .......... .......... .......... 37% 13.5M 0s
   500K .......... .......... .......... .......... .......... 41% 31.1M 0s
   550K .......... .......... .......... .......... .......... 44% 8.37M 0s
   600K .......... .......... .......... .......... .......... 48%  126M 0s
   650K .......... .......... .......... .......... .......... 52% 86.4M 0s
   700K .......... .......... .......... .......... .......... 56% 4.87M 0s
   750K .......... .......... .......... .......... .......... 59%  109M 0s
   800K .......... .......... .......... .......... .......... 63%  120M 0s
   850K .......... .......... .......... .......... .......... 67%  110M 0s
   900K .......... .......... .......... .......... .......... 71%  108M 0s
   950K .......... .......... .......... .......... .......... 74% 12.3M 0s
  1000K .......... .......... .......... .......... .......... 78% 62.0M 0s
  1050K .......... .......... .......... .......... .......... 82% 18.8M 0s
  1100K .......... .......... .......... .......... .......... 85% 21.3M 0s
  1150K .......... .......... .......... .......... .......... 89% 9.75M 0s
  1200K .......... .......... .......... .......... .......... 93%  125M 0s
  1250K .......... .......... .......... .......... .......... 97%  110M 0s
  1300K .......... .......... .......... .......              100%  108M=3D=
0.07s

2022-07-20 15:39:53 (18.4 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/apt_1.8.2.3_arm64.deb=E2=80=99 saved [1369964/1369964]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/a/apt/libap=
t-pkg5.0_1.8.2.3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 897308 (876K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libapt-pkg5.0_1.8.2.=
3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5% 2.74M 0s
    50K .......... .......... .......... .......... .......... 11% 34.0M 0s
   100K .......... .......... .......... .......... .......... 17% 6.23M 0s
   150K .......... .......... .......... .......... .......... 22%  121M 0s
   200K .......... .......... .......... .......... .......... 28% 5.58M 0s
   250K .......... .......... .......... .......... .......... 34%  101M 0s
   300K .......... .......... .......... .......... .......... 39% 88.9M 0s
   350K .......... .......... .......... .......... .......... 45%  110M 0s
   400K .......... .......... .......... .......... .......... 51% 17.2M 0s
   450K .......... .......... .......... .......... .......... 57% 24.9M 0s
   500K .......... .......... .......... .......... .......... 62% 8.37M 0s
   550K .......... .......... .......... .......... .......... 68% 97.1M 0s
   600K .......... .......... .......... .......... .......... 74% 90.1M 0s
   650K .......... .......... .......... .......... .......... 79% 6.02M 0s
   700K .......... .......... .......... .......... .......... 85%  113M 0s
   750K .......... .......... .......... .......... .......... 91% 90.8M 0s
   800K .......... .......... .......... .......... .......... 97% 96.7M 0s
   850K .......... .......... ......                          100% 13.8M=3D=
0.06s

2022-07-20 15:39:53 (14.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libapt-pkg5.0_1.8.2.3_arm64.deb=E2=80=99 saved [897308/897308]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/a/attr/liba=
ttr1_2.4.48-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 21260 (21K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libattr1_1%3a2.4.48-=
4_arm64.deb=E2=80=99

     0K .......... ..........                                 100% 13.4M=3D=
0.002s

2022-07-20 15:39:53 (13.4 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libattr1_1%3a2.4.48-4_arm64.deb=E2=80=99 saved [21260/21260]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/a/audit/lib=
audit-common_2.8.4-3_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 22440 (22K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libaudit-common_1%3a=
2.8.4-3_all.deb=E2=80=99

     0K .......... .......... .                               100% 13.8M=3D=
0.002s

2022-07-20 15:39:53 (13.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libaudit-common_1%3a2.8.4-3_all.deb=E2=80=99 saved [22440/22440]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/a/audit/lib=
audit1_2.8.4-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 56612 (55K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libaudit1_1%3a2.8.4-=
3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 90% 12.5M 0s
    50K .....                                                 100% 10081G=
=3D0.004s

2022-07-20 15:39:53 (13.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libaudit1_1%3a2.8.4-3_arm64.deb=E2=80=99 saved [56612/56612]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/b/base-file=
s/base-files_10.3+deb10u12_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 69936 (68K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/base-files_10.3+deb1=
0u12_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 73% 10.3M 0s
    50K .......... ........                                   100% 29.3M=3D=
0.005s

2022-07-20 15:39:53 (12.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/base-files_10.3+deb10u12_arm64.deb=E2=80=99 saved [69936/69936]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/b/base-pass=
wd/base-passwd_3.5.46_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 56268 (55K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/base-passwd_3.5.46_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 90% 8.57M 0s
    50K ....                                                  100%  110M=3D=
0.006s

2022-07-20 15:39:53 (9.35 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/base-passwd_3.5.46_arm64.deb=E2=80=99 saved [56268/56268]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/b/bash/bash=
_5.0-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 1345776 (1.3M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/bash_5.0-4_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... ..........  3% 5.40M 0s
    50K .......... .......... .......... .......... ..........  7%  112M 0s
   100K .......... .......... .......... .......... .......... 11% 5.89M 0s
   150K .......... .......... .......... .......... .......... 15%  108M 0s
   200K .......... .......... .......... .......... .......... 19%  122M 0s
   250K .......... .......... .......... .......... .......... 22% 7.42M 0s
   300K .......... .......... .......... .......... .......... 26%  123M 0s
   350K .......... .......... .......... .......... .......... 30%  107M 0s
   400K .......... .......... .......... .......... .......... 34%  109M 0s
   450K .......... .......... .......... .......... .......... 38%  122M 0s
   500K .......... .......... .......... .......... .......... 41% 28.2M 0s
   550K .......... .......... .......... .......... .......... 45% 72.6M 0s
   600K .......... .......... .......... .......... .......... 49%  111M 0s
   650K .......... .......... .......... .......... .......... 53%  109M 0s
   700K .......... .......... .......... .......... .......... 57%  109M 0s
   750K .......... .......... .......... .......... .......... 60%  108M 0s
   800K .......... .......... .......... .......... .......... 64%  109M 0s
   850K .......... .......... .......... .......... .......... 68% 97.8M 0s
   900K .......... .......... .......... .......... .......... 72% 97.9M 0s
   950K .......... .......... .......... .......... .......... 76%  108M 0s
  1000K .......... .......... .......... .......... .......... 79%  106M 0s
  1050K .......... .......... .......... .......... .......... 83%  111M 0s
  1100K .......... .......... .......... .......... .......... 87%  122M 0s
  1150K .......... .......... .......... .......... .......... 91%  109M 0s
  1200K .......... .......... .......... .......... .......... 95% 98.9M 0s
  1250K .......... .......... .......... .......... .......... 98%  109M 0s
  1300K .......... ....                                       100%  126M=3D=
0.04s

2022-07-20 15:39:53 (35.9 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/bash_5.0-4_arm64.deb=E2=80=99 saved [1345776/1345776]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/b/bzip2/lib=
bz2-1.0_1.0.6-9.2~deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 45520 (44K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libbz2-1.0_1.0.6-9.2=
~deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ....      100% 7.67M=3D=
0.006s

2022-07-20 15:39:53 (7.67 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libbz2-1.0_1.0.6-9.2~deb10u1_arm64.deb=E2=80=99 saved [45520/45520]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/c/cdebconf/=
libdebconfclient0_0.249_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 49176 (48K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libdebconfclient0_0.=
249_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ........  100% 8.56M=3D=
0.005s

2022-07-20 15:39:53 (8.56 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libdebconfclient0_0.249_arm64.deb=E2=80=99 saved [49176/49176]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/c/coreutils=
/coreutils_8.30-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 2646736 (2.5M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/coreutils_8.30-3_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  1% 4.89M 1s
    50K .......... .......... .......... .......... ..........  3%  104M 0s
   100K .......... .......... .......... .......... ..........  5% 6.14M 0s
   150K .......... .......... .......... .......... ..........  7%  119M 0s
   200K .......... .......... .......... .......... ..........  9% 19.2M 0s
   250K .......... .......... .......... .......... .......... 11% 7.64M 0s
   300K .......... .......... .......... .......... .......... 13%  121M 0s
   350K .......... .......... .......... .......... .......... 15%  105M 0s
   400K .......... .......... .......... .......... .......... 17%  116M 0s
   450K .......... .......... .......... .......... .......... 19% 35.2M 0s
   500K .......... .......... .......... .......... .......... 21% 63.0M 0s
   550K .......... .......... .......... .......... .......... 23% 90.9M 0s
   600K .......... .......... .......... .......... .......... 25%  109M 0s
   650K .......... .......... .......... .......... .......... 27% 70.3M 0s
   700K .......... .......... .......... .......... .......... 29% 81.3M 0s
   750K .......... .......... .......... .......... .......... 30% 69.0M 0s
   800K .......... .......... .......... .......... .......... 32% 96.2M 0s
   850K .......... .......... .......... .......... .......... 34% 76.2M 0s
   900K .......... .......... .......... .......... .......... 36% 75.1M 0s
   950K .......... .......... .......... .......... .......... 38% 75.5M 0s
  1000K .......... .......... .......... .......... .......... 40%  100M 0s
  1050K .......... .......... .......... .......... .......... 42%  110M 0s
  1100K .......... .......... .......... .......... .......... 44%  103M 0s
  1150K .......... .......... .......... .......... .......... 46%  109M 0s
  1200K .......... .......... .......... .......... .......... 48%  108M 0s
  1250K .......... .......... .......... .......... .......... 50%  109M 0s
  1300K .......... .......... .......... .......... .......... 52%  101M 0s
  1350K .......... .......... .......... .......... .......... 54% 94.2M 0s
  1400K .......... .......... .......... .......... .......... 56%  112M 0s
  1450K .......... .......... .......... .......... .......... 58% 75.9M 0s
  1500K .......... .......... .......... .......... .......... 59% 80.4M 0s
  1550K .......... .......... .......... .......... .......... 61% 89.9M 0s
  1600K .......... .......... .......... .......... .......... 63% 64.8M 0s
  1650K .......... .......... .......... .......... .......... 65% 98.7M 0s
  1700K .......... .......... .......... .......... .......... 67% 68.5M 0s
  1750K .......... .......... .......... .......... .......... 69%  112M 0s
  1800K .......... .......... .......... .......... .......... 71% 75.2M 0s
  1850K .......... .......... .......... .......... .......... 73% 48.8M 0s
  1900K .......... .......... .......... .......... .......... 75% 75.2M 0s
  1950K .......... .......... .......... .......... .......... 77%  111M 0s
  2000K .......... .......... .......... .......... .......... 79% 97.8M 0s
  2050K .......... .......... .......... .......... .......... 81% 97.9M 0s
  2100K .......... .......... .......... .......... .......... 83% 81.3M 0s
  2150K .......... .......... .......... .......... .......... 85% 97.1M 0s
  2200K .......... .......... .......... .......... .......... 87% 98.8M 0s
  2250K .......... .......... .......... .......... .......... 88%  122M 0s
  2300K .......... .......... .......... .......... .......... 90% 97.7M 0s
  2350K .......... .......... .......... .......... .......... 92%  109M 0s
  2400K .......... .......... .......... .......... .......... 94% 98.1M 0s
  2450K .......... .......... .......... .......... .......... 96%  120M 0s
  2500K .......... .......... .......... .......... .......... 98% 98.3M 0s
  2550K .......... .......... .......... ....                 100%  114M=3D=
0.05s

2022-07-20 15:39:53 (47.3 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/coreutils_8.30-3_arm64.deb=E2=80=99 saved [2646736/2646736]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/c/cyrus-sas=
l2/libsasl2-2_2.1.27+dfsg-1+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 105404 (103K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsasl2-2_2.1.27+df=
sg-1+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 48% 11.4M 0s
    50K .......... .......... .......... .......... .......... 97% 15.3M 0s
   100K ..                                                    100% 5595G=3D=
0.007s

2022-07-20 15:39:53 (13.4 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsasl2-2_2.1.27+dfsg-1+deb10u2_arm64.deb=E2=80=99 saved [105404/105404=
]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/c/cyrus-sas=
l2/libsasl2-modules-db_2.1.27+dfsg-1+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 69388 (68K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsasl2-modules-db_=
2.1.27+dfsg-1+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 73% 11.6M 0s
    50K .......... .......                                    100%  104M=3D=
0.004s

2022-07-20 15:39:53 (15.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsasl2-modules-db_2.1.27+dfsg-1+deb10u2_arm64.deb=E2=80=99 saved [6938=
8/69388]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/d/dash/dash=
_0.5.10.2-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 110360 (108K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/dash_0.5.10.2-5_arm6=
4.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 46% 6.21M 0s
    50K .......... .......... .......... .......... .......... 92%  106M 0s
   100K .......                                               100% 2.31M=3D=
0.01s

2022-07-20 15:39:53 (9.07 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/dash_0.5.10.2-5_arm64.deb=E2=80=99 saved [110360/110360]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/d/db5.3/lib=
db5.3_5.3.28+dfsg1-0.5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 621736 (607K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libdb5.3_5.3.28+dfsg=
1-0.5_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8% 6.02M 0s
    50K .......... .......... .......... .......... .......... 16% 8.79M 0s
   100K .......... .......... .......... .......... .......... 24% 8.23M 0s
   150K .......... .......... .......... .......... .......... 32% 9.05M 0s
   200K .......... .......... .......... .......... .......... 41%  102M 0s
   250K .......... .......... .......... .......... .......... 49%  133M 0s
   300K .......... .......... .......... .......... .......... 57% 5.07M 0s
   350K .......... .......... .......... .......... .......... 65%  110M 0s
   400K .......... .......... .......... .......... .......... 74%  106M 0s
   450K .......... .......... .......... .......... .......... 82%  108M 0s
   500K .......... .......... .......... .......... .......... 90% 11.2M 0s
   550K .......... .......... .......... .......... .......... 98% 24.3M 0s
   600K .......                                               100% 30.7M=3D=
0.04s

2022-07-20 15:39:53 (13.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libdb5.3_5.3.28+dfsg1-0.5_arm64.deb=E2=80=99 saved [621736/621736]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/d/debconf/d=
ebconf_1.5.71+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 144988 (142K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/debconf_1.5.71+deb10=
u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 35% 6.44M 0s
    50K .......... .......... .......... .......... .......... 70%  111M 0s
   100K .......... .......... .......... .......... .         100% 8.46M=3D=
0.01s

2022-07-20 15:39:53 (10.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/debconf_1.5.71+deb10u1_all.deb=E2=80=99 saved [144988/144988]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/d/debian-ar=
chive-keyring/debian-archive-keyring_2019.1+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 93548 (91K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/debian-archive-keyri=
ng_2019.1+deb10u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 54% 9.15M 0s
    50K .......... .......... .......... .......... .         100%  116M=3D=
0.006s

2022-07-20 15:39:53 (15.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/debian-archive-keyring_2019.1+deb10u1_all.deb=E2=80=99 saved [93548/9354=
8]

--2022-07-20 15:39:53--  http://deb.debian.org/debian/pool/main/d/debianuti=
ls/debianutils_4.8.6.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 100364 (98K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/debianutils_4.8.6.1_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 51% 10.6M 0s
    50K .......... .......... .......... .......... ........  100% 12.9M=3D=
0.008s

2022-07-20 15:39:54 (11.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/debianutils_4.8.6.1_arm64.deb=E2=80=99 saved [100364/100364]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/d/diffutils=
/diffutils_3.7-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 362676 (354K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/diffutils_1%3a3.7-3_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 14% 6.99M 0s
    50K .......... .......... .......... .......... .......... 28% 19.2M 0s
   100K .......... .......... .......... .......... .......... 42% 5.18M 0s
   150K .......... .......... .......... .......... .......... 56%  107M 0s
   200K .......... .......... .......... .......... .......... 70%  110M 0s
   250K .......... .......... .......... .......... .......... 84% 7.14M 0s
   300K .......... .......... .......... .......... .......... 98%  106M 0s
   350K ....                                                  100%  108M=3D=
0.03s

2022-07-20 15:39:54 (12.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/diffutils_1%3a3.7-3_arm64.deb=E2=80=99 saved [362676/362676]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/d/dpkg/dpkg=
_1.19.7_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 2193544 (2.1M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/dpkg_1.19.7_arm64.de=
b=E2=80=99

     0K .......... .......... .......... .......... ..........  2% 7.15M 0s
    50K .......... .......... .......... .......... ..........  4% 19.9M 0s
   100K .......... .......... .......... .......... ..........  7% 6.72M 0s
   150K .......... .......... .......... .......... ..........  9%  106M 0s
   200K .......... .......... .......... .......... .......... 11%  108M 0s
   250K .......... .......... .......... .......... .......... 14% 6.12M 0s
   300K .......... .......... .......... .......... .......... 16%  108M 0s
   350K .......... .......... .......... .......... .......... 18%  110M 0s
   400K .......... .......... .......... .......... .......... 21%  107M 0s
   450K .......... .......... .......... .......... .......... 23%  116M 0s
   500K .......... .......... .......... .......... .......... 25% 29.9M 0s
   550K .......... .......... .......... .......... .......... 28% 46.6M 0s
   600K .......... .......... .......... .......... .......... 30% 52.1M 0s
   650K .......... .......... .......... .......... .......... 32% 57.5M 0s
   700K .......... .......... .......... .......... .......... 35% 69.8M 0s
   750K .......... .......... .......... .......... .......... 37% 81.5M 0s
   800K .......... .......... .......... .......... .......... 39% 64.5M 0s
   850K .......... .......... .......... .......... .......... 42% 40.9M 0s
   900K .......... .......... .......... .......... .......... 44% 89.5M 0s
   950K .......... .......... .......... .......... .......... 46%  107M 0s
  1000K .......... .......... .......... .......... .......... 49%  122M 0s
  1050K .......... .......... .......... .......... .......... 51%  111M 0s
  1100K .......... .......... .......... .......... .......... 53% 54.3M 0s
  1150K .......... .......... .......... .......... .......... 56% 88.9M 0s
  1200K .......... .......... .......... .......... .......... 58% 89.4M 0s
  1250K .......... .......... .......... .......... .......... 60%  109M 0s
  1300K .......... .......... .......... .......... .......... 63% 81.3M 0s
  1350K .......... .......... .......... .......... .......... 65% 46.3M 0s
  1400K .......... .......... .......... .......... .......... 67% 69.5M 0s
  1450K .......... .......... .......... .......... .......... 70% 61.6M 0s
  1500K .......... .......... .......... .......... .......... 72%  122M 0s
  1550K .......... .......... .......... .......... .......... 74% 97.6M 0s
  1600K .......... .......... .......... .......... .......... 77% 36.2M 0s
  1650K .......... .......... .......... .......... .......... 79% 51.5M 0s
  1700K .......... .......... .......... .......... .......... 81% 97.8M 0s
  1750K .......... .......... .......... .......... .......... 84%  122M 0s
  1800K .......... .......... .......... .......... .......... 86% 88.4M 0s
  1850K .......... .......... .......... .......... .......... 88% 20.3M 0s
  1900K .......... .......... .......... .......... .......... 91%  110M 0s
  1950K .......... .......... .......... .......... .......... 93%  122M 0s
  2000K .......... .......... .......... .......... .......... 95%  109M 0s
  2050K .......... .......... .......... .......... .......... 98%  107M 0s
  2100K .......... .......... .......... .......... ..        100% 50.8M=3D=
0.05s

2022-07-20 15:39:54 (40.3 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/dpkg_1.19.7_arm64.deb=E2=80=99 saved [2193544/2193544]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/e2fsprogs_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 552276 (539K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/e2fsprogs_1.44.5-1+d=
eb10u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  9% 5.42M 0s
    50K .......... .......... .......... .......... .......... 18% 17.0M 0s
   100K .......... .......... .......... .......... .......... 27% 6.85M 0s
   150K .......... .......... .......... .......... .......... 37% 45.8M 0s
   200K .......... .......... .......... .......... .......... 46% 6.18M 0s
   250K .......... .......... .......... .......... .......... 55%  105M 0s
   300K .......... .......... .......... .......... .......... 64% 89.3M 0s
   350K .......... .......... .......... .......... .......... 74% 99.8M 0s
   400K .......... .......... .......... .......... .......... 83%  109M 0s
   450K .......... .......... .......... .......... .......... 92% 44.4M 0s
   500K .......... .......... .......... .........            100% 70.3M=3D=
0.03s

2022-07-20 15:39:54 (16.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/e2fsprogs_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [552276/552276]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/libcom-err2_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 68248 (67K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libcom-err2_1.44.5-1=
+deb10u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 75% 6.87M 0s
    50K .......... ......                                     100%  121M=3D=
0.007s

2022-07-20 15:39:54 (8.98 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libcom-err2_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [68248/68248]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/libext2fs2_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 213204 (208K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libext2fs2_1.44.5-1+=
deb10u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 24% 4.67M 0s
    50K .......... .......... .......... .......... .......... 48% 25.4M 0s
   100K .......... .......... .......... .......... .......... 72% 5.86M 0s
   150K .......... .......... .......... .......... .......... 96% 23.7M 0s
   200K ........                                              100%  129M=3D=
0.02s

2022-07-20 15:39:54 (8.90 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libext2fs2_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [213204/213204]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/libss2_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 72380 (71K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libss2_1.44.5-1+deb1=
0u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 70% 8.17M 0s
    50K .......... ..........                                 100% 56.1M=3D=
0.006s

2022-07-20 15:39:54 (10.9 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libss2_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [72380/72380]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/f/findutils=
/findutils_4.6.0+git+20190209-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 675808 (660K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/findutils_4.6.0+git+=
20190209-2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7% 6.03M 0s
    50K .......... .......... .......... .......... .......... 15% 33.4M 0s
   100K .......... .......... .......... .......... .......... 22% 7.82M 0s
   150K .......... .......... .......... .......... .......... 30% 6.03M 0s
   200K .......... .......... .......... .......... .......... 37%  109M 0s
   250K .......... .......... .......... .......... .......... 45% 97.2M 0s
   300K .......... .......... .......... .......... .......... 53% 64.8M 0s
   350K .......... .......... .......... .......... .......... 60% 2.99M 0s
   400K .......... .......... .......... .......... .......... 68%  224M 0s
   450K .......... .......... .......... .......... .......... 75% 7.50M 0s
   500K .......... .......... .......... .......... .......... 83%  108M 0s
   550K .......... .......... .......... .......... .......... 90% 6.52M 0s
   600K .......... .......... .......... .......... .......... 98%  110M 0s
   650K .........                                             100% 2.67M=3D=
0.06s

2022-07-20 15:39:54 (10.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/findutils_4.6.0+git+20190209-2_arm64.deb=E2=80=99 saved [675808/675808]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/gcc-8/gcc=
-8-base_8.3.0-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 190532 (186K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gcc-8-base_8.3.0-6_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 26% 5.81M 0s
    50K .......... .......... .......... .......... .......... 53% 61.2M 0s
   100K .......... .......... .......... .......... .......... 80% 7.09M 0s
   150K .......... .......... .......... ......               100%  103M=3D=
0.02s

2022-07-20 15:39:54 (11.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gcc-8-base_8.3.0-6_arm64.deb=E2=80=99 saved [190532/190532]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/gcc-8/lib=
gcc1_8.3.0-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 34400 (34K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgcc1_1%3a8.3.0-6_=
arm64.deb=E2=80=99

     0K .......... .......... .......... ...                  100%  114M=3D=
0s

2022-07-20 15:39:54 (114 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libgcc1_1%3a8.3.0-6_arm64.deb=E2=80=99 saved [34400/34400]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/gcc-8/lib=
stdc++6_8.3.0-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 362944 (354K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libstdc++6_8.3.0-6_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 14% 5.68M 0s
    50K .......... .......... .......... .......... .......... 28% 93.5M 0s
   100K .......... .......... .......... .......... .......... 42% 7.25M 0s
   150K .......... .......... .......... .......... .......... 56% 15.1M 0s
   200K .......... .......... .......... .......... .......... 70% 9.01M 0s
   250K .......... .......... .......... .......... .......... 84%  109M 0s
   300K .......... .......... .......... .......... .......... 98%  125M 0s
   350K ....                                                  100% 72.6M=3D=
0.03s

2022-07-20 15:39:54 (13.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libstdc++6_8.3.0-6_arm64.deb=E2=80=99 saved [362944/362944]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/glibc/lib=
c-bin_2.28-10+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 688920 (673K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libc-bin_2.28-10+deb=
10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7% 4.67M 0s
    50K .......... .......... .......... .......... .......... 14% 4.14M 0s
   100K .......... .......... .......... .......... .......... 22%  156M 0s
   150K .......... .......... .......... .......... .......... 29% 8.64M 0s
   200K .......... .......... .......... .......... .......... 37%  241M 0s
   250K .......... .......... .......... .......... .......... 44% 42.4M 0s
   300K .......... .......... .......... .......... .......... 52% 9.12M 0s
   350K .......... .......... .......... .......... .......... 59% 49.1M 0s
   400K .......... .......... .......... .......... .......... 66% 9.22M 0s
   450K .......... .......... .......... .......... .......... 74% 28.3M 0s
   500K .......... .......... .......... .......... .......... 81% 12.1M 0s
   550K .......... .......... .......... .......... .......... 89% 10.5M 0s
   600K .......... .......... .......... .......... .......... 96% 12.4M 0s
   650K .......... .......... ..                              100% 36.8M=3D=
0.06s

2022-07-20 15:39:54 (11.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libc-bin_2.28-10+deb10u1_arm64.deb=E2=80=99 saved [688920/688920]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/glibc/lib=
c-l10n_2.28-10+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 847360 (828K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libc-l10n_2.28-10+de=
b10u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6% 4.54M 0s
    50K .......... .......... .......... .......... .......... 12%  103M 0s
   100K .......... .......... .......... .......... .......... 18% 5.92M 0s
   150K .......... .......... .......... .......... .......... 24%  112M 0s
   200K .......... .......... .......... .......... .......... 30%  108M 0s
   250K .......... .......... .......... .......... .......... 36% 5.31M 0s
   300K .......... .......... .......... .......... .......... 42% 99.6M 0s
   350K .......... .......... .......... .......... .......... 48% 82.4M 0s
   400K .......... .......... .......... .......... .......... 54% 89.9M 0s
   450K .......... .......... .......... .......... .......... 60% 16.3M 0s
   500K .......... .......... .......... .......... .......... 66% 6.05M 0s
   550K .......... .......... .......... .......... .......... 72%  127M 0s
   600K .......... .......... .......... .......... .......... 78%  106M 0s
   650K .......... .......... .......... .......... .......... 84%  114M 0s
   700K .......... .......... .......... .......... .......... 90% 15.7M 0s
   750K .......... .......... .......... .......... .......... 96% 24.6M 0s
   800K .......... .......... .......                         100%  111M=3D=
0.05s

2022-07-20 15:39:54 (16.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libc-l10n_2.28-10+deb10u1_all.deb=E2=80=99 saved [847360/847360]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/glibc/lib=
c6_2.28-10+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 2520708 (2.4M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libc6_2.28-10+deb10u=
1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  2% 5.42M 0s
    50K .......... .......... .......... .......... ..........  4% 34.3M 0s
   100K .......... .......... .......... .......... ..........  6% 5.72M 0s
   150K .......... .......... .......... .......... ..........  8% 89.2M 0s
   200K .......... .......... .......... .......... .......... 10% 6.37M 0s
   250K .......... .......... .......... .......... .......... 12%  104M 0s
   300K .......... .......... .......... .......... .......... 14% 88.5M 0s
   350K .......... .......... .......... .......... .......... 16%  111M 0s
   400K .......... .......... .......... .......... .......... 18%  108M 0s
   450K .......... .......... .......... .......... .......... 20% 20.3M 0s
   500K .......... .......... .......... .......... .......... 22%  111M 0s
   550K .......... .......... .......... .......... .......... 24% 37.1M 0s
   600K .......... .......... .......... .......... .......... 26% 43.1M 0s
   650K .......... .......... .......... .......... .......... 28% 42.4M 0s
   700K .......... .......... .......... .......... .......... 30%  122M 0s
   750K .......... .......... .......... .......... .......... 32% 40.6M 0s
   800K .......... .......... .......... .......... .......... 34% 57.6M 0s
   850K .......... .......... .......... .......... .......... 36% 74.5M 0s
   900K .......... .......... .......... .......... .......... 38%  125M 0s
   950K .......... .......... .......... .......... .......... 40% 53.6M 0s
  1000K .......... .......... .......... .......... .......... 42%  110M 0s
  1050K .......... .......... .......... .......... .......... 44% 61.6M 0s
  1100K .......... .......... .......... .......... .......... 46% 49.0M 0s
  1150K .......... .......... .......... .......... .......... 48%  109M 0s
  1200K .......... .......... .......... .......... .......... 50% 97.6M 0s
  1250K .......... .......... .......... .......... .......... 52% 57.6M 0s
  1300K .......... .......... .......... .......... .......... 54% 88.7M 0s
  1350K .......... .......... .......... .......... .......... 56% 81.8M 0s
  1400K .......... .......... .......... .......... .......... 58%  108M 0s
  1450K .......... .......... .......... .......... .......... 60% 40.6M 0s
  1500K .......... .......... .......... .......... .......... 62% 98.6M 0s
  1550K .......... .......... .......... .......... .......... 64% 87.3M 0s
  1600K .......... .......... .......... .......... .......... 67% 91.1M 0s
  1650K .......... .......... .......... .......... .......... 69% 88.3M 0s
  1700K .......... .......... .......... .......... .......... 71% 65.2M 0s
  1750K .......... .......... .......... .......... .......... 73% 60.4M 0s
  1800K .......... .......... .......... .......... .......... 75% 69.9M 0s
  1850K .......... .......... .......... .......... .......... 77%  111M 0s
  1900K .......... .......... .......... .......... .......... 79%  108M 0s
  1950K .......... .......... .......... .......... .......... 81%  109M 0s
  2000K .......... .......... .......... .......... .......... 83% 97.1M 0s
  2050K .......... .......... .......... .......... .......... 85% 57.7M 0s
  2100K .......... .......... .......... .......... .......... 87%  107M 0s
  2150K .......... .......... .......... .......... .......... 89% 76.3M 0s
  2200K .......... .......... .......... .......... .......... 91% 65.0M 0s
  2250K .......... .......... .......... .......... .......... 93% 75.3M 0s
  2300K .......... .......... .......... .......... .......... 95% 57.6M 0s
  2350K .......... .......... .......... .......... .......... 97%  109M 0s
  2400K .......... .......... .......... .......... .......... 99% 75.1M 0s
  2450K .......... .                                          100%  111M=3D=
0.06s

2022-07-20 15:39:54 (41.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libc6_2.28-10+deb10u1_arm64.deb=E2=80=99 saved [2520708/2520708]

--2022-07-20 15:39:54--  http://deb.debian.org/debian/pool/main/g/glibc/loc=
ales_2.28-10+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 4056868 (3.9M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/locales_2.28-10+deb1=
0u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  1% 2.90M 1s
    50K .......... .......... .......... .......... ..........  2%  111M 1s
   100K .......... .......... .......... .......... ..........  3% 6.99M 1s
   150K .......... .......... .......... .......... ..........  5%  103M 0s
   200K .......... .......... .......... .......... ..........  6% 11.7M 0s
   250K .......... .......... .......... .......... ..........  7% 14.4M 0s
   300K .......... .......... .......... .......... ..........  8% 81.7M 0s
   350K .......... .......... .......... .......... .......... 10% 8.45M 0s
   400K .......... .......... .......... .......... .......... 11%  122M 0s
   450K .......... .......... .......... .......... .......... 12% 12.8M 0s
   500K .......... .......... .......... .......... .......... 13% 15.3M 0s
   550K .......... .......... .......... .......... .......... 15% 30.4M 0s
   600K .......... .......... .......... .......... .......... 16% 33.8M 0s
   650K .......... .......... .......... .......... .......... 17% 6.14M 0s
   700K .......... .......... .......... .......... .......... 18%  106M 0s
   750K .......... .......... .......... .......... .......... 20% 89.1M 0s
   800K .......... .......... .......... .......... .......... 21% 13.4M 0s
   850K .......... .......... .......... .......... .......... 22% 47.7M 0s
   900K .......... .......... .......... .......... .......... 23% 19.4M 0s
   950K .......... .......... .......... .......... .......... 25% 36.4M 0s
  1000K .......... .......... .......... .......... .......... 26% 16.2M 0s
  1050K .......... .......... .......... .......... .......... 27% 16.1M 0s
  1100K .......... .......... .......... .......... .......... 29% 97.6M 0s
  1150K .......... .......... .......... .......... .......... 30% 17.3M 0s
  1200K .......... .......... .......... .......... .......... 31% 5.61M 0s
  1250K .......... .......... .......... .......... .......... 32%  110M 0s
  1300K .......... .......... .......... .......... .......... 34%  109M 0s
  1350K .......... .......... .......... .......... .......... 35%  121M 0s
  1400K .......... .......... .......... .......... .......... 36% 9.88M 0s
  1450K .......... .......... .......... .......... .......... 37% 20.7M 0s
  1500K .......... .......... .......... .......... .......... 39% 19.3M 0s
  1550K .......... .......... .......... .......... .......... 40% 25.0M 0s
  1600K .......... .......... .......... .......... .......... 41% 10.2M 0s
  1650K .......... .......... .......... .......... .......... 42%  127M 0s
  1700K .......... .......... .......... .......... .......... 44%  115M 0s
  1750K .......... .......... .......... .......... .......... 45% 5.23M 0s
  1800K .......... .......... .......... .......... .......... 46%  123M 0s
  1850K .......... .......... .......... .......... .......... 47%  109M 0s
  1900K .......... .......... .......... .......... .......... 49%  106M 0s
  1950K .......... .......... .......... .......... .......... 50% 13.6M 0s
  2000K .......... .......... .......... .......... .......... 51% 23.1M 0s
  2050K .......... .......... .......... .......... .......... 53% 6.96M 0s
  2100K .......... .......... .......... .......... .......... 54%  110M 0s
  2150K .......... .......... .......... .......... .......... 55%  108M 0s
  2200K .......... .......... .......... .......... .......... 56%  123M 0s
  2250K .......... .......... .......... .......... .......... 58% 4.84M 0s
  2300K .......... .......... .......... .......... .......... 59%  109M 0s
  2350K .......... .......... .......... .......... .......... 60%  112M 0s
  2400K .......... .......... .......... .......... .......... 61% 92.0M 0s
  2450K .......... .......... .......... .......... .......... 63% 18.0M 0s
  2500K .......... .......... .......... .......... .......... 64% 23.7M 0s
  2550K .......... .......... .......... .......... .......... 65% 7.15M 0s
  2600K .......... .......... .......... .......... .......... 66%  100M 0s
  2650K .......... .......... .......... .......... .......... 68% 70.5M 0s
  2700K .......... .......... .......... .......... .......... 69% 97.3M 0s
  2750K .......... .......... .......... .......... .......... 70% 13.6M 0s
  2800K .......... .......... .......... .......... .......... 71% 7.25M 0s
  2850K .......... .......... .......... .......... .......... 73% 98.7M 0s
  2900K .......... .......... .......... .......... .......... 74% 98.7M 0s
  2950K .......... .......... .......... .......... .......... 75% 94.1M 0s
  3000K .......... .......... .......... .......... .......... 76% 4.35M 0s
  3050K .......... .......... .......... .......... .......... 78%  110M 0s
  3100K .......... .......... .......... .......... .......... 79%  109M 0s
  3150K .......... .......... .......... .......... .......... 80%  110M 0s
  3200K .......... .......... .......... .......... .......... 82%  122M 0s
  3250K .......... .......... .......... .......... .......... 83% 5.06M 0s
  3300K .......... .......... .......... .......... .......... 84%  125M 0s
  3350K .......... .......... .......... .......... .......... 85%  108M 0s
  3400K .......... .......... .......... .......... .......... 87%  110M 0s
  3450K .......... .......... .......... .......... .......... 88%  106M 0s
  3500K .......... .......... .......... .......... .......... 89%  127M 0s
  3550K .......... .......... .......... .......... .......... 90% 24.3M 0s
  3600K .......... .......... .......... .......... .......... 92% 49.4M 0s
  3650K .......... .......... .......... .......... .......... 93% 28.6M 0s
  3700K .......... .......... .......... .......... .......... 94% 41.1M 0s
  3750K .......... .......... .......... .......... .......... 95% 33.8M 0s
  3800K .......... .......... .......... .......... .......... 97% 98.5M 0s
  3850K .......... .......... .......... .......... .......... 98%  120M 0s
  3900K .......... .......... .......... .......... .......... 99% 65.0M 0s
  3950K .......... .                                          100%  116M=3D=
0.2s

2022-07-20 15:39:55 (19.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/locales_2.28-10+deb10u1_all.deb=E2=80=99 saved [4056868/4056868]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gmp/libgm=
p10_6.1.2+dfsg-4+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 226168 (221K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgmp10_2%3a6.1.2+d=
fsg-4+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 22% 7.97M 0s
    50K .......... .......... .......... .......... .......... 45% 30.9M 0s
   100K .......... .......... .......... .......... .......... 67% 7.04M 0s
   150K .......... .......... .......... .......... .......... 90%  109M 0s
   200K .......... ..........                                 100% 25.3M=3D=
0.02s

2022-07-20 15:39:55 (13.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libgmp10_2%3a6.1.2+dfsg-4+deb10u1_arm64.deb=E2=80=99 saved [226168/22616=
8]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/di=
rmngr_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 694456 (678K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/dirmngr_2.2.12-1+deb=
10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7% 4.80M 0s
    50K .......... .......... .......... .......... .......... 14% 10.7M 0s
   100K .......... .......... .......... .......... .......... 22% 23.7M 0s
   150K .......... .......... .......... .......... .......... 29% 6.48M 0s
   200K .......... .......... .......... .......... .......... 36% 17.4M 0s
   250K .......... .......... .......... .......... .......... 44%  108M 0s
   300K .......... .......... .......... .......... .......... 51% 3.33M 0s
   350K .......... .......... .......... .......... .......... 58%  109M 0s
   400K .......... .......... .......... .......... .......... 66%  109M 0s
   450K .......... .......... .......... .......... .......... 73%  123M 0s
   500K .......... .......... .......... .......... .......... 81%  109M 0s
   550K .......... .......... .......... .......... .......... 88%  106M 0s
   600K .......... .......... .......... .......... .......... 95%  206K 0s
   650K .......... .......... ........                        100%  242M=3D=
0.3s

2022-07-20 15:39:55 (2.31 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/dirmngr_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [694456/694456]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gn=
upg_2.2.12-1+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:4::=
644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 715372 (699K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gnupg_2.2.12-1+deb10=
u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7% 6.09M 0s
    50K .......... .......... .......... .......... .......... 14% 28.3M 0s
   100K .......... .......... .......... .......... .......... 21% 5.72M 0s
   150K .......... .......... .......... .......... .......... 28%  104M 0s
   200K .......... .......... .......... .......... .......... 35%  101M 0s
   250K .......... .......... .......... .......... .......... 42% 6.19M 0s
   300K .......... .......... .......... .......... .......... 50% 84.5M 0s
   350K .......... .......... .......... .......... .......... 57% 60.1M 0s
   400K .......... .......... .......... .......... .......... 64% 70.8M 0s
   450K .......... .......... .......... .......... .......... 71% 32.7M 0s
   500K .......... .......... .......... .......... .......... 78% 96.7M 0s
   550K .......... .......... .......... .......... .......... 85% 93.1M 0s
   600K .......... .......... .......... .......... .......... 93% 62.7M 0s
   650K .......... .......... .......... .......... ........  100% 65.1M=3D=
0.03s

2022-07-20 15:39:55 (20.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gnupg_2.2.12-1+deb10u1_all.deb=E2=80=99 saved [715372/715372]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gn=
upg-l10n_2.2.12-1+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1009612 (986K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gnupg-l10n_2.2.12-1+=
deb10u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5% 9.86M 0s
    50K .......... .......... .......... .......... .......... 10% 19.6M 0s
   100K .......... .......... .......... .......... .......... 15% 6.28M 0s
   150K .......... .......... .......... .......... .......... 20% 97.2M 0s
   200K .......... .......... .......... .......... .......... 25% 5.39M 0s
   250K .......... .......... .......... .......... .......... 30%  113M 0s
   300K .......... .......... .......... .......... .......... 35%  123M 0s
   350K .......... .......... .......... .......... .......... 40%  105M 0s
   400K .......... .......... .......... .......... .......... 45%  110M 0s
   450K .......... .......... .......... .......... .......... 50%  109M 0s
   500K .......... .......... .......... .......... .......... 55% 18.1M 0s
   550K .......... .......... .......... .......... .......... 60% 76.0M 0s
   600K .......... .......... .......... .......... .......... 65%  108M 0s
   650K .......... .......... .......... .......... .......... 70%  124M 0s
   700K .......... .......... .......... .......... .......... 76% 97.7M 0s
   750K .......... .......... .......... .......... .......... 81% 89.1M 0s
   800K .......... .......... .......... .......... .......... 86%  108M 0s
   850K .......... .......... .......... .......... .......... 91%  103M 0s
   900K .......... .......... .......... .......... .......... 96% 47.3M 0s
   950K .......... .......... .......... .....                100% 41.3M=3D=
0.04s

2022-07-20 15:39:55 (27.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gnupg-l10n_2.2.12-1+deb10u1_all.deb=E2=80=99 saved [1009612/1009612]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gn=
upg-utils_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 823732 (804K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gnupg-utils_2.2.12-1=
+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6% 4.85M 0s
    50K .......... .......... .......... .......... .......... 12%  111M 0s
   100K .......... .......... .......... .......... .......... 18% 7.25M 0s
   150K .......... .......... .......... .......... .......... 24% 20.3M 0s
   200K .......... .......... .......... .......... .......... 31% 25.7M 0s
   250K .......... .......... .......... .......... .......... 37% 20.5M 0s
   300K .......... .......... .......... .......... .......... 43% 19.1M 0s
   350K .......... .......... .......... .......... .......... 49% 22.0M 0s
   400K .......... .......... .......... .......... .......... 55%  138M 0s
   450K .......... .......... .......... .......... .......... 62% 20.2M 0s
   500K .......... .......... .......... .......... .......... 68% 16.1M 0s
   550K .......... .......... .......... .......... .......... 74% 88.2M 0s
   600K .......... .......... .......... .......... .......... 80% 98.7M 0s
   650K .......... .......... .......... .......... .......... 87% 57.0M 0s
   700K .......... .......... .......... .......... .......... 93%  123M 0s
   750K .......... .......... .......... .......... .......... 99%  238M 0s
   800K ....                                                  100%  134M=3D=
0.04s

2022-07-20 15:39:55 (21.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gnupg-utils_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [823732/823732]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 826660 (807K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg_2.2.12-1+deb10u1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6% 7.47M 0s
    50K .......... .......... .......... .......... .......... 12% 26.6M 0s
   100K .......... .......... .......... .......... .......... 18% 6.57M 0s
   150K .......... .......... .......... .......... .......... 24% 97.1M 0s
   200K .......... .......... .......... .......... .......... 30% 89.4M 0s
   250K .......... .......... .......... .......... .......... 37% 6.05M 0s
   300K .......... .......... .......... .......... .......... 43%  123M 0s
   350K .......... .......... .......... .......... .......... 49%  107M 0s
   400K .......... .......... .......... .......... .......... 55% 78.6M 0s
   450K .......... .......... .......... .......... .......... 61%  117M 0s
   500K .......... .......... .......... .......... .......... 68% 37.6M 0s
   550K .......... .......... .......... .......... .......... 74% 82.2M 0s
   600K .......... .......... .......... .......... .......... 80%  107M 0s
   650K .......... .......... .......... .......... .......... 86%  100M 0s
   700K .......... .......... .......... .......... .......... 92% 89.4M 0s
   750K .......... .......... .......... .......... .......... 99% 52.2M 0s
   800K .......                                               100%  130M=3D=
0.03s

2022-07-20 15:39:55 (25.3 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [826660/826660]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g-agent_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 601444 (587K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg-agent_2.2.12-1+d=
eb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8% 6.36M 0s
    50K .......... .......... .......... .......... .......... 17% 30.5M 0s
   100K .......... .......... .......... .......... .......... 25% 6.63M 0s
   150K .......... .......... .......... .......... .......... 34% 73.6M 0s
   200K .......... .......... .......... .......... .......... 42% 7.15M 0s
   250K .......... .......... .......... .......... .......... 51%  109M 0s
   300K .......... .......... .......... .......... .......... 59% 93.2M 0s
   350K .......... .......... .......... .......... .......... 68%  152M 0s
   400K .......... .......... .......... .......... .......... 76% 75.0M 0s
   450K .......... .......... .......... .......... .......... 85% 29.1M 0s
   500K .......... .......... .......... .......... .......... 93%  104M 0s
   550K .......... .......... .......... .......              100% 81.4M=3D=
0.03s

2022-07-20 15:39:55 (20.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg-agent_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [601444/601444]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g-wks-client_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 478380 (467K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg-wks-client_2.2.1=
2-1+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10% 6.69M 0s
    50K .......... .......... .......... .......... .......... 21% 15.0M 0s
   100K .......... .......... .......... .......... .......... 32% 11.7M 0s
   150K .......... .......... .......... .......... .......... 42%  109M 0s
   200K .......... .......... .......... .......... .......... 53% 5.38M 0s
   250K .......... .......... .......... .......... .......... 64%  103M 0s
   300K .......... .......... .......... .......... .......... 74%  104M 0s
   350K .......... .......... .......... .......... .......... 85%  103M 0s
   400K .......... .......... .......... .......... .......... 96%  151M 0s
   450K .......... .......                                    100% 11.8M=3D=
0.03s

2022-07-20 15:39:55 (16.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg-wks-client_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [478380/478380]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g-wks-server_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 471652 (461K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg-wks-server_2.2.1=
2-1+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10% 6.19M 0s
    50K .......... .......... .......... .......... .......... 21% 32.2M 0s
   100K .......... .......... .......... .......... .......... 32% 7.55M 0s
   150K .......... .......... .......... .......... .......... 43% 6.38M 0s
   200K .......... .......... .......... .......... .......... 54%  112M 0s
   250K .......... .......... .......... .......... .......... 65%  107M 0s
   300K .......... .......... .......... .......... .......... 75%  110M 0s
   350K .......... .......... .......... .......... .......... 86%  123M 0s
   400K .......... .......... .......... .......... .......... 97% 9.14M 0s
   450K ..........                                            100%  102M=3D=
0.03s

2022-07-20 15:39:55 (14.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg-wks-server_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [471652/471652]

--2022-07-20 15:39:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
gconf_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 503196 (491K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpgconf_2.2.12-1+deb=
10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10% 6.62M 0s
    50K .......... .......... .......... .......... .......... 20% 8.63M 0s
   100K .......... .......... .......... .......... .......... 30%  107M 0s
   150K .......... .......... .......... .......... .......... 40% 5.22M 0s
   200K .......... .......... .......... .......... .......... 50%  105M 0s
   250K .......... .......... .......... .......... .......... 61% 95.2M 0s
   300K .......... .......... .......... .......... .......... 71% 6.71M 0s
   350K .......... .......... .......... .......... .......... 81%  110M 0s
   400K .......... .......... .......... .......... .......... 91%  115M 0s
   450K .......... .......... .......... .......... .         100%  116M=3D=
0.03s

2022-07-20 15:39:56 (14.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpgconf_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [503196/503196]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
gsm_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 586612 (573K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpgsm_2.2.12-1+deb10=
u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8% 5.84M 0s
    50K .......... .......... .......... .......... .......... 17%  118M 0s
   100K .......... .......... .......... .......... .......... 26% 8.53M 0s
   150K .......... .......... .......... .......... .......... 34% 4.65M 0s
   200K .......... .......... .......... .......... .......... 43% 79.1M 0s
   250K .......... .......... .......... .......... .......... 52%  155M 0s
   300K .......... .......... .......... .......... .......... 61%  102M 0s
   350K .......... .......... .......... .......... .......... 69% 8.82M 0s
   400K .......... .......... .......... .......... .......... 78%  113M 0s
   450K .......... .......... .......... .......... .......... 87%  107M 0s
   500K .......... .......... .......... .......... .......... 96%  125M 0s
   550K .......... .......... ..                              100%  111M=3D=
0.03s

2022-07-20 15:39:56 (16.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpgsm_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [586612/586612]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
gv_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 569288 (556K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpgv_2.2.12-1+deb10u=
1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8% 1.40M 0s
    50K .......... .......... .......... .......... .......... 17% 31.0M 0s
   100K .......... .......... .......... .......... .......... 26% 9.88M 0s
   150K .......... .......... .......... .......... .......... 35% 5.86M 0s
   200K .......... .......... .......... .......... .......... 44%  114M 0s
   250K .......... .......... .......... .......... .......... 53%  109M 0s
   300K .......... .......... .......... .......... .......... 62% 7.21M 0s
   350K .......... .......... .......... .......... .......... 71% 98.3M 0s
   400K .......... .......... .......... .......... .......... 80%  167M 0s
   450K .......... .......... .......... .......... .......... 89% 97.8M 0s
   500K .......... .......... .......... .......... .......... 98%  101M 0s
   550K .....                                                 100% 11340G=
=3D0.06s

2022-07-20 15:39:56 (9.19 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpgv_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [569288/569288]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/g/gnutls28/=
libgnutls30_3.6.7-4+deb10u7_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 1062320 (1.0M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgnutls30_3.6.7-4+=
deb10u7_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  4% 6.53M 0s
    50K .......... .......... .......... .......... ..........  9% 25.8M 0s
   100K .......... .......... .......... .......... .......... 14% 6.39M 0s
   150K .......... .......... .......... .......... .......... 19% 54.4M 0s
   200K .......... .......... .......... .......... .......... 24% 6.00M 0s
   250K .......... .......... .......... .......... .......... 28% 97.8M 0s
   300K .......... .......... .......... .......... .......... 33% 89.3M 0s
   350K .......... .......... .......... .......... .......... 38%  108M 0s
   400K .......... .......... .......... .......... .......... 43%  108M 0s
   450K .......... .......... .......... .......... .......... 48%  110M 0s
   500K .......... .......... .......... .......... .......... 53% 37.0M 0s
   550K .......... .......... .......... .......... .......... 57%  111M 0s
   600K .......... .......... .......... .......... .......... 62%  110M 0s
   650K .......... .......... .......... .......... .......... 67% 82.9M 0s
   700K .......... .......... .......... .......... .......... 72% 72.9M 0s
   750K .......... .......... .......... .......... .......... 77% 77.5M 0s
   800K .......... .......... .......... .......... .......... 81% 48.8M 0s
   850K .......... .......... .......... .......... .......... 86% 61.2M 0s
   900K .......... .......... .......... .......... .......... 91% 98.7M 0s
   950K .......... .......... .......... .......... .......... 96% 56.9M 0s
  1000K .......... .......... .......... .......              100% 73.4M=3D=
0.04s

2022-07-20 15:39:56 (28.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libgnutls30_3.6.7-4+deb10u7_arm64.deb=E2=80=99 saved [1062320/1062320]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/g/grep/grep=
_3.3-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 365884 (357K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/grep_3.3-1_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 13% 6.43M 0s
    50K .......... .......... .......... .......... .......... 27% 9.81M 0s
   100K .......... .......... .......... .......... .......... 41% 9.23M 0s
   150K .......... .......... .......... .......... .......... 55%  107M 0s
   200K .......... .......... .......... .......... .......... 69% 6.55M 0s
   250K .......... .......... .......... .......... .......... 83%  115M 0s
   300K .......... .......... .......... .......... .......... 97%  109M 0s
   350K .......                                               100%  140M=3D=
0.03s

2022-07-20 15:39:56 (13.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/grep_3.3-1_arm64.deb=E2=80=99 saved [365884/365884]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/g/gzip/gzip=
_1.9-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 126128 (123K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gzip_1.9-3_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 40% 7.16M 0s
    50K .......... .......... .......... .......... .......... 81% 31.5M 0s
   100K .......... .......... ...                             100% 5.45M=3D=
0.01s

2022-07-20 15:39:56 (9.60 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gzip_1.9-3_arm64.deb=E2=80=99 saved [126128/126128]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/h/hostname/=
hostname_3.21_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 14460 (14K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/hostname_3.21_arm64.=
deb=E2=80=99

     0K .......... ....                                       100%  307M=3D=
0s

2022-07-20 15:39:56 (307 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/hostname_3.21_arm64.deb=E2=80=99 saved [14460/14460]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/i/init-syst=
em-helpers/init-system-helpers_1.56+nmu1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 46832 (46K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/init-system-helpers_=
1.56+nmu1_all.deb=E2=80=99

     0K .......... .......... .......... .......... .....     100% 8.46M=3D=
0.005s

2022-07-20 15:39:56 (8.46 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/init-system-helpers_1.56+nmu1_all.deb=E2=80=99 saved [46832/46832]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/liba/libass=
uan/libassuan0_2.5.2-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 47052 (46K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libassuan0_2.5.2-1_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .....     100% 10.1M=3D=
0.004s

2022-07-20 15:39:56 (10.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libassuan0_2.5.2-1_arm64.deb=E2=80=99 saved [47052/47052]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libc/libcap=
-ng/libcap-ng0_0.7.9-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 13848 (14K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libcap-ng0_0.7.9-2_a=
rm64.deb=E2=80=99

     0K .......... ...                                        100% 11.9M=3D=
0.001s

2022-07-20 15:39:56 (11.9 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libcap-ng0_0.7.9-2_arm64.deb=E2=80=99 saved [13848/13848]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libf/libffi=
/libffi6_3.2.1-9_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 19340 (19K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libffi6_3.2.1-9_arm6=
4.deb=E2=80=99

     0K .......... ........                                   100%  218M=3D=
0s

2022-07-20 15:39:56 (218 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libffi6_3.2.1-9_arm64.deb=E2=80=99 saved [19340/19340]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libg/libgcr=
ypt20/libgcrypt20_1.8.4-5+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 488232 (477K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgcrypt20_1.8.4-5+=
deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10% 7.31M 0s
    50K .......... .......... .......... .......... .......... 20% 30.6M 0s
   100K .......... .......... .......... .......... .......... 31% 5.56M 0s
   150K .......... .......... .......... .......... .......... 41%  107M 0s
   200K .......... .......... .......... .......... .......... 52% 6.21M 0s
   250K .......... .......... .......... .......... .......... 62% 67.8M 0s
   300K .......... .......... .......... .......... .......... 73% 75.6M 0s
   350K .......... .......... .......... .......... .......... 83%  110M 0s
   400K .......... .......... .......... .......... .......... 94% 96.7M 0s
   450K .......... .......... ......                          100% 75.2M=3D=
0.03s

2022-07-20 15:39:56 (16.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libgcrypt20_1.8.4-5+deb10u1_arm64.deb=E2=80=99 saved [488232/488232]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libg/libgpg=
-error/libgpg-error0_1.35-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 68396 (67K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgpg-error0_1.35-1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 74% 8.04M 0s
    50K .......... ......                                     100%  107M=3D=
0.006s

2022-07-20 15:39:56 (10.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libgpg-error0_1.35-1_arm64.deb=E2=80=99 saved [68396/68396]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libi/libidn=
2/libidn2-0_2.0.5-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 75640 (74K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libidn2-0_2.0.5-1+de=
b10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 67% 6.30M 0s
    50K .......... .......... ...                             100% 84.1M=3D=
0.008s

2022-07-20 15:39:56 (8.98 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libidn2-0_2.0.5-1+deb10u1_arm64.deb=E2=80=99 saved [75640/75640]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libk/libksb=
a/libksba8_1.3.5-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 84690 (83K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libksba8_1.3.5-2_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 60% 7.77M 0s
    50K .......... .......... .......... ..                   100% 33.7M=3D=
0.007s

2022-07-20 15:39:56 (11.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libksba8_1.3.5-2_arm64.deb=E2=80=99 saved [84690/84690]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libs/libsec=
comp/libseccomp2_2.3.3-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 39468 (39K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libseccomp2_2.3.3-4_=
arm64.deb=E2=80=99

     0K .......... .......... .......... ........             100% 17.9M=3D=
0.002s

2022-07-20 15:39:56 (17.9 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libseccomp2_2.3.3-4_arm64.deb=E2=80=99 saved [39468/39468]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libs/libsel=
inux/libselinux1_2.8-1+b1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 76084 (74K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libselinux1_2.8-1+b1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 67% 6.85M 0s
    50K .......... .......... ....                            100% 57.7M=3D=
0.008s

2022-07-20 15:39:56 (9.63 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libselinux1_2.8-1+b1_arm64.deb=E2=80=99 saved [76084/76084]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libs/libsem=
anage/libsemanage-common_2.8-2_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 17664 (17K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsemanage-common_2=
.8-2_all.deb=E2=80=99

     0K .......... .......                                    100%  233M=3D=
0s

2022-07-20 15:39:56 (233 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsemanage-common_2.8-2_all.deb=E2=80=99 saved [17664/17664]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libs/libsem=
anage/libsemanage1_2.8-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:4::=
644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 90452 (88K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsemanage1_2.8-2_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 56% 4.30M 0s
    50K .......... .......... .......... ........             100%  121M=3D=
0.01s

2022-07-20 15:39:56 (7.39 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsemanage1_2.8-2_arm64.deb=E2=80=99 saved [90452/90452]

--2022-07-20 15:39:56--  http://deb.debian.org/debian/pool/main/libs/libsep=
ol/libsepol1_2.8-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 217368 (212K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsepol1_2.8-1_arm6=
4.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23% 5.86M 0s
    50K .......... .......... .......... .......... .......... 47%  381K 0s
   100K .......... .......... .......... .......... .......... 70%  262M 0s
   150K .......... .......... .......... .......... .......... 94%  271M 0s
   200K .......... ..                                         100%  183M=3D=
0.1s

2022-07-20 15:39:57 (1.48 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsepol1_2.8-1_arm64.deb=E2=80=99 saved [217368/217368]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/libt/libtas=
n1-6/libtasn1-6_4.13-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 47820 (47K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libtasn1-6_4.13-3_ar=
m64.deb=E2=80=99

     0K .......... .......... .......... .......... ......    100% 11.9M=3D=
0.004s

2022-07-20 15:39:57 (11.9 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libtasn1-6_4.13-3_arm64.deb=E2=80=99 saved [47820/47820]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/libu/libuni=
string/libunistring2_0.9.10-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:4::=
644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 363068 (355K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libunistring2_0.9.10=
-1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 14% 7.32M 0s
    50K .......... .......... .......... .......... .......... 28% 20.4M 0s
   100K .......... .......... .......... .......... .......... 42% 8.41M 0s
   150K .......... .......... .......... .......... .......... 56% 31.8M 0s
   200K .......... .......... .......... .......... .......... 70% 14.4M 0s
   250K .......... .......... .......... .......... .......... 84%  121M 0s
   300K .......... .......... .......... .......... .......... 98% 34.6M 0s
   350K ....                                                  100% 82.0M=3D=
0.02s

2022-07-20 15:39:57 (16.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libunistring2_0.9.10-1_arm64.deb=E2=80=99 saved [363068/363068]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/libz/libzst=
d/libzstd1_1.3.8+dfsg-3+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 215692 (211K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libzstd1_1.3.8+dfsg-=
3+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23% 6.34M 0s
    50K .......... .......... .......... .......... .......... 47%  100M 0s
   100K .......... .......... .......... .......... .......... 71% 6.27M 0s
   150K .......... .......... .......... .......... .......... 94%  122M 0s
   200K ..........                                            100% 99.2M=3D=
0.02s

2022-07-20 15:39:57 (12.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libzstd1_1.3.8+dfsg-3+deb10u2_arm64.deb=E2=80=99 saved [215692/215692]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/l/lsb/lsb-b=
ase_10.2019051400_all.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 28416 (28K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/lsb-base_10.20190514=
00_all.deb=E2=80=99

     0K .......... .......... .......                         100%  123M=3D=
0s

2022-07-20 15:39:57 (123 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/lsb-base_10.2019051400_all.deb=E2=80=99 saved [28416/28416]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/l/lz4/liblz=
4-1_1.8.3-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 50220 (49K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/liblz4-1_1.8.3-1+deb=
10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ......... 100% 2.81M=3D=
0.02s

2022-07-20 15:39:57 (2.81 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/liblz4-1_1.8.3-1+deb10u1_arm64.deb=E2=80=99 saved [50220/50220]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/m/mawk/mawk=
_1.3.3-17+b3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 76916 (75K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/mawk_1.3.3-17+b3_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 66% 10.9M 0s
    50K .......... .......... .....                           100%  114M=3D=
0.005s

2022-07-20 15:39:57 (15.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/mawk_1.3.3-17+b3_arm64.deb=E2=80=99 saved [76916/76916]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/ncurses/l=
ibncursesw6_6.1+20181013-2+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 120160 (117K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libncursesw6_6.1+201=
81013-2+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 42% 5.22M 0s
    50K .......... .......... .......... .......... .......... 85%  153M 0s
   100K .......... .......                                    100% 3.82M=3D=
0.01s

2022-07-20 15:39:57 (8.12 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libncursesw6_6.1+20181013-2+deb10u2_arm64.deb=E2=80=99 saved [120160/120=
160]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/ncurses/l=
ibtinfo6_6.1+20181013-2+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 320920 (313K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libtinfo6_6.1+201810=
13-2+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 15% 6.10M 0s
    50K .......... .......... .......... .......... .......... 31% 69.2M 0s
   100K .......... .......... .......... .......... .......... 47% 10.3M 0s
   150K .......... .......... .......... .......... .......... 63% 25.1M 0s
   200K .......... .......... .......... .......... .......... 79% 8.52M 0s
   250K .......... .......... .......... .......... .......... 95% 95.9M 0s
   300K .......... ...                                        100% 93.7M=3D=
0.02s

2022-07-20 15:39:57 (14.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libtinfo6_6.1+20181013-2+deb10u2_arm64.deb=E2=80=99 saved [320920/320920=
]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/ncurses/n=
curses-base_6.1+20181013-2+deb10u2_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 258480 (252K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/ncurses-base_6.1+201=
81013-2+deb10u2_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 19% 6.83M 0s
    50K .......... .......... .......... .......... .......... 39%  109M 0s
   100K .......... .......... .......... .......... .......... 59% 9.06M 0s
   150K .......... .......... .......... .......... .......... 79% 18.0M 0s
   200K .......... .......... .......... .......... .......... 99%  105M 0s
   250K ..                                                    100%  904K=3D=
0.02s

2022-07-20 15:39:57 (13.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/ncurses-base_6.1+20181013-2+deb10u2_all.deb=E2=80=99 saved [258480/25848=
0]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/ncurses/n=
curses-bin_6.1+20181013-2+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 402332 (393K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/ncurses-bin_6.1+2018=
1013-2+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 12% 7.20M 0s
    50K .......... .......... .......... .......... .......... 25% 33.7M 0s
   100K .......... .......... .......... .......... .......... 38% 6.54M 0s
   150K .......... .......... .......... .......... .......... 50%  129M 0s
   200K .......... .......... .......... .......... .......... 63% 5.49M 0s
   250K .......... .......... .......... .......... .......... 76%  110M 0s
   300K .......... .......... .......... .......... .......... 89%  123M 0s
   350K .......... .......... .......... .......... ..        100%  103M=3D=
0.03s

2022-07-20 15:39:57 (14.6 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/ncurses-bin_6.1+20181013-2+deb10u2_arm64.deb=E2=80=99 saved [402332/4023=
32]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/nettle/li=
bhogweed4_3.4.1-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 137568 (134K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libhogweed4_3.4.1-1+=
deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 37% 5.74M 0s
    50K .......... .......... .......... .......... .......... 74% 31.8M 0s
   100K .......... .......... .......... ....                 100% 8.48M=3D=
0.01s

2022-07-20 15:39:57 (9.38 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libhogweed4_3.4.1-1+deb10u1_arm64.deb=E2=80=99 saved [137568/137568]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/nettle/li=
bnettle6_3.4.1-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 225436 (220K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libnettle6_3.4.1-1+d=
eb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 22% 9.68M 0s
    50K .......... .......... .......... .......... .......... 45% 32.8M 0s
   100K .......... .......... .......... .......... .......... 68% 6.79M 0s
   150K .......... .......... .......... .......... .......... 90%  111M 0s
   200K .......... ..........                                 100%  128M=3D=
0.01s

2022-07-20 15:39:57 (15.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libnettle6_3.4.1-1+deb10u1_arm64.deb=E2=80=99 saved [225436/225436]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/n/npth/libn=
pth0_1.6-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 17552 (17K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libnpth0_1.6-1_arm64=
.deb=E2=80=99

     0K .......... .......                                    100%  215M=3D=
0s

2022-07-20 15:39:57 (215 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libnpth0_1.6-1_arm64.deb=E2=80=99 saved [17552/17552]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/o/openldap/=
libldap-2.4-2_2.4.47+dfsg-3+deb10u6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 215896 (211K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libldap-2.4-2_2.4.47=
+dfsg-3+deb10u6_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23% 8.00M 0s
    50K .......... .......... .......... .......... .......... 47% 30.9M 0s
   100K .......... .......... .......... .......... .......... 71% 7.62M 0s
   150K .......... .......... .......... .......... .......... 94%  112M 0s
   200K ..........                                            100%  120M=3D=
0.01s

2022-07-20 15:39:57 (14.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libldap-2.4-2_2.4.47+dfsg-3+deb10u6_arm64.deb=E2=80=99 saved [215896/215=
896]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/o/openldap/=
libldap-common_2.4.47+dfsg-3+deb10u6_all.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 90012 (88K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libldap-common_2.4.4=
7+dfsg-3+deb10u6_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 56% 2.68M 0s
    50K .......... .......... .......... .......              100%  107M=3D=
0.02s

2022-07-20 15:39:57 (4.62 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libldap-common_2.4.47+dfsg-3+deb10u6_all.deb=E2=80=99 saved [90012/90012=
]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/p/p11-kit/l=
ibp11-kit0_0.23.15-2+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 303144 (296K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libp11-kit0_0.23.15-=
2+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16% 6.40M 0s
    50K .......... .......... .......... .......... .......... 33%  115M 0s
   100K .......... .......... .......... .......... .......... 50% 5.90M 0s
   150K .......... .......... .......... .......... .......... 67% 98.1M 0s
   200K .......... .......... .......... .......... .......... 84% 97.8M 0s
   250K .......... .......... .......... .......... ......    100%  597K=3D=
0.09s

2022-07-20 15:39:57 (3.06 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libp11-kit0_0.23.15-2+deb10u1_arm64.deb=E2=80=99 saved [303144/303144]

--2022-07-20 15:39:57--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m-modules_1.3.1-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 302800 (296K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam-modules_1.3.1=
-5_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16% 6.62M 0s
    50K .......... .......... .......... .......... .......... 33% 15.5M 0s
   100K .......... .......... .......... .......... .......... 50% 17.8M 0s
   150K .......... .......... .......... .......... .......... 67% 6.32M 0s
   200K .......... .......... .......... .......... .......... 84%  109M 0s
   250K .......... .......... .......... .......... .....     100%  112M=3D=
0.02s

2022-07-20 15:39:57 (13.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libpam-modules_1.3.1-5_arm64.deb=E2=80=99 saved [302800/302800]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m-modules-bin_1.3.1-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 105700 (103K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam-modules-bin_1=
.3.1-5_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 48% 7.64M 0s
    50K .......... .......... .......... .......... .......... 96% 13.5M 0s
   100K ...                                                   100% 2.41M=3D=
0.01s

2022-07-20 15:39:58 (8.91 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libpam-modules-bin_1.3.1-5_arm64.deb=E2=80=99 saved [105700/105700]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m-runtime_1.3.1-5_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 211252 (206K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam-runtime_1.3.1=
-5_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 24% 8.35M 0s
    50K .......... .......... .......... .......... .......... 48%  110M 0s
   100K .......... .......... .......... .......... .......... 72% 8.15M 0s
   150K .......... .......... .......... .......... .......... 96% 97.1M 0s
   200K ......                                                100%  117M=3D=
0.01s

2022-07-20 15:39:58 (15.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libpam-runtime_1.3.1-5_all.deb=E2=80=99 saved [211252/211252]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m0g_1.3.1-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 124932 (122K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam0g_1.3.1-5_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 40% 5.75M 0s
    50K .......... .......... .......... .......... .......... 81% 96.1M 0s
   100K .......... .......... ..                              100% 4.63M=3D=
0.01s

2022-07-20 15:39:58 (8.73 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libpam0g_1.3.1-5_arm64.deb=E2=80=99 saved [124932/124932]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/p/pcre3/lib=
pcre3_8.39-12_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 316596 (309K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpcre3_2%3a8.39-12=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16% 5.40M 0s
    50K .......... .......... .......... .......... .......... 32%  111M 0s
   100K .......... .......... .......... .......... .......... 48% 5.40M 0s
   150K .......... .......... .......... .......... .......... 64%  108M 0s
   200K .......... .......... .......... .......... .......... 80%  109M 0s
   250K .......... .......... .......... .......... .......... 97% 9.40M 0s
   300K .........                                             100% 90.1M=3D=
0.02s

2022-07-20 15:39:58 (12.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libpcre3_2%3a8.39-12_arm64.deb=E2=80=99 saved [316596/316596]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/p/perl/perl=
-base_5.28.1-6+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 1403048 (1.3M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/perl-base_5.28.1-6+d=
eb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  3% 5.98M 0s
    50K .......... .......... .......... .......... ..........  7%  116M 0s
   100K .......... .......... .......... .......... .......... 10% 8.89M 0s
   150K .......... .......... .......... .......... .......... 14% 6.89M 0s
   200K .......... .......... .......... .......... .......... 18%  104M 0s
   250K .......... .......... .......... .......... .......... 21%  161M 0s
   300K .......... .......... .......... .......... .......... 25% 97.6M 0s
   350K .......... .......... .......... .......... .......... 29% 19.8M 0s
   400K .......... .......... .......... .......... .......... 32% 92.1M 0s
   450K .......... .......... .......... .......... .......... 36% 95.3M 0s
   500K .......... .......... .......... .......... .......... 40% 92.7M 0s
   550K .......... .......... .......... .......... .......... 43%  109M 0s
   600K .......... .......... .......... .......... .......... 47% 89.8M 0s
   650K .......... .......... .......... .......... .......... 51% 71.5M 0s
   700K .......... .......... .......... .......... .......... 54% 97.4M 0s
   750K .......... .......... .......... .......... .......... 58% 97.2M 0s
   800K .......... .......... .......... .......... .......... 62% 99.1M 0s
   850K .......... .......... .......... .......... .......... 65% 94.6M 0s
   900K .......... .......... .......... .......... .......... 69% 49.5M 0s
   950K .......... .......... .......... .......... .......... 72%  142M 0s
  1000K .......... .......... .......... .......... .......... 76%  101M 0s
  1050K .......... .......... .......... .......... .......... 80%  100M 0s
  1100K .......... .......... .......... .......... .......... 83% 97.7M 0s
  1150K .......... .......... .......... .......... .......... 87%  106M 0s
  1200K .......... .......... .......... .......... .......... 91%  106M 0s
  1250K .......... .......... .......... .......... .......... 94%  153M 0s
  1300K .......... .......... .......... .......... .......... 98%  105M 0s
  1350K .......... ..........                                 100% 41.6M=3D=
0.04s

2022-07-20 15:39:58 (38.1 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/perl-base_5.28.1-6+deb10u1_arm64.deb=E2=80=99 saved [1403048/1403048]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/p/pinentry/=
pinentry-curses_1.1.0-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 62684 (61K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/pinentry-curses_1.1.=
0-2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 81% 11.9M 0s
    50K .......... .                                          100% 88.5M=3D=
0.004s

2022-07-20 15:39:58 (14.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/pinentry-curses_1.1.0-2_arm64.deb=E2=80=99 saved [62684/62684]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/r/readline/=
libreadline7_7.0-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 133576 (130K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libreadline7_7.0-5_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 38% 7.68M 0s
    50K .......... .......... .......... .......... .......... 76% 31.1M 0s
   100K .......... .......... ..........                      100% 7.40M=3D=
0.01s

2022-07-20 15:39:58 (10.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libreadline7_7.0-5_arm64.deb=E2=80=99 saved [133576/133576]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/r/readline/=
readline-common_7.0-5_all.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:4::=
644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 70572 (69K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/readline-common_7.0-=
5_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 72% 9.45M 0s
    50K .......... ........                                   100%  127M=3D=
0.005s

2022-07-20 15:39:58 (12.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/readline-common_7.0-5_all.deb=E2=80=99 saved [70572/70572]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/sed/sed_4=
.7-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 305512 (298K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/sed_4.7-1_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 16% 6.00M 0s
    50K .......... .......... .......... .......... .......... 33%  109M 0s
   100K .......... .......... .......... .......... .......... 50% 5.88M 0s
   150K .......... .......... .......... .......... .......... 67%  112M 0s
   200K .......... .......... .......... .......... .......... 83%  109M 0s
   250K .......... .......... .......... .......... ........  100% 11.9M=3D=
0.02s

2022-07-20 15:39:58 (13.4 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/sed_4.7-1_arm64.deb=E2=80=99 saved [305512/305512]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/shadow/lo=
gin_4.5-1.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 748128 (731K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/login_1%3a4.5-1.1_ar=
m64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6% 4.59M 0s
    50K .......... .......... .......... .......... .......... 13%  113M 0s
   100K .......... .......... .......... .......... .......... 20% 7.87M 0s
   150K .......... .......... .......... .......... .......... 27% 5.02M 0s
   200K .......... .......... .......... .......... .......... 34%  107M 0s
   250K .......... .......... .......... .......... .......... 41%  110M 0s
   300K .......... .......... .......... .......... .......... 47% 4.21M 0s
   350K .......... .......... .......... .......... .......... 54% 89.9M 0s
   400K .......... .......... .......... .......... .......... 61% 87.7M 0s
   450K .......... .......... .......... .......... .......... 68% 88.7M 0s
   500K .......... .......... .......... .......... .......... 75% 89.7M 0s
   550K .......... .......... .......... .......... .......... 82% 98.8M 0s
   600K .......... .......... .......... .......... .......... 88%  163M 0s
   650K .......... .......... .......... .......... .......... 95% 42.5M 0s
   700K .......... .......... ..........                      100% 99.9M=3D=
0.04s

2022-07-20 15:39:58 (16.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/login_1%3a4.5-1.1_arm64.deb=E2=80=99 saved [748128/748128]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/shadow/pa=
sswd_4.5-1.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 980320 (957K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/passwd_1%3a4.5-1.1_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5% 2.50M 0s
    50K .......... .......... .......... .......... .......... 10% 33.9M 0s
   100K .......... .......... .......... .......... .......... 15% 8.44M 0s
   150K .......... .......... .......... .......... .......... 20% 4.90M 0s
   200K .......... .......... .......... .......... .......... 26%  123M 0s
   250K .......... .......... .......... .......... .......... 31%  109M 0s
   300K .......... .......... .......... .......... .......... 36% 4.30M 0s
   350K .......... .......... .......... .......... .......... 41%  112M 0s
   400K .......... .......... .......... .......... .......... 47%  109M 0s
   450K .......... .......... .......... .......... .......... 52%  109M 0s
   500K .......... .......... .......... .......... .......... 57%  119M 0s
   550K .......... .......... .......... .......... .......... 62% 11.1M 0s
   600K .......... .......... .......... .......... .......... 67% 28.0M 0s
   650K .......... .......... .......... .......... .......... 73% 24.5M 0s
   700K .......... .......... .......... .......... .......... 78% 6.75M 0s
   750K .......... .......... .......... .......... .......... 83%  120M 0s
   800K .......... .......... .......... .......... .......... 88%  109M 0s
   850K .......... .......... .......... .......... .......... 94%  107M 0s
   900K .......... .......... .......... .......... .......... 99% 11.0M 0s
   950K .......                                               100%  137M=3D=
0.07s

2022-07-20 15:39:58 (13.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/passwd_1%3a4.5-1.1_arm64.deb=E2=80=99 saved [980320/980320]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/sqlite3/l=
ibsqlite3-0_3.27.2-3+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 602996 (589K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsqlite3-0_3.27.2-=
3+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8% 5.38M 0s
    50K .......... .......... .......... .......... .......... 16%  117M 0s
   100K .......... .......... .......... .......... .......... 25% 6.27M 0s
   150K .......... .......... .......... .......... .......... 33%  107M 0s
   200K .......... .......... .......... .......... .......... 42% 6.08M 0s
   250K .......... .......... .......... .......... .......... 50% 99.1M 0s
   300K .......... .......... .......... .......... .......... 59%  120M 0s
   350K .......... .......... .......... .......... .......... 67% 99.0M 0s
   400K .......... .......... .......... .......... .......... 76%  109M 0s
   450K .......... .......... .......... .......... .......... 84% 35.9M 0s
   500K .......... .......... .......... .......... .......... 93% 99.3M 0s
   550K .......... .......... .......... ........             100% 69.6M=3D=
0.03s

2022-07-20 15:39:58 (19.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsqlite3-0_3.27.2-3+deb10u1_arm64.deb=E2=80=99 saved [602996/602996]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/systemd/l=
ibsystemd0_241-7~deb10u8_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 313792 (306K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsystemd0_241-7~de=
b10u8_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16% 6.85M 0s
    50K .......... .......... .......... .......... .......... 32% 31.6M 0s
   100K .......... .......... .......... .......... .......... 48% 6.15M 0s
   150K .......... .......... .......... .......... .......... 65%  137M 0s
   200K .......... .......... .......... .......... .......... 81%  100M 0s
   250K .......... .......... .......... .......... .......... 97% 11.8M 0s
   300K ......                                                100% 34.6M=3D=
0.02s

2022-07-20 15:39:58 (13.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsystemd0_241-7~deb10u8_arm64.deb=E2=80=99 saved [313792/313792]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/systemd/l=
ibudev1_241-7~deb10u8_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 146448 (143K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libudev1_241-7~deb10=
u8_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 34% 6.32M 0s
    50K .......... .......... .......... .......... .......... 69%  124M 0s
   100K .......... .......... .......... .......... ...       100% 8.70M=3D=
0.01s

2022-07-20 15:39:58 (10.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libudev1_241-7~deb10u8_arm64.deb=E2=80=99 saved [146448/146448]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/s/sysvinit/=
sysvinit-utils_2.93-8_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 78308 (76K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/sysvinit-utils_2.93-=
8_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 65% 4.59M 0s
    50K .......... .......... ......                          100%  358M=3D=
0.01s

2022-07-20 15:39:58 (6.97 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/sysvinit-utils_2.93-8_arm64.deb=E2=80=99 saved [78308/78308]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/t/tar/tar_1=
.30+dfsg-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 767536 (750K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/tar_1.30+dfsg-6_arm6=
4.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6% 5.61M 0s
    50K .......... .......... .......... .......... .......... 13% 7.20M 0s
   100K .......... .......... .......... .......... .......... 20% 11.5M 0s
   150K .......... .......... .......... .......... .......... 26% 24.3M 0s
   200K .......... .......... .......... .......... .......... 33%  110M 0s
   250K .......... .......... .......... .......... .......... 40% 4.16M 0s
   300K .......... .......... .......... .......... .......... 46% 98.4M 0s
   350K .......... .......... .......... .......... .......... 53%  102M 0s
   400K .......... .......... .......... .......... .......... 60%  154M 0s
   450K .......... .......... .......... .......... .......... 66% 5.70M 0s
   500K .......... .......... .......... .......... .......... 73%  102M 0s
   550K .......... .......... .......... .......... .......... 80%  172M 0s
   600K .......... .......... .......... .......... .......... 86% 90.6M 0s
   650K .......... .......... .......... .......... .......... 93%  101M 0s
   700K .......... .......... .......... .......... ......... 100%  103M=3D=
0.05s

2022-07-20 15:39:58 (15.9 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/tar_1.30+dfsg-6_arm64.deb=E2=80=99 saved [767536/767536]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/t/tzdata/tz=
data_2021a-0+deb10u3_all.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 266144 (260K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/tzdata_2021a-0+deb10=
u3_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 19% 12.1M 0s
    50K .......... .......... .......... .......... .......... 38% 7.65M 0s
   100K .......... .......... .......... .......... .......... 57% 5.89M 0s
   150K .......... .......... .......... .......... .......... 76% 89.5M 0s
   200K .......... .......... .......... .......... .......... 96% 97.5M 0s
   250K .........                                             100%  144M=3D=
0.02s

2022-07-20 15:39:58 (12.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/tzdata_2021a-0+deb10u3_all.deb=E2=80=99 saved [266144/266144]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/bsdutils_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:4::=
644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 118476 (116K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/bsdutils_1%3a2.33.1-=
0.1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 43% 6.19M 0s
    50K .......... .......... .......... .......... .......... 86%  128M 0s
   100K .......... .....                                      100% 3.49M=3D=
0.01s

2022-07-20 15:39:58 (8.92 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/bsdutils_1%3a2.33.1-0.1_arm64.deb=E2=80=99 saved [118476/118476]

--2022-07-20 15:39:58--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/fdisk_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 173616 (170K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/fdisk_2.33.1-0.1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 29% 7.45M 0s
    50K .......... .......... .......... .......... .......... 58% 29.5M 0s
   100K .......... .......... .......... .......... .......... 88% 8.55M 0s
   150K .......... .........                                  100% 94.8M=3D=
0.01s

2022-07-20 15:39:59 (11.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/fdisk_2.33.1-0.1_arm64.deb=E2=80=99 saved [173616/173616]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libblkid1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 186456 (182K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libblkid1_2.33.1-0.1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 27% 6.78M 0s
    50K .......... .......... .......... .......... .......... 54%  101M 0s
   100K .......... .......... .......... .......... .......... 82% 8.20M 0s
   150K .......... .......... .......... ..                   100%  134M=3D=
0.01s

2022-07-20 15:39:59 (12.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libblkid1_2.33.1-0.1_arm64.deb=E2=80=99 saved [186456/186456]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libfdisk1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 220856 (216K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libfdisk1_2.33.1-0.1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23% 2.64M 0s
    50K .......... .......... .......... .......... .......... 46%  109M 0s
   100K .......... .......... .......... .......... .......... 69% 8.74M 0s
   150K .......... .......... .......... .......... .......... 92% 9.67M 0s
   200K .......... .....                                      100%  105M=3D=
0.03s

2022-07-20 15:39:59 (7.08 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libfdisk1_2.33.1-0.1_arm64.deb=E2=80=99 saved [220856/220856]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libmount1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 198712 (194K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libmount1_2.33.1-0.1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 25% 6.63M 0s
    50K .......... .......... .......... .......... .......... 51% 78.5M 0s
   100K .......... .......... .......... .......... .......... 77% 8.67M 0s
   150K .......... .......... .......... .......... ....      100% 9.58M=3D=
0.02s

2022-07-20 15:39:59 (10.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libmount1_2.33.1-0.1_arm64.deb=E2=80=99 saved [198712/198712]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libsmartcols1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 144400 (141K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsmartcols1_2.33.1=
-0.1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 35% 6.52M 0s
    50K .......... .......... .......... .......... .......... 70% 89.3M 0s
   100K .......... .......... .......... .......... .         100% 9.47M=3D=
0.01s

2022-07-20 15:39:59 (11.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsmartcols1_2.33.1-0.1_arm64.deb=E2=80=99 saved [144400/144400]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libuuid1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:6b::=
644
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 77788 (76K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libuuid1_2.33.1-0.1_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 65% 7.42M 0s
    50K .......... .......... .....                           100% 67.6M=3D=
0.007s

2022-07-20 15:39:59 (10.7 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libuuid1_2.33.1-0.1_arm64.deb=E2=80=99 saved [77788/77788]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/mount_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 170948 (167K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/mount_2.33.1-0.1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 29% 11.3M 0s
    50K .......... .......... .......... .......... .......... 59% 32.1M 0s
   100K .......... .......... .......... .......... .......... 89% 8.91M 0s
   150K .......... ......                                     100% 80.7M=3D=
0.01s

2022-07-20 15:39:59 (14.2 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/mount_2.33.1-0.1_arm64.deb=E2=80=99 saved [170948/170948]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/util-linux_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1023512 (1000K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/util-linux_2.33.1-0.=
1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5% 5.63M 0s
    50K .......... .......... .......... .......... .......... 10%  145M 0s
   100K .......... .......... .......... .......... .......... 15% 8.41M 0s
   150K .......... .......... .......... .......... .......... 20% 5.60M 0s
   200K .......... .......... .......... .......... .......... 25%  108M 0s
   250K .......... .......... .......... .......... .......... 30% 4.95M 0s
   300K .......... .......... .......... .......... .......... 35%  114M 0s
   350K .......... .......... .......... .......... .......... 40%  122M 0s
   400K .......... .......... .......... .......... .......... 45%  109M 0s
   450K .......... .......... .......... .......... .......... 50%  105M 0s
   500K .......... .......... .......... .......... .......... 55%  112M 0s
   550K .......... .......... .......... .......... .......... 60%  122M 0s
   600K .......... .......... .......... .......... .......... 65% 27.2M 0s
   650K .......... .......... .......... .......... .......... 70% 97.8M 0s
   700K .......... .......... .......... .......... .......... 75% 98.6M 0s
   750K .......... .......... .......... .......... .......... 80% 69.5M 0s
   800K .......... .......... .......... .......... .......... 85% 75.7M 0s
   850K .......... .......... .......... .......... .......... 90% 69.6M 0s
   900K .......... .......... .......... .......... .......... 95% 63.8M 0s
   950K .......... .......... .......... .......... ......... 100%  110M=3D=
0.04s

2022-07-20 15:39:59 (23.0 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/util-linux_2.33.1-0.1_arm64.deb=E2=80=99 saved [1023512/1023512]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/x/xz-utils/=
liblzma5_5.2.4-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 199.232.174.132, 2a04:4e42:6b:=
:644
Connecting to deb.debian.org (deb.debian.org)|199.232.174.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 149176 (146K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/liblzma5_5.2.4-1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 34% 7.45M 0s
    50K .......... .......... .......... .......... .......... 68% 24.4M 0s
   100K .......... .......... .......... .......... .....     100% 8.63M=3D=
0.01s

2022-07-20 15:39:59 (10.4 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/liblzma5_5.2.4-1_arm64.deb=E2=80=99 saved [149176/149176]

--2022-07-20 15:39:59--  http://deb.debian.org/debian/pool/main/z/zlib/zlib=
1g_1.2.11.dfsg-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.18.132, 2a04:4e42:4::6=
44
Connecting to deb.debian.org (deb.debian.org)|151.101.18.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 89340 (87K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.df=
sg-1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 57% 6.45M 0s
    50K .......... .......... .......... .......              100%  122M=3D=
0.008s

2022-07-20 15:39:59 (10.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/zlib1g_1%3a1.2.11.dfsg-1_arm64.deb=E2=80=99 saved [89340/89340]

ls: cannot access '//proc': Too many levels of symbolic links
mount: /proc: mount(2) system call failed: Too many levels of symbolic link=
s.
Segmentation fault (core dumped)

------=_Part_3808_782283646.1658335808766
Content-Type: text/plain; charset=US-ASCII; name=build_console_output.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=build_console_output.txt
X-Attachment-Id: 77742619-7a8f-4e91-91ce-e47fe4177381
Content-ID: <77742619-7a8f-4e91-91ce-e47fe4177381>

yelena@LDT-Y-KONYUKH:~/FENRIR_WORK/JAILHOUSE_V012/jailhouse-images$ ./build-images.sh 
Available images demo images:
 1: QEMU/KVM Intel-x86 virtual target
 2: QEMU ARM64 virtual target
 3: Orange Pi Zero (256 MB edition)
 4: Intel NUC (NUC6CAY, 8 GB RAM)
 5: Marvell ESPRESSObin (1 GB edition)
 6: Marvell MACCHIATObin
 7: LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
 8: Avnet Ultra96
 9: Raspberry Pi 4 (1 GB edition)
 0: all (may take hours...)

Select images to build (space-separated index list): 9
./kas-docker                        100%[==================================================================>]   6.36K  --.-KB/s    in 0s      
2022-07-20 15:39:38 - INFO     - kas 2.0 started
2022-07-20 15:39:38 - INFO     - /repo$ git rev-parse --show-toplevel
2022-07-20 15:39:38 - INFO     - /repo$ git rev-parse --show-toplevel
2022-07-20 15:39:38 - INFO     - Using /repo as root for repository jailhouse
2022-07-20 15:39:38 - INFO     - /work$ git clone -q https://github.com/ilbers/isar /work/isar
2022-07-20 15:39:39 - INFO     - Repository isar cloned
2022-07-20 15:39:39 - INFO     - /repo$ git rev-parse --show-toplevel
2022-07-20 15:39:39 - INFO     - Using /repo as root for repository jailhouse
2022-07-20 15:39:39 - INFO     - /work/isar$ git status -s
2022-07-20 15:39:39 - INFO     - /work/isar$ git rev-parse --verify HEAD
2022-07-20 15:39:39 - INFO     - 9aec8ba92912c682f7732b015f1919c5308f40a2
2022-07-20 15:39:39 - INFO     - /work/isar$ git checkout -q 619d6d88ac8c745282fd16773d50a466567615b6
2022-07-20 15:39:39 - INFO     - /repo$ git rev-parse --show-toplevel
2022-07-20 15:39:39 - INFO     - Using /repo as root for repository jailhouse
2022-07-20 15:39:39 - INFO     - /work/isar$ /tmp/tmp5gp8rg0_ /work/build
2022-07-20 15:39:39 - INFO     - /repo$ git rev-parse --show-toplevel
2022-07-20 15:39:39 - INFO     - Using /repo as root for repository jailhouse
2022-07-20 15:39:39 - INFO     - /repo$ git rev-parse --show-toplevel
2022-07-20 15:39:39 - INFO     - Using /repo as root for repository jailhouse
2022-07-20 15:39:39 - INFO     - /work/build$ /work/isar/bitbake/bin/bitbake -k -c build mc:rpi4-jailhouse-demo:demo-image
Parsing recipes: 100% |#########################################################################################################| Time: 0:00:00
Parsing of 31 .bb files complete (0 cached, 31 parsed). 62 targets, 0 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100% |######################################################################################################| Time: 0:00:00
NOTE: No setscene tasks
NOTE: Executing Tasks
ERROR: mc:rpi4-jailhouse-demo:isar-bootstrap-target-1.0-r0 do_bootstrap: Execution of '/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/temp/run.do_bootstrap.600' failed with exit code 1:
I: Running command: debootstrap --arch arm64 --foreign --verbose --variant=minbase --include=locales,gnupg --components=main,contrib,non-free buster /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs http://deb.debian.org/debian
I: Retrieving InRelease 
I: Checking Release signature
I: Valid Release signature (key id 6D33866EDD8FFA41C0143AEDDCC9EFBF77E11517)
I: Retrieving Packages 
I: Validating Packages 
I: Retrieving Packages 
I: Validating Packages 
I: Retrieving Packages 
I: Validating Packages 
I: Resolving dependencies of required packages...
I: Resolving dependencies of base packages...
I: Checking component main on http://deb.debian.org/debian...
I: Retrieving libacl1 2.2.53-4
I: Validating libacl1 2.2.53-4
I: Retrieving adduser 3.118
I: Validating adduser 3.118
I: Retrieving apt 1.8.2.3
I: Validating apt 1.8.2.3
I: Retrieving libapt-pkg5.0 1.8.2.3
I: Validating libapt-pkg5.0 1.8.2.3
I: Retrieving libattr1 1:2.4.48-4
I: Validating libattr1 1:2.4.48-4
I: Retrieving libaudit-common 1:2.8.4-3
I: Validating libaudit-common 1:2.8.4-3
I: Retrieving libaudit1 1:2.8.4-3
I: Validating libaudit1 1:2.8.4-3
I: Retrieving base-files 10.3+deb10u12
I: Validating base-files 10.3+deb10u12
I: Retrieving base-passwd 3.5.46
I: Validating base-passwd 3.5.46
I: Retrieving bash 5.0-4
I: Validating bash 5.0-4
I: Retrieving libbz2-1.0 1.0.6-9.2~deb10u1
I: Validating libbz2-1.0 1.0.6-9.2~deb10u1
I: Retrieving libdebconfclient0 0.249
I: Validating libdebconfclient0 0.249
I: Retrieving coreutils 8.30-3
I: Validating coreutils 8.30-3
I: Retrieving libsasl2-2 2.1.27+dfsg-1+deb10u2
I: Validating libsasl2-2 2.1.27+dfsg-1+deb10u2
I: Retrieving libsasl2-modules-db 2.1.27+dfsg-1+deb10u2
I: Validating libsasl2-modules-db 2.1.27+dfsg-1+deb10u2
I: Retrieving dash 0.5.10.2-5
I: Validating dash 0.5.10.2-5
I: Retrieving libdb5.3 5.3.28+dfsg1-0.5
I: Validating libdb5.3 5.3.28+dfsg1-0.5
I: Retrieving debconf 1.5.71+deb10u1
I: Validating debconf 1.5.71+deb10u1
I: Retrieving debian-archive-keyring 2019.1+deb10u1
I: Validating debian-archive-keyring 2019.1+deb10u1
I: Retrieving debianutils 4.8.6.1
I: Validating debianutils 4.8.6.1
I: Retrieving diffutils 1:3.7-3
I: Validating diffutils 1:3.7-3
I: Retrieving dpkg 1.19.7
I: Validating dpkg 1.19.7
I: Retrieving e2fsprogs 1.44.5-1+deb10u3
I: Validating e2fsprogs 1.44.5-1+deb10u3
I: Retrieving libcom-err2 1.44.5-1+deb10u3
I: Validating libcom-err2 1.44.5-1+deb10u3
I: Retrieving libext2fs2 1.44.5-1+deb10u3
I: Validating libext2fs2 1.44.5-1+deb10u3
I: Retrieving libss2 1.44.5-1+deb10u3
I: Validating libss2 1.44.5-1+deb10u3
I: Retrieving findutils 4.6.0+git+20190209-2
I: Validating findutils 4.6.0+git+20190209-2
I: Retrieving gcc-8-base 8.3.0-6
I: Validating gcc-8-base 8.3.0-6
I: Retrieving libgcc1 1:8.3.0-6
I: Validating libgcc1 1:8.3.0-6
I: Retrieving libstdc++6 8.3.0-6
I: Validating libstdc++6 8.3.0-6
I: Retrieving libc-bin 2.28-10+deb10u1
I: Validating libc-bin 2.28-10+deb10u1
I: Retrieving libc-l10n 2.28-10+deb10u1
I: Validating libc-l10n 2.28-10+deb10u1
I: Retrieving libc6 2.28-10+deb10u1
I: Validating libc6 2.28-10+deb10u1
I: Retrieving locales 2.28-10+deb10u1
I: Validating locales 2.28-10+deb10u1
I: Retrieving libgmp10 2:6.1.2+dfsg-4+deb10u1
I: Validating libgmp10 2:6.1.2+dfsg-4+deb10u1
I: Retrieving dirmngr 2.2.12-1+deb10u1
I: Validating dirmngr 2.2.12-1+deb10u1
I: Retrieving gnupg 2.2.12-1+deb10u1
I: Validating gnupg 2.2.12-1+deb10u1
I: Retrieving gnupg-l10n 2.2.12-1+deb10u1
I: Validating gnupg-l10n 2.2.12-1+deb10u1
I: Retrieving gnupg-utils 2.2.12-1+deb10u1
I: Validating gnupg-utils 2.2.12-1+deb10u1
I: Retrieving gpg 2.2.12-1+deb10u1
I: Validating gpg 2.2.12-1+deb10u1
I: Retrieving gpg-agent 2.2.12-1+deb10u1
I: Validating gpg-agent 2.2.12-1+deb10u1
I: Retrieving gpg-wks-client 2.2.12-1+deb10u1
I: Validating gpg-wks-client 2.2.12-1+deb10u1
I: Retrieving gpg-wks-server 2.2.12-1+deb10u1
I: Validating gpg-wks-server 2.2.12-1+deb10u1
I: Retrieving gpgconf 2.2.12-1+deb10u1
I: Validating gpgconf 2.2.12-1+deb10u1
I: Retrieving gpgsm 2.2.12-1+deb10u1
I: Validating gpgsm 2.2.12-1+deb10u1
I: Retrieving gpgv 2.2.12-1+deb10u1
I: Validating gpgv 2.2.12-1+deb10u1
I: Retrieving libgnutls30 3.6.7-4+deb10u7
I: Validating libgnutls30 3.6.7-4+deb10u7
I: Retrieving grep 3.3-1
I: Validating grep 3.3-1
I: Retrieving gzip 1.9-3
I: Validating gzip 1.9-3
I: Retrieving hostname 3.21
I: Validating hostname 3.21
I: Retrieving init-system-helpers 1.56+nmu1
I: Validating init-system-helpers 1.56+nmu1
I: Retrieving libassuan0 2.5.2-1
I: Validating libassuan0 2.5.2-1
I: Retrieving libcap-ng0 0.7.9-2
I: Validating libcap-ng0 0.7.9-2
I: Retrieving libffi6 3.2.1-9
I: Validating libffi6 3.2.1-9
I: Retrieving libgcrypt20 1.8.4-5+deb10u1
I: Validating libgcrypt20 1.8.4-5+deb10u1
I: Retrieving libgpg-error0 1.35-1
I: Validating libgpg-error0 1.35-1
I: Retrieving libidn2-0 2.0.5-1+deb10u1
I: Validating libidn2-0 2.0.5-1+deb10u1
I: Retrieving libksba8 1.3.5-2
I: Validating libksba8 1.3.5-2
I: Retrieving libseccomp2 2.3.3-4
I: Validating libseccomp2 2.3.3-4
I: Retrieving libselinux1 2.8-1+b1
I: Validating libselinux1 2.8-1+b1
I: Retrieving libsemanage-common 2.8-2
I: Validating libsemanage-common 2.8-2
I: Retrieving libsemanage1 2.8-2
I: Validating libsemanage1 2.8-2
I: Retrieving libsepol1 2.8-1
I: Validating libsepol1 2.8-1
I: Retrieving libtasn1-6 4.13-3
I: Validating libtasn1-6 4.13-3
I: Retrieving libunistring2 0.9.10-1
I: Validating libunistring2 0.9.10-1
I: Retrieving libzstd1 1.3.8+dfsg-3+deb10u2
I: Validating libzstd1 1.3.8+dfsg-3+deb10u2
I: Retrieving lsb-base 10.2019051400
I: Validating lsb-base 10.2019051400
I: Retrieving liblz4-1 1.8.3-1+deb10u1
I: Validating liblz4-1 1.8.3-1+deb10u1
I: Retrieving mawk 1.3.3-17+b3
I: Validating mawk 1.3.3-17+b3
I: Retrieving libncursesw6 6.1+20181013-2+deb10u2
I: Validating libncursesw6 6.1+20181013-2+deb10u2
I: Retrieving libtinfo6 6.1+20181013-2+deb10u2
I: Validating libtinfo6 6.1+20181013-2+deb10u2
I: Retrieving ncurses-base 6.1+20181013-2+deb10u2
I: Validating ncurses-base 6.1+20181013-2+deb10u2
I: Retrieving ncurses-bin 6.1+20181013-2+deb10u2
I: Validating ncurses-bin 6.1+20181013-2+deb10u2
I: Retrieving libhogweed4 3.4.1-1+deb10u1
I: Validating libhogweed4 3.4.1-1+deb10u1
I: Retrieving libnettle6 3.4.1-1+deb10u1
I: Validating libnettle6 3.4.1-1+deb10u1
I: Retrieving libnpth0 1.6-1
I: Validating libnpth0 1.6-1
I: Retrieving libldap-2.4-2 2.4.47+dfsg-3+deb10u6
I: Validating libldap-2.4-2 2.4.47+dfsg-3+deb10u6
I: Retrieving libldap-common 2.4.47+dfsg-3+deb10u6
I: Validating libldap-common 2.4.47+dfsg-3+deb10u6
I: Retrieving libp11-kit0 0.23.15-2+deb10u1
I: Validating libp11-kit0 0.23.15-2+deb10u1
I: Retrieving libpam-modules 1.3.1-5
I: Validating libpam-modules 1.3.1-5
I: Retrieving libpam-modules-bin 1.3.1-5
I: Validating libpam-modules-bin 1.3.1-5
I: Retrieving libpam-runtime 1.3.1-5
I: Validating libpam-runtime 1.3.1-5
I: Retrieving libpam0g 1.3.1-5
I: Validating libpam0g 1.3.1-5
I: Retrieving libpcre3 2:8.39-12
I: Validating libpcre3 2:8.39-12
I: Retrieving perl-base 5.28.1-6+deb10u1
I: Validating perl-base 5.28.1-6+deb10u1
I: Retrieving pinentry-curses 1.1.0-2
I: Validating pinentry-curses 1.1.0-2
I: Retrieving libreadline7 7.0-5
I: Validating libreadline7 7.0-5
I: Retrieving readline-common 7.0-5
I: Validating readline-common 7.0-5
I: Retrieving sed 4.7-1
I: Validating sed 4.7-1
I: Retrieving login 1:4.5-1.1
I: Validating login 1:4.5-1.1
I: Retrieving passwd 1:4.5-1.1
I: Validating passwd 1:4.5-1.1
I: Retrieving libsqlite3-0 3.27.2-3+deb10u1
I: Validating libsqlite3-0 3.27.2-3+deb10u1
I: Retrieving libsystemd0 241-7~deb10u8
I: Validating libsystemd0 241-7~deb10u8
I: Retrieving libudev1 241-7~deb10u8
I: Validating libudev1 241-7~deb10u8
I: Retrieving sysvinit-utils 2.93-8
I: Validating sysvinit-utils 2.93-8
I: Retrieving tar 1.30+dfsg-6
I: Validating tar 1.30+dfsg-6
I: Retrieving tzdata 2021a-0+deb10u3
I: Validating tzdata 2021a-0+deb10u3
I: Retrieving bsdutils 1:2.33.1-0.1
I: Validating bsdutils 1:2.33.1-0.1
I: Retrieving fdisk 2.33.1-0.1
I: Validating fdisk 2.33.1-0.1
I: Retrieving libblkid1 2.33.1-0.1
I: Validating libblkid1 2.33.1-0.1
I: Retrieving libfdisk1 2.33.1-0.1
I: Validating libfdisk1 2.33.1-0.1
I: Retrieving libmount1 2.33.1-0.1
I: Validating libmount1 2.33.1-0.1
I: Retrieving libsmartcols1 2.33.1-0.1
I: Validating libsmartcols1 2.33.1-0.1
I: Retrieving libuuid1 2.33.1-0.1
I: Validating libuuid1 2.33.1-0.1
I: Retrieving mount 2.33.1-0.1
I: Validating mount 2.33.1-0.1
I: Retrieving util-linux 2.33.1-0.1
I: Validating util-linux 2.33.1-0.1
I: Retrieving liblzma5 5.2.4-1
I: Validating liblzma5 5.2.4-1
I: Retrieving zlib1g 1:1.2.11.dfsg-1
I: Validating zlib1g 1:1.2.11.dfsg-1
I: Chosen extractor for .deb packages: dpkg-deb
I: Extracting libacl1...
I: Extracting adduser...
I: Extracting apt...
I: Extracting libapt-pkg5.0...
I: Extracting libattr1...
I: Extracting libaudit-common...
I: Extracting libaudit1...
I: Extracting base-files...
I: Extracting base-passwd...
I: Extracting bash...
I: Extracting libbz2-1.0...
I: Extracting libdebconfclient0...
I: Extracting coreutils...
I: Extracting dash...
I: Extracting libdb5.3...
I: Extracting debconf...
I: Extracting debian-archive-keyring...
I: Extracting debianutils...
I: Extracting diffutils...
I: Extracting dpkg...
I: Extracting e2fsprogs...
I: Extracting libcom-err2...
I: Extracting libext2fs2...
I: Extracting libss2...
I: Extracting findutils...
I: Extracting gcc-8-base...
I: Extracting libgcc1...
I: Extracting libstdc++6...
I: Extracting libc-bin...
I: Extracting libc6...
I: Extracting libgmp10...
I: Extracting gpgv...
I: Extracting libgnutls30...
I: Extracting grep...
I: Extracting gzip...
I: Extracting hostname...
I: Extracting init-system-helpers...
I: Extracting libcap-ng0...
I: Extracting libffi6...
I: Extracting libgcrypt20...
I: Extracting libgpg-error0...
I: Extracting libidn2-0...
I: Extracting libseccomp2...
I: Extracting libselinux1...
I: Extracting libsemanage-common...
I: Extracting libsemanage1...
I: Extracting libsepol1...
I: Extracting libtasn1-6...
I: Extracting libunistring2...
I: Extracting libzstd1...
I: Extracting liblz4-1...
I: Extracting mawk...
I: Extracting libncursesw6...
I: Extracting libtinfo6...
I: Extracting ncurses-base...
I: Extracting ncurses-bin...
I: Extracting libhogweed4...
I: Extracting libnettle6...
I: Extracting libp11-kit0...
I: Extracting libpam-modules...
I: Extracting libpam-modules-bin...
I: Extracting libpam-runtime...
I: Extracting libpam0g...
I: Extracting libpcre3...
I: Extracting perl-base...
I: Extracting sed...
I: Extracting login...
I: Extracting passwd...
I: Extracting libsystemd0...
I: Extracting libudev1...
I: Extracting sysvinit-utils...
I: Extracting tar...
I: Extracting tzdata...
I: Extracting bsdutils...
I: Extracting fdisk...
I: Extracting libblkid1...
I: Extracting libfdisk1...
I: Extracting libmount1...
I: Extracting libsmartcols1...
I: Extracting libuuid1...
I: Extracting mount...
I: Extracting util-linux...
I: Extracting liblzma5...
I: Extracting zlib1g...
I: Running command: chroot /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs /debootstrap/debootstrap --second-stage
W: Failure trying to run:  mount -t proc proc /proc
W: See //debootstrap/debootstrap.log for details
W: Failure trying to run:  /sbin/ldconfig
W: See //debootstrap/debootstrap.log for details
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/temp/log.do_bootstrap.600
Log data follows:
| DEBUG: Executing shell function do_bootstrap
| I: Running command: debootstrap --arch arm64 --foreign --verbose --variant=minbase --include=locales,gnupg --components=main,contrib,non-free buster /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs http://deb.debian.org/debian
| I: Retrieving InRelease
| I: Checking Release signature
| I: Valid Release signature (key id 6D33866EDD8FFA41C0143AEDDCC9EFBF77E11517)
| I: Retrieving Packages
| I: Validating Packages
| I: Retrieving Packages
| I: Validating Packages
| I: Retrieving Packages
| I: Validating Packages
| I: Resolving dependencies of required packages...
| I: Resolving dependencies of base packages...
| I: Checking component main on http://deb.debian.org/debian...
| I: Retrieving libacl1 2.2.53-4
| I: Validating libacl1 2.2.53-4
| I: Retrieving adduser 3.118
| I: Validating adduser 3.118
| I: Retrieving apt 1.8.2.3
| I: Validating apt 1.8.2.3
| I: Retrieving libapt-pkg5.0 1.8.2.3
| I: Validating libapt-pkg5.0 1.8.2.3
| I: Retrieving libattr1 1:2.4.48-4
| I: Validating libattr1 1:2.4.48-4
| I: Retrieving libaudit-common 1:2.8.4-3
| I: Validating libaudit-common 1:2.8.4-3
| I: Retrieving libaudit1 1:2.8.4-3
| I: Validating libaudit1 1:2.8.4-3
| I: Retrieving base-files 10.3+deb10u12
| I: Validating base-files 10.3+deb10u12
| I: Retrieving base-passwd 3.5.46
| I: Validating base-passwd 3.5.46
| I: Retrieving bash 5.0-4
| I: Validating bash 5.0-4
| I: Retrieving libbz2-1.0 1.0.6-9.2~deb10u1
| I: Validating libbz2-1.0 1.0.6-9.2~deb10u1
| I: Retrieving libdebconfclient0 0.249
| I: Validating libdebconfclient0 0.249
| I: Retrieving coreutils 8.30-3
| I: Validating coreutils 8.30-3
| I: Retrieving libsasl2-2 2.1.27+dfsg-1+deb10u2
| I: Validating libsasl2-2 2.1.27+dfsg-1+deb10u2
| I: Retrieving libsasl2-modules-db 2.1.27+dfsg-1+deb10u2
| I: Validating libsasl2-modules-db 2.1.27+dfsg-1+deb10u2
| I: Retrieving dash 0.5.10.2-5
| I: Validating dash 0.5.10.2-5
| I: Retrieving libdb5.3 5.3.28+dfsg1-0.5
| I: Validating libdb5.3 5.3.28+dfsg1-0.5
| I: Retrieving debconf 1.5.71+deb10u1
| I: Validating debconf 1.5.71+deb10u1
| I: Retrieving debian-archive-keyring 2019.1+deb10u1
| I: Validating debian-archive-keyring 2019.1+deb10u1
| I: Retrieving debianutils 4.8.6.1
| I: Validating debianutils 4.8.6.1
| I: Retrieving diffutils 1:3.7-3
| I: Validating diffutils 1:3.7-3
| I: Retrieving dpkg 1.19.7
| I: Validating dpkg 1.19.7
| I: Retrieving e2fsprogs 1.44.5-1+deb10u3
| I: Validating e2fsprogs 1.44.5-1+deb10u3
| I: Retrieving libcom-err2 1.44.5-1+deb10u3
| I: Validating libcom-err2 1.44.5-1+deb10u3
| I: Retrieving libext2fs2 1.44.5-1+deb10u3
| I: Validating libext2fs2 1.44.5-1+deb10u3
| I: Retrieving libss2 1.44.5-1+deb10u3
| I: Validating libss2 1.44.5-1+deb10u3
| I: Retrieving findutils 4.6.0+git+20190209-2
| I: Validating findutils 4.6.0+git+20190209-2
| I: Retrieving gcc-8-base 8.3.0-6
| I: Validating gcc-8-base 8.3.0-6
| I: Retrieving libgcc1 1:8.3.0-6
| I: Validating libgcc1 1:8.3.0-6
| I: Retrieving libstdc++6 8.3.0-6
| I: Validating libstdc++6 8.3.0-6
| I: Retrieving libc-bin 2.28-10+deb10u1
| I: Validating libc-bin 2.28-10+deb10u1
| I: Retrieving libc-l10n 2.28-10+deb10u1
| I: Validating libc-l10n 2.28-10+deb10u1
| I: Retrieving libc6 2.28-10+deb10u1
| I: Validating libc6 2.28-10+deb10u1
| I: Retrieving locales 2.28-10+deb10u1
| I: Validating locales 2.28-10+deb10u1
| I: Retrieving libgmp10 2:6.1.2+dfsg-4+deb10u1
| I: Validating libgmp10 2:6.1.2+dfsg-4+deb10u1
| I: Retrieving dirmngr 2.2.12-1+deb10u1
| I: Validating dirmngr 2.2.12-1+deb10u1
| I: Retrieving gnupg 2.2.12-1+deb10u1
| I: Validating gnupg 2.2.12-1+deb10u1
| I: Retrieving gnupg-l10n 2.2.12-1+deb10u1
| I: Validating gnupg-l10n 2.2.12-1+deb10u1
| I: Retrieving gnupg-utils 2.2.12-1+deb10u1
| I: Validating gnupg-utils 2.2.12-1+deb10u1
| I: Retrieving gpg 2.2.12-1+deb10u1
| I: Validating gpg 2.2.12-1+deb10u1
| I: Retrieving gpg-agent 2.2.12-1+deb10u1
| I: Validating gpg-agent 2.2.12-1+deb10u1
| I: Retrieving gpg-wks-client 2.2.12-1+deb10u1
| I: Validating gpg-wks-client 2.2.12-1+deb10u1
| I: Retrieving gpg-wks-server 2.2.12-1+deb10u1
| I: Validating gpg-wks-server 2.2.12-1+deb10u1
| I: Retrieving gpgconf 2.2.12-1+deb10u1
| I: Validating gpgconf 2.2.12-1+deb10u1
| I: Retrieving gpgsm 2.2.12-1+deb10u1
| I: Validating gpgsm 2.2.12-1+deb10u1
| I: Retrieving gpgv 2.2.12-1+deb10u1
| I: Validating gpgv 2.2.12-1+deb10u1
| I: Retrieving libgnutls30 3.6.7-4+deb10u7
| I: Validating libgnutls30 3.6.7-4+deb10u7
| I: Retrieving grep 3.3-1
| I: Validating grep 3.3-1
| I: Retrieving gzip 1.9-3
| I: Validating gzip 1.9-3
| I: Retrieving hostname 3.21
| I: Validating hostname 3.21
| I: Retrieving init-system-helpers 1.56+nmu1
| I: Validating init-system-helpers 1.56+nmu1
| I: Retrieving libassuan0 2.5.2-1
| I: Validating libassuan0 2.5.2-1
| I: Retrieving libcap-ng0 0.7.9-2
| I: Validating libcap-ng0 0.7.9-2
| I: Retrieving libffi6 3.2.1-9
| I: Validating libffi6 3.2.1-9
| I: Retrieving libgcrypt20 1.8.4-5+deb10u1
| I: Validating libgcrypt20 1.8.4-5+deb10u1
| I: Retrieving libgpg-error0 1.35-1
| I: Validating libgpg-error0 1.35-1
| I: Retrieving libidn2-0 2.0.5-1+deb10u1
| I: Validating libidn2-0 2.0.5-1+deb10u1
| I: Retrieving libksba8 1.3.5-2
| I: Validating libksba8 1.3.5-2
| I: Retrieving libseccomp2 2.3.3-4
| I: Validating libseccomp2 2.3.3-4
| I: Retrieving libselinux1 2.8-1+b1
| I: Validating libselinux1 2.8-1+b1
| I: Retrieving libsemanage-common 2.8-2
| I: Validating libsemanage-common 2.8-2
| I: Retrieving libsemanage1 2.8-2
| I: Validating libsemanage1 2.8-2
| I: Retrieving libsepol1 2.8-1
| I: Validating libsepol1 2.8-1
| I: Retrieving libtasn1-6 4.13-3
| I: Validating libtasn1-6 4.13-3
| I: Retrieving libunistring2 0.9.10-1
| I: Validating libunistring2 0.9.10-1
| I: Retrieving libzstd1 1.3.8+dfsg-3+deb10u2
| I: Validating libzstd1 1.3.8+dfsg-3+deb10u2
| I: Retrieving lsb-base 10.2019051400
| I: Validating lsb-base 10.2019051400
| I: Retrieving liblz4-1 1.8.3-1+deb10u1
| I: Validating liblz4-1 1.8.3-1+deb10u1
| I: Retrieving mawk 1.3.3-17+b3
| I: Validating mawk 1.3.3-17+b3
| I: Retrieving libncursesw6 6.1+20181013-2+deb10u2
| I: Validating libncursesw6 6.1+20181013-2+deb10u2
| I: Retrieving libtinfo6 6.1+20181013-2+deb10u2
| I: Validating libtinfo6 6.1+20181013-2+deb10u2
| I: Retrieving ncurses-base 6.1+20181013-2+deb10u2
| I: Validating ncurses-base 6.1+20181013-2+deb10u2
| I: Retrieving ncurses-bin 6.1+20181013-2+deb10u2
| I: Validating ncurses-bin 6.1+20181013-2+deb10u2
| I: Retrieving libhogweed4 3.4.1-1+deb10u1
| I: Validating libhogweed4 3.4.1-1+deb10u1
| I: Retrieving libnettle6 3.4.1-1+deb10u1
| I: Validating libnettle6 3.4.1-1+deb10u1
| I: Retrieving libnpth0 1.6-1
| I: Validating libnpth0 1.6-1
| I: Retrieving libldap-2.4-2 2.4.47+dfsg-3+deb10u6
| I: Validating libldap-2.4-2 2.4.47+dfsg-3+deb10u6
| I: Retrieving libldap-common 2.4.47+dfsg-3+deb10u6
| I: Validating libldap-common 2.4.47+dfsg-3+deb10u6
| I: Retrieving libp11-kit0 0.23.15-2+deb10u1
| I: Validating libp11-kit0 0.23.15-2+deb10u1
| I: Retrieving libpam-modules 1.3.1-5
| I: Validating libpam-modules 1.3.1-5
| I: Retrieving libpam-modules-bin 1.3.1-5
| I: Validating libpam-modules-bin 1.3.1-5
| I: Retrieving libpam-runtime 1.3.1-5
| I: Validating libpam-runtime 1.3.1-5
| I: Retrieving libpam0g 1.3.1-5
| I: Validating libpam0g 1.3.1-5
| I: Retrieving libpcre3 2:8.39-12
| I: Validating libpcre3 2:8.39-12
| I: Retrieving perl-base 5.28.1-6+deb10u1
| I: Validating perl-base 5.28.1-6+deb10u1
| I: Retrieving pinentry-curses 1.1.0-2
| I: Validating pinentry-curses 1.1.0-2
| I: Retrieving libreadline7 7.0-5
| I: Validating libreadline7 7.0-5
| I: Retrieving readline-common 7.0-5
| I: Validating readline-common 7.0-5
| I: Retrieving sed 4.7-1
| I: Validating sed 4.7-1
| I: Retrieving login 1:4.5-1.1
| I: Validating login 1:4.5-1.1
| I: Retrieving passwd 1:4.5-1.1
| I: Validating passwd 1:4.5-1.1
| I: Retrieving libsqlite3-0 3.27.2-3+deb10u1
| I: Validating libsqlite3-0 3.27.2-3+deb10u1
| I: Retrieving libsystemd0 241-7~deb10u8
| I: Validating libsystemd0 241-7~deb10u8
| I: Retrieving libudev1 241-7~deb10u8
| I: Validating libudev1 241-7~deb10u8
| I: Retrieving sysvinit-utils 2.93-8
| I: Validating sysvinit-utils 2.93-8
| I: Retrieving tar 1.30+dfsg-6
| I: Validating tar 1.30+dfsg-6
| I: Retrieving tzdata 2021a-0+deb10u3
| I: Validating tzdata 2021a-0+deb10u3
| I: Retrieving bsdutils 1:2.33.1-0.1
| I: Validating bsdutils 1:2.33.1-0.1
| I: Retrieving fdisk 2.33.1-0.1
| I: Validating fdisk 2.33.1-0.1
| I: Retrieving libblkid1 2.33.1-0.1
| I: Validating libblkid1 2.33.1-0.1
| I: Retrieving libfdisk1 2.33.1-0.1
| I: Validating libfdisk1 2.33.1-0.1
| I: Retrieving libmount1 2.33.1-0.1
| I: Validating libmount1 2.33.1-0.1
| I: Retrieving libsmartcols1 2.33.1-0.1
| I: Validating libsmartcols1 2.33.1-0.1
| I: Retrieving libuuid1 2.33.1-0.1
| I: Validating libuuid1 2.33.1-0.1
| I: Retrieving mount 2.33.1-0.1
| I: Validating mount 2.33.1-0.1
| I: Retrieving util-linux 2.33.1-0.1
| I: Validating util-linux 2.33.1-0.1
| I: Retrieving liblzma5 5.2.4-1
| I: Validating liblzma5 5.2.4-1
| I: Retrieving zlib1g 1:1.2.11.dfsg-1
| I: Validating zlib1g 1:1.2.11.dfsg-1
| I: Chosen extractor for .deb packages: dpkg-deb
| I: Extracting libacl1...
| I: Extracting adduser...
| I: Extracting apt...
| I: Extracting libapt-pkg5.0...
| I: Extracting libattr1...
| I: Extracting libaudit-common...
| I: Extracting libaudit1...
| I: Extracting base-files...
| I: Extracting base-passwd...
| I: Extracting bash...
| I: Extracting libbz2-1.0...
| I: Extracting libdebconfclient0...
| I: Extracting coreutils...
| I: Extracting dash...
| I: Extracting libdb5.3...
| I: Extracting debconf...
| I: Extracting debian-archive-keyring...
| I: Extracting debianutils...
| I: Extracting diffutils...
| I: Extracting dpkg...
| I: Extracting e2fsprogs...
| I: Extracting libcom-err2...
| I: Extracting libext2fs2...
| I: Extracting libss2...
| I: Extracting findutils...
| I: Extracting gcc-8-base...
| I: Extracting libgcc1...
| I: Extracting libstdc++6...
| I: Extracting libc-bin...
| I: Extracting libc6...
| I: Extracting libgmp10...
| I: Extracting gpgv...
| I: Extracting libgnutls30...
| I: Extracting grep...
| I: Extracting gzip...
| I: Extracting hostname...
| I: Extracting init-system-helpers...
| I: Extracting libcap-ng0...
| I: Extracting libffi6...
| I: Extracting libgcrypt20...
| I: Extracting libgpg-error0...
| I: Extracting libidn2-0...
| I: Extracting libseccomp2...
| I: Extracting libselinux1...
| I: Extracting libsemanage-common...
| I: Extracting libsemanage1...
| I: Extracting libsepol1...
| I: Extracting libtasn1-6...
| I: Extracting libunistring2...
| I: Extracting libzstd1...
| I: Extracting liblz4-1...
| I: Extracting mawk...
| I: Extracting libncursesw6...
| I: Extracting libtinfo6...
| I: Extracting ncurses-base...
| I: Extracting ncurses-bin...
| I: Extracting libhogweed4...
| I: Extracting libnettle6...
| I: Extracting libp11-kit0...
| I: Extracting libpam-modules...
| I: Extracting libpam-modules-bin...
| I: Extracting libpam-runtime...
| I: Extracting libpam0g...
| I: Extracting libpcre3...
| I: Extracting perl-base...
| I: Extracting sed...
| I: Extracting login...
| I: Extracting passwd...
| I: Extracting libsystemd0...
| I: Extracting libudev1...
| I: Extracting sysvinit-utils...
| I: Extracting tar...
| I: Extracting tzdata...
| I: Extracting bsdutils...
| I: Extracting fdisk...
| I: Extracting libblkid1...
| I: Extracting libfdisk1...
| I: Extracting libmount1...
| I: Extracting libsmartcols1...
| I: Extracting libuuid1...
| I: Extracting mount...
| I: Extracting util-linux...
| I: Extracting liblzma5...
| I: Extracting zlib1g...
| I: Running command: chroot /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs /debootstrap/debootstrap --second-stage
| W: Failure trying to run:  mount -t proc proc /proc
| W: See //debootstrap/debootstrap.log for details
| W: Failure trying to run:  /sbin/ldconfig
| W: See //debootstrap/debootstrap.log for details
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/temp/run.do_bootstrap.600' failed with exit code 1:
| I: Running command: debootstrap --arch arm64 --foreign --verbose --variant=minbase --include=locales,gnupg --components=main,contrib,non-free buster /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs http://deb.debian.org/debian
| I: Retrieving InRelease
| I: Checking Release signature
| I: Valid Release signature (key id 6D33866EDD8FFA41C0143AEDDCC9EFBF77E11517)
| I: Retrieving Packages
| I: Validating Packages
| I: Retrieving Packages
| I: Validating Packages
| I: Retrieving Packages
| I: Validating Packages
| I: Resolving dependencies of required packages...
| I: Resolving dependencies of base packages...
| I: Checking component main on http://deb.debian.org/debian...
| I: Retrieving libacl1 2.2.53-4
| I: Validating libacl1 2.2.53-4
| I: Retrieving adduser 3.118
| I: Validating adduser 3.118
| I: Retrieving apt 1.8.2.3
| I: Validating apt 1.8.2.3
| I: Retrieving libapt-pkg5.0 1.8.2.3
| I: Validating libapt-pkg5.0 1.8.2.3
| I: Retrieving libattr1 1:2.4.48-4
| I: Validating libattr1 1:2.4.48-4
| I: Retrieving libaudit-common 1:2.8.4-3
| I: Validating libaudit-common 1:2.8.4-3
| I: Retrieving libaudit1 1:2.8.4-3
| I: Validating libaudit1 1:2.8.4-3
| I: Retrieving base-files 10.3+deb10u12
| I: Validating base-files 10.3+deb10u12
| I: Retrieving base-passwd 3.5.46
| I: Validating base-passwd 3.5.46
| I: Retrieving bash 5.0-4
| I: Validating bash 5.0-4
| I: Retrieving libbz2-1.0 1.0.6-9.2~deb10u1
| I: Validating libbz2-1.0 1.0.6-9.2~deb10u1
| I: Retrieving libdebconfclient0 0.249
| I: Validating libdebconfclient0 0.249
| I: Retrieving coreutils 8.30-3
| I: Validating coreutils 8.30-3
| I: Retrieving libsasl2-2 2.1.27+dfsg-1+deb10u2
| I: Validating libsasl2-2 2.1.27+dfsg-1+deb10u2
| I: Retrieving libsasl2-modules-db 2.1.27+dfsg-1+deb10u2
| I: Validating libsasl2-modules-db 2.1.27+dfsg-1+deb10u2
| I: Retrieving dash 0.5.10.2-5
| I: Validating dash 0.5.10.2-5
| I: Retrieving libdb5.3 5.3.28+dfsg1-0.5
| I: Validating libdb5.3 5.3.28+dfsg1-0.5
| I: Retrieving debconf 1.5.71+deb10u1
| I: Validating debconf 1.5.71+deb10u1
| I: Retrieving debian-archive-keyring 2019.1+deb10u1
| I: Validating debian-archive-keyring 2019.1+deb10u1
| I: Retrieving debianutils 4.8.6.1
| I: Validating debianutils 4.8.6.1
| I: Retrieving diffutils 1:3.7-3
| I: Validating diffutils 1:3.7-3
| I: Retrieving dpkg 1.19.7
| I: Validating dpkg 1.19.7
| I: Retrieving e2fsprogs 1.44.5-1+deb10u3
| I: Validating e2fsprogs 1.44.5-1+deb10u3
| I: Retrieving libcom-err2 1.44.5-1+deb10u3
| I: Validating libcom-err2 1.44.5-1+deb10u3
| I: Retrieving libext2fs2 1.44.5-1+deb10u3
| I: Validating libext2fs2 1.44.5-1+deb10u3
| I: Retrieving libss2 1.44.5-1+deb10u3
| I: Validating libss2 1.44.5-1+deb10u3
| I: Retrieving findutils 4.6.0+git+20190209-2
| I: Validating findutils 4.6.0+git+20190209-2
| I: Retrieving gcc-8-base 8.3.0-6
| I: Validating gcc-8-base 8.3.0-6
| I: Retrieving libgcc1 1:8.3.0-6
| I: Validating libgcc1 1:8.3.0-6
| I: Retrieving libstdc++6 8.3.0-6
| I: Validating libstdc++6 8.3.0-6
| I: Retrieving libc-bin 2.28-10+deb10u1
| I: Validating libc-bin 2.28-10+deb10u1
| I: Retrieving libc-l10n 2.28-10+deb10u1
| I: Validating libc-l10n 2.28-10+deb10u1
| I: Retrieving libc6 2.28-10+deb10u1
| I: Validating libc6 2.28-10+deb10u1
| I: Retrieving locales 2.28-10+deb10u1
| I: Validating locales 2.28-10+deb10u1
| I: Retrieving libgmp10 2:6.1.2+dfsg-4+deb10u1
| I: Validating libgmp10 2:6.1.2+dfsg-4+deb10u1
| I: Retrieving dirmngr 2.2.12-1+deb10u1
| I: Validating dirmngr 2.2.12-1+deb10u1
| I: Retrieving gnupg 2.2.12-1+deb10u1
| I: Validating gnupg 2.2.12-1+deb10u1
| I: Retrieving gnupg-l10n 2.2.12-1+deb10u1
| I: Validating gnupg-l10n 2.2.12-1+deb10u1
| I: Retrieving gnupg-utils 2.2.12-1+deb10u1
| I: Validating gnupg-utils 2.2.12-1+deb10u1
| I: Retrieving gpg 2.2.12-1+deb10u1
| I: Validating gpg 2.2.12-1+deb10u1
| I: Retrieving gpg-agent 2.2.12-1+deb10u1
| I: Validating gpg-agent 2.2.12-1+deb10u1
| I: Retrieving gpg-wks-client 2.2.12-1+deb10u1
| I: Validating gpg-wks-client 2.2.12-1+deb10u1
| I: Retrieving gpg-wks-server 2.2.12-1+deb10u1
| I: Validating gpg-wks-server 2.2.12-1+deb10u1
| I: Retrieving gpgconf 2.2.12-1+deb10u1
| I: Validating gpgconf 2.2.12-1+deb10u1
| I: Retrieving gpgsm 2.2.12-1+deb10u1
| I: Validating gpgsm 2.2.12-1+deb10u1
| I: Retrieving gpgv 2.2.12-1+deb10u1
| I: Validating gpgv 2.2.12-1+deb10u1
| I: Retrieving libgnutls30 3.6.7-4+deb10u7
| I: Validating libgnutls30 3.6.7-4+deb10u7
| I: Retrieving grep 3.3-1
| I: Validating grep 3.3-1
| I: Retrieving gzip 1.9-3
| I: Validating gzip 1.9-3
| I: Retrieving hostname 3.21
| I: Validating hostname 3.21
| I: Retrieving init-system-helpers 1.56+nmu1
| I: Validating init-system-helpers 1.56+nmu1
| I: Retrieving libassuan0 2.5.2-1
| I: Validating libassuan0 2.5.2-1
| I: Retrieving libcap-ng0 0.7.9-2
| I: Validating libcap-ng0 0.7.9-2
| I: Retrieving libffi6 3.2.1-9
| I: Validating libffi6 3.2.1-9
| I: Retrieving libgcrypt20 1.8.4-5+deb10u1
| I: Validating libgcrypt20 1.8.4-5+deb10u1
| I: Retrieving libgpg-error0 1.35-1
| I: Validating libgpg-error0 1.35-1
| I: Retrieving libidn2-0 2.0.5-1+deb10u1
| I: Validating libidn2-0 2.0.5-1+deb10u1
| I: Retrieving libksba8 1.3.5-2
| I: Validating libksba8 1.3.5-2
| I: Retrieving libseccomp2 2.3.3-4
| I: Validating libseccomp2 2.3.3-4
| I: Retrieving libselinux1 2.8-1+b1
| I: Validating libselinux1 2.8-1+b1
| I: Retrieving libsemanage-common 2.8-2
| I: Validating libsemanage-common 2.8-2
| I: Retrieving libsemanage1 2.8-2
| I: Validating libsemanage1 2.8-2
| I: Retrieving libsepol1 2.8-1
| I: Validating libsepol1 2.8-1
| I: Retrieving libtasn1-6 4.13-3
| I: Validating libtasn1-6 4.13-3
| I: Retrieving libunistring2 0.9.10-1
| I: Validating libunistring2 0.9.10-1
| I: Retrieving libzstd1 1.3.8+dfsg-3+deb10u2
| I: Validating libzstd1 1.3.8+dfsg-3+deb10u2
| I: Retrieving lsb-base 10.2019051400
| I: Validating lsb-base 10.2019051400
| I: Retrieving liblz4-1 1.8.3-1+deb10u1
| I: Validating liblz4-1 1.8.3-1+deb10u1
| I: Retrieving mawk 1.3.3-17+b3
| I: Validating mawk 1.3.3-17+b3
| I: Retrieving libncursesw6 6.1+20181013-2+deb10u2
| I: Validating libncursesw6 6.1+20181013-2+deb10u2
| I: Retrieving libtinfo6 6.1+20181013-2+deb10u2
| I: Validating libtinfo6 6.1+20181013-2+deb10u2
| I: Retrieving ncurses-base 6.1+20181013-2+deb10u2
| I: Validating ncurses-base 6.1+20181013-2+deb10u2
| I: Retrieving ncurses-bin 6.1+20181013-2+deb10u2
| I: Validating ncurses-bin 6.1+20181013-2+deb10u2
| I: Retrieving libhogweed4 3.4.1-1+deb10u1
| I: Validating libhogweed4 3.4.1-1+deb10u1
| I: Retrieving libnettle6 3.4.1-1+deb10u1
| I: Validating libnettle6 3.4.1-1+deb10u1
| I: Retrieving libnpth0 1.6-1
| I: Validating libnpth0 1.6-1
| I: Retrieving libldap-2.4-2 2.4.47+dfsg-3+deb10u6
| I: Validating libldap-2.4-2 2.4.47+dfsg-3+deb10u6
| I: Retrieving libldap-common 2.4.47+dfsg-3+deb10u6
| I: Validating libldap-common 2.4.47+dfsg-3+deb10u6
| I: Retrieving libp11-kit0 0.23.15-2+deb10u1
| I: Validating libp11-kit0 0.23.15-2+deb10u1
| I: Retrieving libpam-modules 1.3.1-5
| I: Validating libpam-modules 1.3.1-5
| I: Retrieving libpam-modules-bin 1.3.1-5
| I: Validating libpam-modules-bin 1.3.1-5
| I: Retrieving libpam-runtime 1.3.1-5
| I: Validating libpam-runtime 1.3.1-5
| I: Retrieving libpam0g 1.3.1-5
| I: Validating libpam0g 1.3.1-5
| I: Retrieving libpcre3 2:8.39-12
| I: Validating libpcre3 2:8.39-12
| I: Retrieving perl-base 5.28.1-6+deb10u1
| I: Validating perl-base 5.28.1-6+deb10u1
| I: Retrieving pinentry-curses 1.1.0-2
| I: Validating pinentry-curses 1.1.0-2
| I: Retrieving libreadline7 7.0-5
| I: Validating libreadline7 7.0-5
| I: Retrieving readline-common 7.0-5
| I: Validating readline-common 7.0-5
| I: Retrieving sed 4.7-1
| I: Validating sed 4.7-1
| I: Retrieving login 1:4.5-1.1
| I: Validating login 1:4.5-1.1
| I: Retrieving passwd 1:4.5-1.1
| I: Validating passwd 1:4.5-1.1
| I: Retrieving libsqlite3-0 3.27.2-3+deb10u1
| I: Validating libsqlite3-0 3.27.2-3+deb10u1
| I: Retrieving libsystemd0 241-7~deb10u8
| I: Validating libsystemd0 241-7~deb10u8
| I: Retrieving libudev1 241-7~deb10u8
| I: Validating libudev1 241-7~deb10u8
| I: Retrieving sysvinit-utils 2.93-8
| I: Validating sysvinit-utils 2.93-8
| I: Retrieving tar 1.30+dfsg-6
| I: Validating tar 1.30+dfsg-6
| I: Retrieving tzdata 2021a-0+deb10u3
| I: Validating tzdata 2021a-0+deb10u3
| I: Retrieving bsdutils 1:2.33.1-0.1
| I: Validating bsdutils 1:2.33.1-0.1
| I: Retrieving fdisk 2.33.1-0.1
| I: Validating fdisk 2.33.1-0.1
| I: Retrieving libblkid1 2.33.1-0.1
| I: Validating libblkid1 2.33.1-0.1
| I: Retrieving libfdisk1 2.33.1-0.1
| I: Validating libfdisk1 2.33.1-0.1
| I: Retrieving libmount1 2.33.1-0.1
| I: Validating libmount1 2.33.1-0.1
| I: Retrieving libsmartcols1 2.33.1-0.1
| I: Validating libsmartcols1 2.33.1-0.1
| I: Retrieving libuuid1 2.33.1-0.1
| I: Validating libuuid1 2.33.1-0.1
| I: Retrieving mount 2.33.1-0.1
| I: Validating mount 2.33.1-0.1
| I: Retrieving util-linux 2.33.1-0.1
| I: Validating util-linux 2.33.1-0.1
| I: Retrieving liblzma5 5.2.4-1
| I: Validating liblzma5 5.2.4-1
| I: Retrieving zlib1g 1:1.2.11.dfsg-1
| I: Validating zlib1g 1:1.2.11.dfsg-1
| I: Chosen extractor for .deb packages: dpkg-deb
| I: Extracting libacl1...
| I: Extracting adduser...
| I: Extracting apt...
| I: Extracting libapt-pkg5.0...
| I: Extracting libattr1...
| I: Extracting libaudit-common...
| I: Extracting libaudit1...
| I: Extracting base-files...
| I: Extracting base-passwd...
| I: Extracting bash...
| I: Extracting libbz2-1.0...
| I: Extracting libdebconfclient0...
| I: Extracting coreutils...
| I: Extracting dash...
| I: Extracting libdb5.3...
| I: Extracting debconf...
| I: Extracting debian-archive-keyring...
| I: Extracting debianutils...
| I: Extracting diffutils...
| I: Extracting dpkg...
| I: Extracting e2fsprogs...
| I: Extracting libcom-err2...
| I: Extracting libext2fs2...
| I: Extracting libss2...
| I: Extracting findutils...
| I: Extracting gcc-8-base...
| I: Extracting libgcc1...
| I: Extracting libstdc++6...
| I: Extracting libc-bin...
| I: Extracting libc6...
| I: Extracting libgmp10...
| I: Extracting gpgv...
| I: Extracting libgnutls30...
| I: Extracting grep...
| I: Extracting gzip...
| I: Extracting hostname...
| I: Extracting init-system-helpers...
| I: Extracting libcap-ng0...
| I: Extracting libffi6...
| I: Extracting libgcrypt20...
| I: Extracting libgpg-error0...
| I: Extracting libidn2-0...
| I: Extracting libseccomp2...
| I: Extracting libselinux1...
| I: Extracting libsemanage-common...
| I: Extracting libsemanage1...
| I: Extracting libsepol1...
| I: Extracting libtasn1-6...
| I: Extracting libunistring2...
| I: Extracting libzstd1...
| I: Extracting liblz4-1...
| I: Extracting mawk...
| I: Extracting libncursesw6...
| I: Extracting libtinfo6...
| I: Extracting ncurses-base...
| I: Extracting ncurses-bin...
| I: Extracting libhogweed4...
| I: Extracting libnettle6...
| I: Extracting libp11-kit0...
| I: Extracting libpam-modules...
| I: Extracting libpam-modules-bin...
| I: Extracting libpam-runtime...
| I: Extracting libpam0g...
| I: Extracting libpcre3...
| I: Extracting perl-base...
| I: Extracting sed...
| I: Extracting login...
| I: Extracting passwd...
| I: Extracting libsystemd0...
| I: Extracting libudev1...
| I: Extracting sysvinit-utils...
| I: Extracting tar...
| I: Extracting tzdata...
| I: Extracting bsdutils...
| I: Extracting fdisk...
| I: Extracting libblkid1...
| I: Extracting libfdisk1...
| I: Extracting libmount1...
| I: Extracting libsmartcols1...
| I: Extracting libuuid1...
| I: Extracting mount...
| I: Extracting util-linux...
| I: Extracting liblzma5...
| I: Extracting zlib1g...
| I: Running command: chroot /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs /debootstrap/debootstrap --second-stage
| W: Failure trying to run:  mount -t proc proc /proc
| W: See //debootstrap/debootstrap.log for details
| W: Failure trying to run:  /sbin/ldconfig
| W: See //debootstrap/debootstrap.log for details
| WARNING: exit code 1 from a shell command.
| 
ERROR: Task (mc:rpi4-jailhouse-demo:/work/isar/meta/recipes-core/isar-bootstrap/isar-bootstrap-target.bb:do_bootstrap) failed with exit code '1'
NOTE: Tasks Summary: Attempted 120 tasks of which 0 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  mc:rpi4-jailhouse-demo:/work/isar/meta/recipes-core/isar-bootstrap/isar-bootstrap-target.bb:do_bootstrap
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
yelena@LDT-Y-KONYUKH:~/FENRIR_WORK/JAILHOUSE_V012/jailhouse-images$ 






------=_Part_3808_782283646.1658335808766--
