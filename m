Return-Path: <jailhouse-dev+bncBDUZ5DVA4MLBBSUUWCDAMGQERGGXJIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF183AC109
	for <lists+jailhouse-dev@lfdr.de>; Fri, 18 Jun 2021 04:51:55 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id 100-20020aed206d0000b029024ea3acef5bsf3583933qta.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Jun 2021 19:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=64ZLfQQeidSxiUNMsyGFTPfNrLsmp6ZbG5pCE2D1U3w=;
        b=AsHbgh4SCuWZjyYHnt0287N3qyHdVChMh6jj4Saaaydo3i6COLbNXfY2pvu/Fm98ji
         t2F1of2uoConvza2gJDVYcEA1ETtLg+TEwedfNH0NMGcNWdPvh8ErZ3vlCw3dvfZzosS
         d6r9po9wICjh3vst8ThIgWXPGRner3gjIqxn2uI850Pm53Pq8cTp2TPFa/qUKraonTh2
         Vg2zI5whyAsVqsSLJDXXYY0qnGQ3JNW/0HSJeAZa/shs11A0JIXQO/csB4pX1X7Wl1zj
         jteeik4IOdbHo0g/VT76M3eb8TrKoo0CdloJqnzglXYPdr+T9RSbgA3RLQgySl/arWnM
         ilpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=64ZLfQQeidSxiUNMsyGFTPfNrLsmp6ZbG5pCE2D1U3w=;
        b=DAGuq//nGTpFjTv0XTn1i1XlJu7zwQyA35F1XCs7KV0ZDZXxDn9WqjtrnzkEvfGgoZ
         +UT/zT3IBaqKq8kRx7ooHQK2FegDB/upmCf1HG8whBK6zfvsFiFUAUzY/yDoJ6FsrxyS
         6hKRlWe/gSgEDWnEMvZ1zpiEApO7jgg8dJwQZ67CnKpeZoKo5F9wVMf8fDq8Llkwjvc0
         HUoRlh2hbVqsSO3+5Nteww49Y6ExmbmsnHKMg0ADDBmWse5bogbd9SdzoeMAi67Ygt5i
         9li4hSp5auJUdlUPTs7pP+ARxSKEArWPZ4Jzmijdr0LygGOIDXtWM0+pyTXjeIyShXjp
         2IBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532oLc3jNIamywuRIgziYt69KryWDV7wE5cEOG6iVsSlp+WDfJVX
	W1iwADzlpNjmFLp6pczMivI=
X-Google-Smtp-Source: ABdhPJxO7ubu0dAlNN362SFGSu7BUetHnRqyGIRQ3pZSdi1p+aH9R0CjDgp2WaWxsAhwHkr/XyFdDA==
X-Received: by 2002:a05:620a:12ec:: with SMTP id f12mr906635qkl.246.1623984714430;
        Thu, 17 Jun 2021 19:51:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:b681:: with SMTP id g123ls5721668qkf.10.gmail; Thu, 17
 Jun 2021 19:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:a87:: with SMTP id v7mr7173230qkg.468.1623984713447;
        Thu, 17 Jun 2021 19:51:53 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:51:52 -0700 (PDT)
From: li cheng <lchina77@163.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <22027535-f38c-4c79-81f8-596924ede969n@googlegroups.com>
Subject: Failed to compile jailhouse-images for rpi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_792_1674631409.1623984712483"
X-Original-Sender: lchina77@163.com
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

------=_Part_792_1674631409.1623984712483
Content-Type: multipart/alternative; 
	boundary="----=_Part_793_1692835976.1623984712483"

------=_Part_793_1692835976.1623984712483
Content-Type: text/plain; charset="UTF-8"

I tried to generate jailhouse images for raspberry 4 on my ubuntu 16.04,  
the kernel is 4.4 and kvm_intel module loaded with parameter `nested=1`.

 $ uname -r
4.4.0-210-generic
$ lsmod |grep kvm
kvm_intel             176128  0
kvm                   561152  1 kvm_intel
irqbypass              16384  1 kvm

Then  I ran "build-images.sh" and selected "12: Raspberry Pi 4 (1-8 GB 
editions)" , but failed.
The build log and debootstrap.log were attatched.

 "| W: Failure trying to run:  mount -t proc proc /proc" ,   but I found 
"mount -t proc none '${BUILDCHROOT_DIR}/proc'"  in 
the  isar/meta/classes/buildchroot.bbclass.

So  it seems that I need to set BUILDCHROOT_DIR ?   If yes  when and how 
should I set it ?

Thanks.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/22027535-f38c-4c79-81f8-596924ede969n%40googlegroups.com.

------=_Part_793_1692835976.1623984712483
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried to generate jailhouse images for raspberry 4 on my ubuntu 16.04,&nb=
sp; the kernel is 4.4 and&nbsp;kvm_intel module loaded with parameter `nest=
ed=3D1`.<div><br></div><div>&nbsp;$ uname -r</div><div>4.4.0-210-generic</d=
iv><div><div>$ lsmod |grep kvm</div><div>kvm_intel&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;176128&nbsp; 0</div><div>kvm&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;561152&nbsp; 1 kvm_intel</div>=
<div>irqbypass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 16384&nbsp; =
1 kvm</div></div><div><br></div><div>Then&nbsp; I ran "build-images.sh" and=
 selected "12: Raspberry Pi 4 (1-8 GB editions)" , but failed.</div><div>Th=
e build log and&nbsp;debootstrap.log were attatched.</div><div><br></div><d=
iv>&nbsp;"| W: Failure trying to run:&nbsp; mount -t proc proc /proc" ,&nbs=
p; &nbsp;but I found "mount -t proc none '${BUILDCHROOT_DIR}/proc'"&nbsp; i=
n the&nbsp;&nbsp;isar/meta/classes/buildchroot.bbclass.</div><div><br></div=
><div>So&nbsp; it seems that I need to set BUILDCHROOT_DIR ?&nbsp; &nbsp;If=
 yes&nbsp; when and how should I set it ?</div><div><br></div><div>Thanks.<=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/22027535-f38c-4c79-81f8-596924ede969n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/22027535-f38c-4c79-81f8-596924ede969n%40googlegroups.co=
m</a>.<br />

------=_Part_793_1692835976.1623984712483--

------=_Part_792_1674631409.1623984712483
Content-Type: text/plain; charset=UTF-8; name=debootstrap.log
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=debootstrap.log
X-Attachment-Id: 242c69cd-466d-4440-8434-f45033822ee7
Content-ID: <242c69cd-466d-4440-8434-f45033822ee7>

--2021-06-17 16:00:07--  http://deb.debian.org/debian/dists/buster/InReleas=
e
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 121476 (119K)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_InRelease=E2=80=99

     0K .......... .......... .......... .......... .......... 42%  482K 0s
    50K .......... .......... .......... .......... .......... 84%  568K 0s
   100K .......... ........                                   100% 1.94M=3D=
0.2s

2021-06-17 16:00:08 (590 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.=
debian.org_debian_dists_buster_InRelease=E2=80=99 saved [121476/121476]

gpgv: Signature made Sat 27 Mar 2021 09:56:51 AM UTC
gpgv:                using RSA key 16E90B3FDF65EDE3AA7F323C04EE7237B7D453EC
gpgv: Good signature from "Debian Archive Automatic Signing Key (9/stretch)=
 <ftpmaster@debian.org>"
gpgv: Signature made Sat 27 Mar 2021 09:56:52 AM UTC
gpgv:                using RSA key 0146DC6D4A0B2914BDED34DB648ACFD622F3D138
gpgv: Good signature from "Debian Archive Automatic Signing Key (10/buster)=
 <ftpmaster@debian.org>"
gpgv: Signature made Sat 27 Mar 2021 10:01:25 AM UTC
gpgv:                using RSA key 6D33866EDD8FFA41C0143AEDDCC9EFBF77E11517
gpgv: Good signature from "Debian Stable Release Key (10/buster) <debian-re=
lease@lists.debian.org>"
--2021-06-17 16:00:09--  http://deb.debian.org/debian/dists/buster/main/bin=
ary-arm64/by-hash/SHA256/dd6ddf5f2333de256e74e2b5daf420fd2042b4f61b8f423f5b=
6404fc4f27c9ef
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 7735704 (7.4M)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_main_binary-arm64_Packages.xz=E2=80=99

     0K .......... .......... .......... .......... ..........  0%  472K 16=
s
    50K .......... .......... .......... .......... ..........  1%  554K 15=
s
   100K .......... .......... .......... .......... ..........  1% 1.96M 11=
s
   150K .......... .......... .......... .......... ..........  2% 2.36M 9s
   200K .......... .......... .......... .......... ..........  3%  904K 9s
   250K .......... .......... .......... .......... ..........  3% 3.15M 8s
   300K .......... .......... .......... .......... ..........  4% 3.50M 7s
   350K .......... .......... .......... .......... ..........  5% 4.18M 6s
   400K .......... .......... .......... .......... ..........  5% 3.83M 6s
   450K .......... .......... .......... .......... ..........  6% 1.14M 6s
   500K .......... .......... .......... .......... ..........  7% 2.77M 5s
   550K .......... .......... .......... .......... ..........  7% 2.86M 5s
   600K .......... .......... .......... .......... ..........  8% 2.89M 5s
   650K .......... .......... .......... .......... ..........  9% 3.03M 5s
   700K .......... .......... .......... .......... ..........  9% 2.91M 4s
   750K .......... .......... .......... .......... .......... 10% 1.88M 4s
   800K .......... .......... .......... .......... .......... 11% 2.85M 4s
   850K .......... .......... .......... .......... .......... 11% 3.20M 4s
   900K .......... .......... .......... .......... .......... 12% 3.02M 4s
   950K .......... .......... .......... .......... .......... 13% 3.00M 4s
  1000K .......... .......... .......... .......... .......... 13% 2.03M 4s
  1050K .......... .......... .......... .......... .......... 14% 2.97M 4s
  1100K .......... .......... .......... .......... .......... 15% 2.87M 3s
  1150K .......... .......... .......... .......... .......... 15% 3.65M 3s
  1200K .......... .......... .......... .......... .......... 16% 3.01M 3s
  1250K .......... .......... .......... .......... .......... 17% 3.20M 3s
  1300K .......... .......... .......... .......... .......... 17% 2.04M 3s
  1350K .......... .......... .......... .......... .......... 18% 3.31M 3s
  1400K .......... .......... .......... .......... .......... 19% 3.18M 3s
  1450K .......... .......... .......... .......... .......... 19% 3.37M 3s
  1500K .......... .......... .......... .......... .......... 20% 3.33M 3s
  1550K .......... .......... .......... .......... .......... 21% 3.34M 3s
  1600K .......... .......... .......... .......... .......... 21% 2.25M 3s
  1650K .......... .......... .......... .......... .......... 22% 3.08M 3s
  1700K .......... .......... .......... .......... .......... 23% 3.43M 3s
  1750K .......... .......... .......... .......... .......... 23% 3.43M 3s
  1800K .......... .......... .......... .......... .......... 24% 3.68M 3s
  1850K .......... .......... .......... .......... .......... 25% 3.52M 3s
  1900K .......... .......... .......... .......... .......... 25% 3.57M 3s
  1950K .......... .......... .......... .......... .......... 26% 2.15M 2s
  2000K .......... .......... .......... .......... .......... 27% 3.70M 2s
  2050K .......... .......... .......... .......... .......... 27% 3.51M 2s
  2100K .......... .......... .......... .......... .......... 28% 3.64M 2s
  2150K .......... .......... .......... .......... .......... 29% 3.72M 2s
  2200K .......... .......... .......... .......... .......... 29% 3.89M 2s
  2250K .......... .......... .......... .......... .......... 30% 2.30M 2s
  2300K .......... .......... .......... .......... .......... 31% 3.52M 2s
  2350K .......... .......... .......... .......... .......... 31% 3.66M 2s
  2400K .......... .......... .......... .......... .......... 32% 3.82M 2s
  2450K .......... .......... .......... .......... .......... 33% 3.91M 2s
  2500K .......... .......... .......... .......... .......... 33% 3.92M 2s
  2550K .......... .......... .......... .......... .......... 34% 3.73M 2s
  2600K .......... .......... .......... .......... .......... 35% 2.53M 2s
  2650K .......... .......... .......... .......... .......... 35% 3.57M 2s
  2700K .......... .......... .......... .......... .......... 36% 3.68M 2s
  2750K .......... .......... .......... .......... .......... 37% 4.15M 2s
  2800K .......... .......... .......... .......... .......... 37% 4.11M 2s
  2850K .......... .......... .......... .......... .......... 38% 4.01M 2s
  2900K .......... .......... .......... .......... .......... 39% 4.11M 2s
  2950K .......... .......... .......... .......... .......... 39% 4.20M 2s
  3000K .......... .......... .......... .......... .......... 40% 2.39M 2s
  3050K .......... .......... .......... .......... .......... 41% 4.12M 2s
  3100K .......... .......... .......... .......... .......... 41% 3.99M 2s
  3150K .......... .......... .......... .......... .......... 42% 4.27M 2s
  3200K .......... .......... .......... .......... .......... 43% 4.09M 2s
  3250K .......... .......... .......... .......... .......... 43% 4.26M 2s
  3300K .......... .......... .......... .......... .......... 44% 4.44M 2s
  3350K .......... .......... .......... .......... .......... 45% 4.33M 2s
  3400K .......... .......... .......... .......... .......... 45% 2.47M 2s
  3450K .......... .......... .......... .......... .......... 46% 4.36M 2s
  3500K .......... .......... .......... .......... .......... 46% 4.28M 1s
  3550K .......... .......... .......... .......... .......... 47% 4.31M 1s
  3600K .......... .......... .......... .......... .......... 48% 4.39M 1s
  3650K .......... .......... .......... .......... .......... 48% 4.57M 1s
  3700K .......... .......... .......... .......... .......... 49% 4.37M 1s
  3750K .......... .......... .......... .......... .......... 50% 4.79M 1s
  3800K .......... .......... .......... .......... .......... 50% 2.61M 1s
  3850K .......... .......... .......... .......... .......... 51% 4.26M 1s
  3900K .......... .......... .......... .......... .......... 52% 4.45M 1s
  3950K .......... .......... .......... .......... .......... 52% 4.78M 1s
  4000K .......... .......... .......... .......... .......... 53% 4.79M 1s
  4050K .......... .......... .......... .......... .......... 54% 4.36M 1s
  4100K .......... .......... .......... .......... .......... 54% 4.71M 1s
  4150K .......... .......... .......... .......... .......... 55% 4.96M 1s
  4200K .......... .......... .......... .......... .......... 56% 2.96M 1s
  4250K .......... .......... .......... .......... .......... 56% 4.02M 1s
  4300K .......... .......... .......... .......... .......... 57% 4.86M 1s
  4350K .......... .......... .......... .......... .......... 58% 4.60M 1s
  4400K .......... .......... .......... .......... .......... 58% 4.71M 1s
  4450K .......... .......... .......... .......... .......... 59% 5.24M 1s
  4500K .......... .......... .......... .......... .......... 60% 4.49M 1s
  4550K .......... .......... .......... .......... .......... 60% 4.83M 1s
  4600K .......... .......... .......... .......... .......... 61% 5.09M 1s
  4650K .......... .......... .......... .......... .......... 62% 3.15M 1s
  4700K .......... .......... .......... .......... .......... 62% 4.08M 1s
  4750K .......... .......... .......... .......... .......... 63% 5.00M 1s
  4800K .......... .......... .......... .......... .......... 64% 5.11M 1s
  4850K .......... .......... .......... .......... .......... 64% 4.93M 1s
  4900K .......... .......... .......... .......... .......... 65% 5.24M 1s
  4950K .......... .......... .......... .......... .......... 66% 4.91M 1s
  5000K .......... .......... .......... .......... .......... 66% 5.02M 1s
  5050K .......... .......... .......... .......... .......... 67% 5.09M 1s
  5100K .......... .......... .......... .......... .......... 68% 5.50M 1s
  5150K .......... .......... .......... .......... .......... 68% 3.04M 1s
  5200K .......... .......... .......... .......... .......... 69% 4.35M 1s
  5250K .......... .......... .......... .......... .......... 70% 5.77M 1s
  5300K .......... .......... .......... .......... .......... 70% 5.11M 1s
  5350K .......... .......... .......... .......... .......... 71% 5.52M 1s
  5400K .......... .......... .......... .......... .......... 72% 5.37M 1s
  5450K .......... .......... .......... .......... .......... 72% 5.02M 1s
  5500K .......... .......... .......... .......... .......... 73% 5.40M 1s
  5550K .......... .......... .......... .......... .......... 74% 5.70M 1s
  5600K .......... .......... .......... .......... .......... 74% 5.47M 1s
  5650K .......... .......... .......... .......... .......... 75% 2.93M 1s
  5700K .......... .......... .......... .......... .......... 76% 4.99M 1s
  5750K .......... .......... .......... .......... .......... 76% 5.94M 1s
  5800K .......... .......... .......... .......... .......... 77% 5.48M 1s
  5850K .......... .......... .......... .......... .......... 78% 5.41M 1s
  5900K .......... .......... .......... .......... .......... 78% 6.00M 0s
  5950K .......... .......... .......... .......... .......... 79% 5.24M 0s
  6000K .......... .......... .......... .......... .......... 80% 5.62M 0s
  6050K .......... .......... .......... .......... .......... 80% 6.04M 0s
  6100K .......... .......... .......... .......... .......... 81% 5.56M 0s
  6150K .......... .......... .......... .......... .......... 82% 3.32M 0s
  6200K .......... .......... .......... .......... .......... 82% 4.94M 0s
  6250K .......... .......... .......... .......... .......... 83% 5.57M 0s
  6300K .......... .......... .......... .......... .......... 84% 5.75M 0s
  6350K .......... .......... .......... .......... .......... 84% 6.09M 0s
  6400K .......... .......... .......... .......... .......... 85% 5.55M 0s
  6450K .......... .......... .......... .......... .......... 86% 5.81M 0s
  6500K .......... .......... .......... .......... .......... 86% 6.08M 0s
  6550K .......... .......... .......... .......... .......... 87% 5.76M 0s
  6600K .......... .......... .......... .......... .......... 88% 6.07M 0s
  6650K .......... .......... .......... .......... .......... 88% 6.46M 0s
  6700K .......... .......... .......... .......... .......... 89% 3.50M 0s
  6750K .......... .......... .......... .......... .......... 90% 4.77M 0s
  6800K .......... .......... .......... .......... .......... 90% 5.76M 0s
  6850K .......... .......... .......... .......... .......... 91% 6.15M 0s
  6900K .......... .......... .......... .......... .......... 91% 6.53M 0s
  6950K .......... .......... .......... .......... .......... 92% 5.79M 0s
  7000K .......... .......... .......... .......... .......... 93% 6.33M 0s
  7050K .......... .......... .......... .......... .......... 93% 6.07M 0s
  7100K .......... .......... .......... .......... .......... 94% 5.81M 0s
  7150K .......... .......... .......... .......... .......... 95% 6.65M 0s
  7200K .......... .......... .......... .......... .......... 95% 6.73M 0s
  7250K .......... .......... .......... .......... .......... 96% 5.97M 0s
  7300K .......... .......... .......... .......... .......... 97% 3.44M 0s
  7350K .......... .......... .......... .......... .......... 97% 5.93M 0s
  7400K .......... .......... .......... .......... .......... 98% 5.72M 0s
  7450K .......... .......... .......... .......... .......... 99% 6.40M 0s
  7500K .......... .......... .......... .......... .......... 99% 7.31M 0s
  7550K ....                                                  100% 2.71M=3D=
2.1s

2021-06-17 16:00:11 (3.50 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb=
.debian.org_debian_dists_buster_main_binary-arm64_Packages.xz=E2=80=99 save=
d [7735704/7735704]

--2021-06-17 16:00:12--  http://deb.debian.org/debian/dists/buster/contrib/=
binary-arm64/by-hash/SHA256/4ff769644e5c15565c5e6d9d65661744b659d8d4f0fa65b=
42be9fb3af18b87a4
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 38392 (37K)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_contrib_binary-arm64_Packages.xz=E2=80=99

     0K .......... .......... .......... .......              100%  369K=3D=
0.1s

2021-06-17 16:00:13 (369 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.=
debian.org_debian_dists_buster_contrib_binary-arm64_Packages.xz=E2=80=99 sa=
ved [38392/38392]

--2021-06-17 16:00:13--  http://deb.debian.org/debian/dists/buster/non-free=
/binary-arm64/by-hash/SHA256/b5c2325b63c2f48830fffa32346dece0502c46bbe9e10f=
19629901b9bc8fdf76
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 53844 (53K)
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.debian.org_debian_dist=
s_buster_non-free_binary-arm64_Packages.xz=E2=80=99

     0K .......... .......... .......... .......... .......... 95%  357K 0s
    50K ..                                                    100%  956K=3D=
0.1s

2021-06-17 16:00:13 (368 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs/var/lib/apt/lists/partial/deb.=
debian.org_debian_dists_buster_non-free_binary-arm64_Packages.xz=E2=80=99 s=
aved [53844/53844]

--2021-06-17 16:00:28--  http://deb.debian.org/debian/pool/main/a/acl/libac=
l1_2.2.53-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 29572 (29K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libacl1_2.2.53-4_arm=
64.deb=E2=80=99

     0K .......... .......... ........                        100%  276K=3D=
0.1s

2021-06-17 16:00:29 (276 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libacl1_2.2.53-4_arm64.deb=E2=80=99 saved [29572/29572]

--2021-06-17 16:00:29--  http://deb.debian.org/debian/pool/main/a/adduser/a=
dduser_3.118_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 240384 (235K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/adduser_3.118_all.de=
b=E2=80=99

     0K .......... .......... .......... .......... .......... 21%  415K 0s
    50K .......... .......... .......... .......... .......... 42%  567K 0s
   100K .......... .......... .......... .......... .......... 63% 1.64M 0s
   150K .......... .......... .......... .......... .......... 85% 2.20M 0s
   200K .......... .......... .......... ....                 100%  693K=3D=
0.3s

2021-06-17 16:00:29 (755 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/adduser_3.118_all.deb=E2=80=99 saved [240384/240384]

--2021-06-17 16:00:29--  http://deb.debian.org/debian/pool/main/a/apt/apt_1=
.8.2.2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1369984 (1.3M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/apt_1.8.2.2_arm64.de=
b=E2=80=99

     0K .......... .......... .......... .......... ..........  3%  477K 3s
    50K .......... .......... .......... .......... ..........  7%  571K 2s
   100K .......... .......... .......... .......... .......... 11% 1.96M 2s
   150K .......... .......... .......... .......... .......... 14% 2.41M 1s
   200K .......... .......... .......... .......... .......... 18%  932K 1s
   250K .......... .......... .......... .......... .......... 22% 3.07M 1s
   300K .......... .......... .......... .......... .......... 26% 3.81M 1s
   350K .......... .......... .......... .......... .......... 29% 4.09M 1s
   400K .......... .......... .......... .......... .......... 33% 4.11M 1s
   450K .......... .......... .......... .......... .......... 37% 1.14M 1s
   500K .......... .......... .......... .......... .......... 41% 2.70M 1s
   550K .......... .......... .......... .......... .......... 44% 3.08M 1s
   600K .......... .......... .......... .......... .......... 48% 2.96M 0s
   650K .......... .......... .......... .......... .......... 52% 3.11M 0s
   700K .......... .......... .......... .......... .......... 56% 2.90M 0s
   750K .......... .......... .......... .......... .......... 59% 2.01M 0s
   800K .......... .......... .......... .......... .......... 63% 2.93M 0s
   850K .......... .......... .......... .......... .......... 67% 3.23M 0s
   900K .......... .......... .......... .......... .......... 71% 3.09M 0s
   950K .......... .......... .......... .......... .......... 74% 3.11M 0s
  1000K .......... .......... .......... .......... .......... 78% 2.04M 0s
  1050K .......... .......... .......... .......... .......... 82% 3.12M 0s
  1100K .......... .......... .......... .......... .......... 85% 3.25M 0s
  1150K .......... .......... .......... .......... .......... 89% 3.36M 0s
  1200K .......... .......... .......... .......... .......... 93% 3.12M 0s
  1250K .......... .......... .......... .......... .......... 97% 3.31M 0s
  1300K .......... .......... .......... .......              100% 1.92M=3D=
0.7s

2021-06-17 16:00:30 (1.93 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/apt_1.8.2.2_arm64.deb=E2=80=99 saved [1369984/1369984]

--2021-06-17 16:00:30--  http://deb.debian.org/debian/pool/main/a/apt/libap=
t-pkg5.0_1.8.2.2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 897412 (876K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libapt-pkg5.0_1.8.2.=
2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5%  444K 2s
    50K .......... .......... .......... .......... .......... 11%  527K 2s
   100K .......... .......... .......... .......... .......... 17% 1.85M 1s
   150K .......... .......... .......... .......... .......... 22% 2.23M 1s
   200K .......... .......... .......... .......... .......... 28%  861K 1s
   250K .......... .......... .......... .......... .......... 34% 2.86M 1s
   300K .......... .......... .......... .......... .......... 39% 3.52M 1s
   350K .......... .......... .......... .......... .......... 45% 3.92M 0s
   400K .......... .......... .......... .......... .......... 51% 3.23M 0s
   450K .......... .......... .......... .......... .......... 57% 1.10M 0s
   500K .......... .......... .......... .......... .......... 62% 2.61M 0s
   550K .......... .......... .......... .......... .......... 68% 2.68M 0s
   600K .......... .......... .......... .......... .......... 74% 2.72M 0s
   650K .......... .......... .......... .......... .......... 79% 2.85M 0s
   700K .......... .......... .......... .......... .......... 85% 2.75M 0s
   750K .......... .......... .......... .......... .......... 91% 1.78M 0s
   800K .......... .......... .......... .......... .......... 96% 2.69M 0s
   850K .......... .......... ......                          100% 2.97M=3D=
0.6s

2021-06-17 16:00:31 (1.53 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libapt-pkg5.0_1.8.2.2_arm64.deb=E2=80=99 saved [897412/897412]

--2021-06-17 16:00:31--  http://deb.debian.org/debian/pool/main/a/attr/liba=
ttr1_2.4.48-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 21260 (21K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libattr1_1%3a2.4.48-=
4_arm64.deb=E2=80=99

     0K .......... ..........                                 100% 2.23M=3D=
0.009s

2021-06-17 16:00:31 (2.23 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libattr1_1%3a2.4.48-4_arm64.deb=E2=80=99 saved [21260/21260]

--2021-06-17 16:00:32--  http://deb.debian.org/debian/pool/main/a/audit/lib=
audit-common_2.8.4-3_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 22440 (22K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libaudit-common_1%3a=
2.8.4-3_all.deb=E2=80=99

     0K .......... .......... .                               100% 2.75M=3D=
0.008s

2021-06-17 16:00:32 (2.75 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libaudit-common_1%3a2.8.4-3_all.deb=E2=80=99 saved [22440/22440]

--2021-06-17 16:00:32--  http://deb.debian.org/debian/pool/main/a/audit/lib=
audit1_2.8.4-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 56612 (55K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libaudit1_1%3a2.8.4-=
3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 90%  428K 0s
    50K .....                                                 100% 1.23M=3D=
0.1s

2021-06-17 16:00:32 (456 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libaudit1_1%3a2.8.4-3_arm64.deb=E2=80=99 saved [56612/56612]

--2021-06-17 16:00:32--  http://deb.debian.org/debian/pool/main/b/base-file=
s/base-files_10.3+deb10u9_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 69892 (68K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/base-files_10.3+deb1=
0u9_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 73%  364K 0s
    50K .......... ........                                   100% 1.05M=3D=
0.2s

2021-06-17 16:00:33 (443 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/base-files_10.3+deb10u9_arm64.deb=E2=80=99 saved [69892/69892]

--2021-06-17 16:00:33--  http://deb.debian.org/debian/pool/main/b/base-pass=
wd/base-passwd_3.5.46_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 56268 (55K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/base-passwd_3.5.46_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 90%  446K 0s
    50K ....                                                  100% 1.21M=3D=
0.1s

2021-06-17 16:00:33 (473 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/base-passwd_3.5.46_arm64.deb=E2=80=99 saved [56268/56268]

--2021-06-17 16:00:33--  http://deb.debian.org/debian/pool/main/b/bash/bash=
_5.0-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1345776 (1.3M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/bash_5.0-4_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... ..........  3%  331K 4s
    50K .......... .......... .......... .......... ..........  7%  480K 3s
   100K .......... .......... .......... .......... .......... 11% 1.27M 2s
   150K .......... .......... .......... .......... .......... 15% 1.80M 2s
   200K .......... .......... .......... .......... .......... 19%  736K 2s
   250K .......... .......... .......... .......... .......... 22% 2.35M 1s
   300K .......... .......... .......... .......... .......... 26% 2.80M 1s
   350K .......... .......... .......... .......... .......... 30% 3.27M 1s
   400K .......... .......... .......... .......... .......... 34% 3.70M 1s
   450K .......... .......... .......... .......... .......... 38%  940K 1s
   500K .......... .......... .......... .......... .......... 41% 4.39M 1s
   550K .......... .......... .......... .......... .......... 45% 4.67M 1s
   600K .......... .......... .......... .......... .......... 49% 5.07M 1s
   650K .......... .......... .......... .......... .......... 53% 5.59M 0s
   700K .......... .......... .......... .......... .......... 57% 5.81M 0s
   750K .......... .......... .......... .......... .......... 60% 6.22M 0s
   800K .......... .......... .......... .......... .......... 64% 6.57M 0s
   850K .......... .......... .......... .......... .......... 68% 4.33M 0s
   900K .......... .......... .......... .......... .......... 72%  966K 0s
   950K .......... .......... .......... .......... .......... 76% 4.06M 0s
  1000K .......... .......... .......... .......... .......... 79% 4.23M 0s
  1050K .......... .......... .......... .......... .......... 83% 4.38M 0s
  1100K .......... .......... .......... .......... .......... 87% 4.14M 0s
  1150K .......... .......... .......... .......... .......... 91% 4.24M 0s
  1200K .......... .......... .......... .......... .......... 95% 4.32M 0s
  1250K .......... .......... .......... .......... .......... 98% 4.29M 0s
  1300K .......... ....                                       100% 4.72M=3D=
0.7s

2021-06-17 16:00:34 (1.79 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/bash_5.0-4_arm64.deb=E2=80=99 saved [1345776/1345776]

--2021-06-17 16:00:34--  http://deb.debian.org/debian/pool/main/b/bzip2/lib=
bz2-1.0_1.0.6-9.2~deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 45520 (44K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libbz2-1.0_1.0.6-9.2=
~deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ....      100%  376K=3D=
0.1s

2021-06-17 16:00:34 (376 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libbz2-1.0_1.0.6-9.2~deb10u1_arm64.deb=E2=80=99 saved [45520/45520]

--2021-06-17 16:00:34--  http://deb.debian.org/debian/pool/main/c/cdebconf/=
libdebconfclient0_0.249_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 49176 (48K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libdebconfclient0_0.=
249_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ........  100%  344K=3D=
0.1s

2021-06-17 16:00:35 (344 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libdebconfclient0_0.249_arm64.deb=E2=80=99 saved [49176/49176]

--2021-06-17 16:00:35--  http://deb.debian.org/debian/pool/main/c/coreutils=
/coreutils_8.30-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 2646736 (2.5M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/coreutils_8.30-3_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  1%  465K 5s
    50K .......... .......... .......... .......... ..........  3%  551K 5s
   100K .......... .......... .......... .......... ..........  5% 1.93M 4s
   150K .......... .......... .......... .......... ..........  7% 2.34M 3s
   200K .......... .......... .......... .......... ..........  9%  899K 3s
   250K .......... .......... .......... .......... .......... 11% 3.00M 2s
   300K .......... .......... .......... .......... .......... 13% 3.67M 2s
   350K .......... .......... .......... .......... .......... 15% 4.09M 2s
   400K .......... .......... .......... .......... .......... 17% 3.41M 2s
   450K .......... .......... .......... .......... .......... 19% 1.15M 2s
   500K .......... .......... .......... .......... .......... 21% 2.74M 2s
   550K .......... .......... .......... .......... .......... 23% 2.82M 1s
   600K .......... .......... .......... .......... .......... 25% 2.85M 1s
   650K .......... .......... .......... .......... .......... 27% 2.99M 1s
   700K .......... .......... .......... .......... .......... 29% 2.87M 1s
   750K .......... .......... .......... .......... .......... 30% 1.83M 1s
   800K .......... .......... .......... .......... .......... 32% 2.89M 1s
   850K .......... .......... .......... .......... .......... 34% 3.11M 1s
   900K .......... .......... .......... .......... .......... 36% 2.98M 1s
   950K .......... .......... .......... .......... .......... 38% 3.00M 1s
  1000K .......... .......... .......... .......... .......... 40% 1.94M 1s
  1050K .......... .......... .......... .......... .......... 42% 2.99M 1s
  1100K .......... .......... .......... .......... .......... 44% 3.23M 1s
  1150K .......... .......... .......... .......... .......... 46% 3.18M 1s
  1200K .......... .......... .......... .......... .......... 48% 3.00M 1s
  1250K .......... .......... .......... .......... .......... 50% 3.19M 1s
  1300K .......... .......... .......... .......... .......... 52% 2.03M 1s
  1350K .......... .......... .......... .......... .......... 54% 3.19M 1s
  1400K .......... .......... .......... .......... .......... 56% 3.39M 1s
  1450K .......... .......... .......... .......... .......... 58% 3.30M 1s
  1500K .......... .......... .......... .......... .......... 59% 3.30M 1s
  1550K .......... .......... .......... .......... .......... 61% 3.34M 0s
  1600K .......... .......... .......... .......... .......... 63% 2.05M 0s
  1650K .......... .......... .......... .......... .......... 65% 3.31M 0s
  1700K .......... .......... .......... .......... .......... 67% 3.49M 0s
  1750K .......... .......... .......... .......... .......... 69% 3.36M 0s
  1800K .......... .......... .......... .......... .......... 71% 3.65M 0s
  1850K .......... .......... .......... .......... .......... 73% 3.49M 0s
  1900K .......... .......... .......... .......... .......... 75% 2.12M 0s
  1950K .......... .......... .......... .......... .......... 77% 3.50M 0s
  2000K .......... .......... .......... .......... .......... 79% 3.53M 0s
  2050K .......... .......... .......... .......... .......... 81% 3.60M 0s
  2100K .......... .......... .......... .......... .......... 83% 3.68M 0s
  2150K .......... .......... .......... .......... .......... 85% 3.63M 0s
  2200K .......... .......... .......... .......... .......... 87% 3.42M 0s
  2250K .......... .......... .......... .......... .......... 88% 2.34M 0s
  2300K .......... .......... .......... .......... .......... 90% 3.82M 0s
  2350K .......... .......... .......... .......... .......... 92% 3.60M 0s
  2400K .......... .......... .......... .......... .......... 94% 3.61M 0s
  2450K .......... .......... .......... .......... .......... 96% 3.96M 0s
  2500K .......... .......... .......... .......... .......... 98% 3.45M 0s
  2550K .......... .......... .......... ....                 100% 4.11M=3D=
1.1s

2021-06-17 16:00:36 (2.35 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/coreutils_8.30-3_arm64.deb=E2=80=99 saved [2646736/2646736]

--2021-06-17 16:00:36--  http://deb.debian.org/debian/pool/main/c/cyrus-sas=
l2/libsasl2-2_2.1.27+dfsg-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 105336 (103K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsasl2-2_2.1.27+df=
sg-1+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 48%  478K 0s
    50K .......... .......... .......... .......... .......... 97%  568K 0s
   100K ..                                                    100% 23.7M=3D=
0.2s

2021-06-17 16:00:37 (534 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsasl2-2_2.1.27+dfsg-1+deb10u1_arm64.deb=E2=80=99 saved [105336/105336]

--2021-06-17 16:00:37--  http://deb.debian.org/debian/pool/main/c/cyrus-sas=
l2/libsasl2-modules-db_2.1.27+dfsg-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 69332 (68K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsasl2-modules-db_=
2.1.27+dfsg-1+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 73%  352K 0s
    50K .......... .......                                    100% 1.00M=3D=
0.2s

2021-06-17 16:00:37 (425 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsasl2-modules-db_2.1.27+dfsg-1+deb10u1_arm64.deb=E2=80=99 saved [69332=
/69332]

--2021-06-17 16:00:37--  http://deb.debian.org/debian/pool/main/d/dash/dash=
_0.5.10.2-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 110360 (108K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/dash_0.5.10.2-5_arm6=
4.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 46%  350K 0s
    50K .......... .......... .......... .......... .......... 92%  413K 0s
   100K .......                                               100% 2.12M=3D=
0.3s

2021-06-17 16:00:38 (403 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/dash_0.5.10.2-5_arm64.deb=E2=80=99 saved [110360/110360]

--2021-06-17 16:00:38--  http://deb.debian.org/debian/pool/main/d/db5.3/lib=
db5.3_5.3.28+dfsg1-0.5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 621736 (607K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libdb5.3_5.3.28+dfsg=
1-0.5_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8%  447K 1s
    50K .......... .......... .......... .......... .......... 16%  530K 1s
   100K .......... .......... .......... .......... .......... 24% 1.86M 1s
   150K .......... .......... .......... .......... .......... 32% 2.25M 1s
   200K .......... .......... .......... .......... .......... 41%  865K 0s
   250K .......... .......... .......... .......... .......... 49% 2.88M 0s
   300K .......... .......... .......... .......... .......... 57% 3.54M 0s
   350K .......... .......... .......... .......... .......... 65% 4.09M 0s
   400K .......... .......... .......... .......... .......... 74% 3.49M 0s
   450K .......... .......... .......... .......... .......... 82% 1.10M 0s
   500K .......... .......... .......... .......... .......... 90% 2.53M 0s
   550K .......... .......... .......... .......... .......... 98% 2.87M 0s
   600K .......                                               100% 2.48M=3D=
0.5s

2021-06-17 16:00:38 (1.31 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libdb5.3_5.3.28+dfsg1-0.5_arm64.deb=E2=80=99 saved [621736/621736]

--2021-06-17 16:00:38--  http://deb.debian.org/debian/pool/main/d/debconf/d=
ebconf_1.5.71_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 145012 (142K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/debconf_1.5.71_all.d=
eb=E2=80=99

     0K .......... .......... .......... .......... .......... 35%  369K 0s
    50K .......... .......... .......... .......... .......... 70%  434K 0s
   100K .......... .......... .......... .......... .         100% 1.40M=3D=
0.3s

2021-06-17 16:00:39 (506 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/debconf_1.5.71_all.deb=E2=80=99 saved [145012/145012]

--2021-06-17 16:00:39--  http://deb.debian.org/debian/pool/main/d/debian-ar=
chive-keyring/debian-archive-keyring_2019.1+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 93548 (91K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/debian-archive-keyri=
ng_2019.1+deb10u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 54%  372K 0s
    50K .......... .......... .......... .......... .         100% 1.06M=3D=
0.2s

2021-06-17 16:00:39 (529 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/debian-archive-keyring_2019.1+deb10u1_all.deb=E2=80=99 saved [93548/93548=
]

--2021-06-17 16:00:40--  http://deb.debian.org/debian/pool/main/d/debianuti=
ls/debianutils_4.8.6.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 100364 (98K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/debianutils_4.8.6.1_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 51%  433K 0s
    50K .......... .......... .......... .......... ........  100%  583K=3D=
0.2s

2021-06-17 16:00:40 (495 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/debianutils_4.8.6.1_arm64.deb=E2=80=99 saved [100364/100364]

--2021-06-17 16:00:40--  http://deb.debian.org/debian/pool/main/d/diffutils=
/diffutils_3.7-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 362676 (354K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/diffutils_1%3a3.7-3_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 14%  454K 1s
    50K .......... .......... .......... .......... .......... 28%  539K 1s
   100K .......... .......... .......... .......... .......... 42% 1.88M 0s
   150K .......... .......... .......... .......... .......... 56% 2.28M 0s
   200K .......... .......... .......... .......... .......... 70%  878K 0s
   250K .......... .......... .......... .......... .......... 84% 2.92M 0s
   300K .......... .......... .......... .......... .......... 98% 3.61M 0s
   350K ....                                                  100% 1.33M=3D=
0.3s

2021-06-17 16:00:41 (1.02 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/diffutils_1%3a3.7-3_arm64.deb=E2=80=99 saved [362676/362676]

--2021-06-17 16:00:41--  http://deb.debian.org/debian/pool/main/d/dpkg/dpkg=
_1.19.7_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 2193544 (2.1M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/dpkg_1.19.7_arm64.de=
b=E2=80=99

     0K .......... .......... .......... .......... ..........  2%  426K 5s
    50K .......... .......... .......... .......... ..........  4%  581K 4s
   100K .......... .......... .......... .......... ..........  7% 1.69M 3s
   150K .......... .......... .......... .......... ..........  9% 2.25M 2s
   200K .......... .......... .......... .......... .......... 11%  921K 2s
   250K .......... .......... .......... .......... .......... 14% 3.06M 2s
   300K .......... .......... .......... .......... .......... 16% 3.59M 2s
   350K .......... .......... .......... .......... .......... 18% 4.04M 2s
   400K .......... .......... .......... .......... .......... 21% 3.24M 1s
   450K .......... .......... .......... .......... .......... 23%  997K 1s
   500K .......... .......... .......... .......... .......... 25% 2.02M 1s
   550K .......... .......... .......... .......... .......... 28% 4.14M 1s
   600K .......... .......... .......... .......... .......... 30% 2.91M 1s
   650K .......... .......... .......... .......... .......... 32% 2.89M 1s
   700K .......... .......... .......... .......... .......... 35% 1.53M 1s
   750K .......... .......... .......... .......... .......... 37% 2.86M 1s
   800K .......... .......... .......... .......... .......... 39% 2.85M 1s
   850K .......... .......... .......... .......... .......... 42% 3.00M 1s
   900K .......... .......... .......... .......... .......... 44% 2.97M 1s
   950K .......... .......... .......... .......... .......... 46% 1.55M 1s
  1000K .......... .......... .......... .......... .......... 49% 3.01M 1s
  1050K .......... .......... .......... .......... .......... 51% 2.99M 1s
  1100K .......... .......... .......... .......... .......... 53% 3.11M 1s
  1150K .......... .......... .......... .......... .......... 56% 3.14M 1s
  1200K .......... .......... .......... .......... .......... 58% 1.61M 1s
  1250K .......... .......... .......... .......... .......... 60% 2.97M 0s
  1300K .......... .......... .......... .......... .......... 63% 3.29M 0s
  1350K .......... .......... .......... .......... .......... 65% 3.21M 0s
  1400K .......... .......... .......... .......... .......... 67% 3.18M 0s
  1450K .......... .......... .......... .......... .......... 70% 3.36M 0s
  1500K .......... .......... .......... .......... .......... 72% 1.66M 0s
  1550K .......... .......... .......... .......... .......... 74% 3.28M 0s
  1600K .......... .......... .......... .......... .......... 77% 3.34M 0s
  1650K .......... .......... .......... .......... .......... 79% 3.33M 0s
  1700K .......... .......... .......... .......... .......... 81% 3.35M 0s
  1750K .......... .......... .......... .......... .......... 84% 3.35M 0s
  1800K .......... .......... .......... .......... .......... 86% 1.77M 0s
  1850K .......... .......... .......... .......... .......... 88% 3.43M 0s
  1900K .......... .......... .......... .......... .......... 91% 3.28M 0s
  1950K .......... .......... .......... .......... .......... 93% 3.54M 0s
  2000K .......... .......... .......... .......... .......... 95% 3.56M 0s
  2050K .......... .......... .......... .......... .......... 98% 3.64M 0s
  2100K .......... .......... .......... .......... ..        100% 1.64M=3D=
1.0s

2021-06-17 16:00:42 (2.07 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/dpkg_1.19.7_arm64.deb=E2=80=99 saved [2193544/2193544]

--2021-06-17 16:00:42--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/e2fsprogs_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 552276 (539K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/e2fsprogs_1.44.5-1+d=
eb10u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  9%  456K 1s
    50K .......... .......... .......... .......... .......... 18%  541K 1s
   100K .......... .......... .......... .......... .......... 27% 1.89M 1s
   150K .......... .......... .......... .......... .......... 37% 2.29M 0s
   200K .......... .......... .......... .......... .......... 46%  884K 0s
   250K .......... .......... .......... .......... .......... 55% 2.94M 0s
   300K .......... .......... .......... .......... .......... 64% 3.60M 0s
   350K .......... .......... .......... .......... .......... 74% 4.17M 0s
   400K .......... .......... .......... .......... .......... 83% 3.76M 0s
   450K .......... .......... .......... .......... .......... 92% 1.10M 0s
   500K .......... .......... .......... .........            100% 2.76M=3D=
0.4s

2021-06-17 16:00:43 (1.26 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/e2fsprogs_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [552276/552276]

--2021-06-17 16:00:43--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/libcom-err2_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 68248 (67K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libcom-err2_1.44.5-1=
+deb10u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 75%  465K 0s
    50K .......... ......                                     100% 1.23M=3D=
0.1s

2021-06-17 16:00:43 (552 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libcom-err2_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [68248/68248]

--2021-06-17 16:00:43--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/libext2fs2_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 213204 (208K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libext2fs2_1.44.5-1+=
deb10u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 24%  406K 0s
    50K .......... .......... .......... .......... .......... 48%  478K 0s
   100K .......... .......... .......... .......... .......... 72% 1.58M 0s
   150K .......... .......... .......... .......... .......... 96% 2.02M 0s
   200K ........                                              100% 2.24M=3D=
0.3s

2021-06-17 16:00:43 (727 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libext2fs2_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [213204/213204]

--2021-06-17 16:00:43--  http://deb.debian.org/debian/pool/main/e/e2fsprogs=
/libss2_1.44.5-1+deb10u3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 72380 (71K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libss2_1.44.5-1+deb1=
0u3_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 70%  394K 0s
    50K .......... ..........                                 100% 1.12M=3D=
0.1s

2021-06-17 16:00:44 (488 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libss2_1.44.5-1+deb10u3_arm64.deb=E2=80=99 saved [72380/72380]

--2021-06-17 16:00:44--  http://deb.debian.org/debian/pool/main/f/findutils=
/findutils_4.6.0+git+20190209-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 675808 (660K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/findutils_4.6.0+git+=
20190209-2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7%  329K 2s
    50K .......... .......... .......... .......... .......... 15%  449K 1s
   100K .......... .......... .......... .......... .......... 22% 1.30M 1s
   150K .......... .......... .......... .......... .......... 30% 1.74M 1s
   200K .......... .......... .......... .......... .......... 37%  712K 1s
   250K .......... .......... .......... .......... .......... 45% 2.35M 1s
   300K .......... .......... .......... .......... .......... 53% 2.79M 0s
   350K .......... .......... .......... .......... .......... 60% 3.06M 0s
   400K .......... .......... .......... .......... .......... 68% 3.67M 0s
   450K .......... .......... .......... .......... .......... 75%  927K 0s
   500K .......... .......... .......... .......... .......... 83% 4.19M 0s
   550K .......... .......... .......... .......... .......... 90% 4.54M 0s
   600K .......... .......... .......... .......... .......... 98% 4.97M 0s
   650K .........                                             100% 5.79M=3D=
0.6s

2021-06-17 16:00:45 (1.16 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/findutils_4.6.0+git+20190209-2_arm64.deb=E2=80=99 saved [675808/675808]

--2021-06-17 16:00:45--  http://deb.debian.org/debian/pool/main/g/gcc-8/gcc=
-8-base_8.3.0-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 190532 (186K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gcc-8-base_8.3.0-6_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 26%  449K 0s
    50K .......... .......... .......... .......... .......... 53%  638K 0s
   100K .......... .......... .......... .......... .......... 80% 1.78M 0s
   150K .......... .......... .......... ......               100% 2.30M=3D=
0.2s

2021-06-17 16:00:45 (800 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/gcc-8-base_8.3.0-6_arm64.deb=E2=80=99 saved [190532/190532]

--2021-06-17 16:00:45--  http://deb.debian.org/debian/pool/main/g/gcc-8/lib=
gcc1_8.3.0-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 34400 (34K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgcc1_1%3a8.3.0-6_=
arm64.deb=E2=80=99

     0K .......... .......... .......... ...                  100%  264K=3D=
0.1s

2021-06-17 16:00:46 (264 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libgcc1_1%3a8.3.0-6_arm64.deb=E2=80=99 saved [34400/34400]

--2021-06-17 16:00:46--  http://deb.debian.org/debian/pool/main/g/gcc-8/lib=
stdc++6_8.3.0-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 362944 (354K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libstdc++6_8.3.0-6_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 14%  458K 1s
    50K .......... .......... .......... .......... .......... 28%  542K 1s
   100K .......... .......... .......... .......... .......... 42% 1.90M 0s
   150K .......... .......... .......... .......... .......... 56% 2.31M 0s
   200K .......... .......... .......... .......... .......... 70%  886K 0s
   250K .......... .......... .......... .......... .......... 84% 3.06M 0s
   300K .......... .......... .......... .......... .......... 98% 3.41M 0s
   350K ....                                                  100% 3.37M=3D=
0.3s

2021-06-17 16:00:46 (1.03 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libstdc++6_8.3.0-6_arm64.deb=E2=80=99 saved [362944/362944]

--2021-06-17 16:00:46--  http://deb.debian.org/debian/pool/main/g/glibc/lib=
c-bin_2.28-10_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 694496 (678K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libc-bin_2.28-10_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7%  463K 1s
    50K .......... .......... .......... .......... .......... 14%  546K 1s
   100K .......... .......... .......... .......... .......... 22% 2.01M 1s
   150K .......... .......... .......... .......... .......... 29% 2.21M 1s
   200K .......... .......... .......... .......... .......... 36%  921K 1s
   250K .......... .......... .......... .......... .......... 44% 2.92M 0s
   300K .......... .......... .......... .......... .......... 51% 3.47M 0s
   350K .......... .......... .......... .......... .......... 58% 4.19M 0s
   400K .......... .......... .......... .......... .......... 66% 4.08M 0s
   450K .......... .......... .......... .......... .......... 73% 2.77M 0s
   500K .......... .......... .......... .......... .......... 81% 1.12M 0s
   550K .......... .......... .......... .......... .......... 88% 2.82M 0s
   600K .......... .......... .......... .......... .......... 95% 3.02M 0s
   650K .......... .......... ........                        100% 2.93M=3D=
0.5s

2021-06-17 16:00:47 (1.44 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libc-bin_2.28-10_arm64.deb=E2=80=99 saved [694496/694496]

--2021-06-17 16:00:47--  http://deb.debian.org/debian/pool/main/g/glibc/lib=
c-l10n_2.28-10_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 846588 (827K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libc-l10n_2.28-10_al=
l.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6%  427K 2s
    50K .......... .......... .......... .......... .......... 12%  510K 2s
   100K .......... .......... .......... .......... .......... 18% 1.76M 1s
   150K .......... .......... .......... .......... .......... 24% 2.16M 1s
   200K .......... .......... .......... .......... .......... 30%  834K 1s
   250K .......... .......... .......... .......... .......... 36% 2.87M 1s
   300K .......... .......... .......... .......... .......... 42% 3.20M 0s
   350K .......... .......... .......... .......... .......... 48% 3.77M 0s
   400K .......... .......... .......... .......... .......... 54% 3.33M 0s
   450K .......... .......... .......... .......... .......... 60% 1.05M 0s
   500K .......... .......... .......... .......... .......... 66% 2.44M 0s
   550K .......... .......... .......... .......... .......... 72% 2.70M 0s
   600K .......... .......... .......... .......... .......... 78% 2.65M 0s
   650K .......... .......... .......... .......... .......... 84% 2.76M 0s
   700K .......... .......... .......... .......... .......... 90% 2.67M 0s
   750K .......... .......... .......... .......... .......... 96% 1.71M 0s
   800K .......... .......... ......                          100% 2.73M=3D=
0.6s

2021-06-17 16:00:48 (1.43 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libc-l10n_2.28-10_all.deb=E2=80=99 saved [846588/846588]

--2021-06-17 16:00:48--  http://deb.debian.org/debian/pool/main/g/glibc/lib=
c6_2.28-10_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 2520620 (2.4M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libc6_2.28-10_arm64.=
deb=E2=80=99

     0K .......... .......... .......... .......... ..........  2%  453K 5s
    50K .......... .......... .......... .......... ..........  4%  536K 5s
   100K .......... .......... .......... .......... ..........  6% 1.88M 4s
   150K .......... .......... .......... .......... ..........  8% 2.28M 3s
   200K .......... .......... .......... .......... .......... 10%  876K 3s
   250K .......... .......... .......... .......... .......... 12% 2.92M 2s
   300K .......... .......... .......... .......... .......... 14% 3.58M 2s
   350K .......... .......... .......... .......... .......... 16% 4.05M 2s
   400K .......... .......... .......... .......... .......... 18% 3.68M 2s
   450K .......... .......... .......... .......... .......... 20% 1.10M 2s
   500K .......... .......... .......... .......... .......... 22% 2.72M 1s
   550K .......... .......... .......... .......... .......... 24% 2.75M 1s
   600K .......... .......... .......... .......... .......... 26% 2.80M 1s
   650K .......... .......... .......... .......... .......... 28% 2.94M 1s
   700K .......... .......... .......... .......... .......... 30% 2.84M 1s
   750K .......... .......... .......... .......... .......... 32% 1.82M 1s
   800K .......... .......... .......... .......... .......... 34% 2.85M 1s
   850K .......... .......... .......... .......... .......... 36% 3.03M 1s
   900K .......... .......... .......... .......... .......... 38% 2.93M 1s
   950K .......... .......... .......... .......... .......... 40% 2.95M 1s
  1000K .......... .......... .......... .......... .......... 42% 1.92M 1s
  1050K .......... .......... .......... .......... .......... 44% 2.95M 1s
  1100K .......... .......... .......... .......... .......... 46% 3.01M 1s
  1150K .......... .......... .......... .......... .......... 48% 3.27M 1s
  1200K .......... .......... .......... .......... .......... 50% 2.97M 1s
  1250K .......... .......... .......... .......... .......... 52% 3.12M 1s
  1300K .......... .......... .......... .......... .......... 54% 2.03M 1s
  1350K .......... .......... .......... .......... .......... 56% 3.06M 1s
  1400K .......... .......... .......... .......... .......... 58% 3.31M 1s
  1450K .......... .......... .......... .......... .......... 60% 3.20M 0s
  1500K .......... .......... .......... .......... .......... 62% 3.29M 0s
  1550K .......... .......... .......... .......... .......... 64% 3.21M 0s
  1600K .......... .......... .......... .......... .......... 67% 2.15M 0s
  1650K .......... .......... .......... .......... .......... 69% 2.99M 0s
  1700K .......... .......... .......... .......... .......... 71% 3.55M 0s
  1750K .......... .......... .......... .......... .......... 73% 3.23M 0s
  1800K .......... .......... .......... .......... .......... 75% 3.55M 0s
  1850K .......... .......... .......... .......... .......... 77% 3.47M 0s
  1900K .......... .......... .......... .......... .......... 79% 3.46M 0s
  1950K .......... .......... .......... .......... .......... 81% 2.12M 0s
  2000K .......... .......... .......... .......... .......... 83% 3.37M 0s
  2050K .......... .......... .......... .......... .......... 85% 3.52M 0s
  2100K .......... .......... .......... .......... .......... 87% 3.57M 0s
  2150K .......... .......... .......... .......... .......... 89% 3.61M 0s
  2200K .......... .......... .......... .......... .......... 91% 3.53M 0s
  2250K .......... .......... .......... .......... .......... 93% 3.72M 0s
  2300K .......... .......... .......... .......... .......... 95% 2.21M 0s
  2350K .......... .......... .......... .......... .......... 97% 3.45M 0s
  2400K .......... .......... .......... .......... .......... 99% 3.38M 0s
  2450K .......... .                                          100% 13.1M=3D=
1.1s

2021-06-17 16:00:49 (2.27 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libc6_2.28-10_arm64.deb=E2=80=99 saved [2520620/2520620]

--2021-06-17 16:00:49--  http://deb.debian.org/debian/pool/main/g/glibc/loc=
ales_2.28-10_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:36:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 4060400 (3.9M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/locales_2.28-10_all.=
deb=E2=80=99

     0K .......... .......... .......... .......... ..........  1%  352K 11=
s
    50K .......... .......... .......... .......... ..........  2%  430K 10=
s
   100K .......... .......... .......... .......... ..........  3% 1.45M 7s
   150K .......... .......... .......... .......... ..........  5% 1.79M 6s
   200K .......... .......... .......... .......... ..........  6%  712K 6s
   250K .......... .......... .......... .......... ..........  7% 2.26M 5s
   300K .......... .......... .......... .......... ..........  8% 2.64M 4s
   350K .......... .......... .......... .......... .......... 10% 3.11M 4s
   400K .......... .......... .......... .......... .......... 11% 3.51M 4s
   450K .......... .......... .......... .......... .......... 12% 4.04M 3s
   500K .......... .......... .......... .......... .......... 13%  980K 3s
   550K .......... .......... .......... .......... .......... 15% 4.43M 3s
   600K .......... .......... .......... .......... .......... 16% 4.82M 3s
   650K .......... .......... .......... .......... .......... 17% 5.07M 3s
   700K .......... .......... .......... .......... .......... 18% 5.55M 2s
   750K .......... .......... .......... .......... .......... 20% 5.62M 2s
   800K .......... .......... .......... .......... .......... 21% 6.46M 2s
   850K .......... .......... .......... .......... .......... 22% 5.15M 2s
   900K .......... .......... .......... .......... .......... 23% 3.98M 2s
   950K .......... .......... .......... .......... .......... 25% 1.02M 2s
  1000K .......... .......... .......... .......... .......... 26% 4.32M 2s
  1050K .......... .......... .......... .......... .......... 27% 4.05M 2s
  1100K .......... .......... .......... .......... .......... 29% 4.05M 2s
  1150K .......... .......... .......... .......... .......... 30% 4.11M 2s
  1200K .......... .......... .......... .......... .......... 31% 4.09M 2s
  1250K .......... .......... .......... .......... .......... 32% 4.13M 1s
  1300K .......... .......... .......... .......... .......... 34% 4.43M 1s
  1350K .......... .......... .......... .......... .......... 35% 4.15M 1s
  1400K .......... .......... .......... .......... .......... 36% 4.20M 1s
  1450K .......... .......... .......... .......... .......... 37% 1.96M 1s
  1500K .......... .......... .......... .......... .......... 39% 4.05M 1s
  1550K .......... .......... .......... .......... .......... 40% 4.48M 1s
  1600K .......... .......... .......... .......... .......... 41% 4.17M 1s
  1650K .......... .......... .......... .......... .......... 42% 4.07M 1s
  1700K .......... .......... .......... .......... .......... 44% 4.38M 1s
  1750K .......... .......... .......... .......... .......... 45% 4.31M 1s
  1800K .......... .......... .......... .......... .......... 46% 4.30M 1s
  1850K .......... .......... .......... .......... .......... 47% 4.55M 1s
  1900K .......... .......... .......... .......... .......... 49% 4.14M 1s
  1950K .......... .......... .......... .......... .......... 50% 2.07M 1s
  2000K .......... .......... .......... .......... .......... 51% 4.77M 1s
  2050K .......... .......... .......... .......... .......... 52% 4.26M 1s
  2100K .......... .......... .......... .......... .......... 54% 4.45M 1s
  2150K .......... .......... .......... .......... .......... 55% 4.70M 1s
  2200K .......... .......... .......... .......... .......... 56% 4.61M 1s
  2250K .......... .......... .......... .......... .......... 58% 4.03M 1s
  2300K .......... .......... .......... .......... .......... 59% 4.71M 1s
  2350K .......... .......... .......... .......... .......... 60% 4.65M 1s
  2400K .......... .......... .......... .......... .......... 61% 4.59M 1s
  2450K .......... .......... .......... .......... .......... 63% 4.64M 1s
  2500K .......... .......... .......... .......... .......... 64% 2.14M 1s
  2550K .......... .......... .......... .......... .......... 65% 4.61M 1s
  2600K .......... .......... .......... .......... .......... 66% 4.87M 1s
  2650K .......... .......... .......... .......... .......... 68% 4.52M 0s
  2700K .......... .......... .......... .......... .......... 69% 4.63M 0s
  2750K .......... .......... .......... .......... .......... 70% 5.07M 0s
  2800K .......... .......... .......... .......... .......... 71% 4.37M 0s
  2850K .......... .......... .......... .......... .......... 73% 4.80M 0s
  2900K .......... .......... .......... .......... .......... 74% 4.79M 0s
  2950K .......... .......... .......... .......... .......... 75% 4.90M 0s
  3000K .......... .......... .......... .......... .......... 76% 5.05M 0s
  3050K .......... .......... .......... .......... .......... 78% 4.57M 0s
  3100K .......... .......... .......... .......... .......... 79% 2.27M 0s
  3150K .......... .......... .......... .......... .......... 80% 4.74M 0s
  3200K .......... .......... .......... .......... .......... 81% 4.93M 0s
  3250K .......... .......... .......... .......... .......... 83% 4.77M 0s
  3300K .......... .......... .......... .......... .......... 84% 4.93M 0s
  3350K .......... .......... .......... .......... .......... 85% 5.13M 0s
  3400K .......... .......... .......... .......... .......... 87% 4.77M 0s
  3450K .......... .......... .......... .......... .......... 88% 5.04M 0s
  3500K .......... .......... .......... .......... .......... 89% 5.11M 0s
  3550K .......... .......... .......... .......... .......... 90% 5.15M 0s
  3600K .......... .......... .......... .......... .......... 92% 4.92M 0s
  3650K .......... .......... .......... .......... .......... 93% 4.21M 0s
  3700K .......... .......... .......... .......... .......... 94% 2.50M 0s
  3750K .......... .......... .......... .......... .......... 95% 4.51M 0s
  3800K .......... .......... .......... .......... .......... 97% 5.24M 0s
  3850K .......... .......... .......... .......... .......... 98% 4.97M 0s
  3900K .......... .......... .......... .......... .......... 99% 5.52M 0s
  3950K .......... .....                                      100% 5.05M=3D=
1.3s

2021-06-17 16:00:51 (2.89 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/locales_2.28-10_all.deb=E2=80=99 saved [4060400/4060400]

--2021-06-17 16:00:51--  http://deb.debian.org/debian/pool/main/g/gmp/libgm=
p10_6.1.2+dfsg-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 225912 (221K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgmp10_2%3a6.1.2+d=
fsg-4_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 22%  363K 0s
    50K .......... .......... .......... .......... .......... 45%  428K 0s
   100K .......... .......... .......... .......... .......... 67% 1.50M 0s
   150K .......... .......... .......... .......... .......... 90% 1.79M 0s
   200K .......... ..........                                 100% 2.07M=3D=
0.3s

2021-06-17 16:00:55 (680 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libgmp10_2%3a6.1.2+dfsg-4_arm64.deb=E2=80=99 saved [225912/225912]

--2021-06-17 16:00:55--  http://deb.debian.org/debian/pool/main/g/gnupg2/di=
rmngr_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 694456 (678K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/dirmngr_2.2.12-1+deb=
10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7%  434K 1s
    50K .......... .......... .......... .......... .......... 14%  511K 1s
   100K .......... .......... .......... .......... .......... 22% 1.80M 1s
   150K .......... .......... .......... .......... .......... 29% 2.18M 1s
   200K .......... .......... .......... .......... .......... 36%  835K 1s
   250K .......... .......... .......... .......... .......... 44% 2.79M 0s
   300K .......... .......... .......... .......... .......... 51% 3.42M 0s
   350K .......... .......... .......... .......... .......... 58% 3.81M 0s
   400K .......... .......... .......... .......... .......... 66% 3.17M 0s
   450K .......... .......... .......... .......... .......... 73% 1.07M 0s
   500K .......... .......... .......... .......... .......... 81% 2.46M 0s
   550K .......... .......... .......... .......... .......... 88% 2.75M 0s
   600K .......... .......... .......... .......... .......... 95% 2.67M 0s
   650K .......... .......... ........                        100% 2.71M=3D=
0.5s

2021-06-17 16:01:00 (1.34 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/dirmngr_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [694456/694456]

--2021-06-17 16:01:00--  http://deb.debian.org/debian/pool/main/g/gnupg2/gn=
upg_2.2.12-1+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 715372 (699K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gnupg_2.2.12-1+deb10=
u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  7%  354K 2s
    50K .......... .......... .......... .......... .......... 14%  419K 2s
   100K .......... .......... .......... .......... .......... 21% 1.47M 1s
   150K .......... .......... .......... .......... .......... 28% 1.78M 1s
   200K .......... .......... .......... .......... .......... 35%  697K 1s
   250K .......... .......... .......... .......... .......... 42% 2.25M 1s
   300K .......... .......... .......... .......... .......... 50% 2.62M 0s
   350K .......... .......... .......... .......... .......... 57% 3.09M 0s
   400K .......... .......... .......... .......... .......... 64% 3.48M 0s
   450K .......... .......... .......... .......... .......... 71% 3.99M 0s
   500K .......... .......... .......... .......... .......... 78%  963K 0s
   550K .......... .......... .......... .......... .......... 85% 4.49M 0s
   600K .......... .......... .......... .......... .......... 93% 4.69M 0s
   650K .......... .......... .......... .......... ........  100% 4.99M=3D=
0.6s

2021-06-17 16:01:01 (1.22 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gnupg_2.2.12-1+deb10u1_all.deb=E2=80=99 saved [715372/715372]

--2021-06-17 16:01:01--  http://deb.debian.org/debian/pool/main/g/gnupg2/gn=
upg-l10n_2.2.12-1+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1009612 (986K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gnupg-l10n_2.2.12-1+=
deb10u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5%  443K 2s
    50K .......... .......... .......... .......... .......... 10%  529K 2s
   100K .......... .......... .......... .......... .......... 15% 1.84M 1s
   150K .......... .......... .......... .......... .......... 20% 2.22M 1s
   200K .......... .......... .......... .......... .......... 25%  863K 1s
   250K .......... .......... .......... .......... .......... 30% 2.87M 1s
   300K .......... .......... .......... .......... .......... 35% 3.52M 1s
   350K .......... .......... .......... .......... .......... 40% 3.91M 1s
   400K .......... .......... .......... .......... .......... 45% 3.24M 0s
   450K .......... .......... .......... .......... .......... 50% 1.10M 0s
   500K .......... .......... .......... .......... .......... 55% 2.62M 0s
   550K .......... .......... .......... .......... .......... 60% 2.68M 0s
   600K .......... .......... .......... .......... .......... 65% 2.73M 0s
   650K .......... .......... .......... .......... .......... 70% 2.84M 0s
   700K .......... .......... .......... .......... .......... 76% 2.73M 0s
   750K .......... .......... .......... .......... .......... 81% 1.79M 0s
   800K .......... .......... .......... .......... .......... 86% 2.53M 0s
   850K .......... .......... .......... .......... .......... 91% 3.27M 0s
   900K .......... .......... .......... .......... .......... 96% 2.87M 0s
   950K .......... .......... .......... .....                100% 2.89M=3D=
0.6s

2021-06-17 16:01:02 (1.61 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gnupg-l10n_2.2.12-1+deb10u1_all.deb=E2=80=99 saved [1009612/1009612]

--2021-06-17 16:01:02--  http://deb.debian.org/debian/pool/main/g/gnupg2/gn=
upg-utils_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 823732 (804K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gnupg-utils_2.2.12-1=
+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6%  475K 2s
    50K .......... .......... .......... .......... .......... 12%  563K 1s
   100K .......... .......... .......... .......... .......... 18% 1.96M 1s
   150K .......... .......... .......... .......... .......... 24% 2.40M 1s
   200K .......... .......... .......... .......... .......... 31%  922K 1s
   250K .......... .......... .......... .......... .......... 37% 3.18M 1s
   300K .......... .......... .......... .......... .......... 43% 3.53M 0s
   350K .......... .......... .......... .......... .......... 49% 3.50M 0s
   400K .......... .......... .......... .......... .......... 55% 5.31M 0s
   450K .......... .......... .......... .......... .......... 62% 1.14M 0s
   500K .......... .......... .......... .......... .......... 68% 2.71M 0s
   550K .......... .......... .......... .......... .......... 74% 3.05M 0s
   600K .......... .......... .......... .......... .......... 80% 2.93M 0s
   650K .......... .......... .......... .......... .......... 87% 3.10M 0s
   700K .......... .......... .......... .......... .......... 93% 2.95M 0s
   750K .......... .......... .......... .......... .......... 99% 1.93M 0s
   800K ....                                                  100% 3.99M=3D=
0.5s

2021-06-17 16:01:02 (1.58 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gnupg-utils_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [823732/823732]

--2021-06-17 16:01:03--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 826660 (807K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg_2.2.12-1+deb10u1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6%  358K 2s
    50K .......... .......... .......... .......... .......... 12%  424K 2s
   100K .......... .......... .......... .......... .......... 18% 1.49M 1s
   150K .......... .......... .......... .......... .......... 24% 1.79M 1s
   200K .......... .......... .......... .......... .......... 30%  705K 1s
   250K .......... .......... .......... .......... .......... 37% 2.28M 1s
   300K .......... .......... .......... .......... .......... 43% 2.67M 1s
   350K .......... .......... .......... .......... .......... 49% 3.13M 0s
   400K .......... .......... .......... .......... .......... 55% 3.53M 0s
   450K .......... .......... .......... .......... .......... 61% 4.02M 0s
   500K .......... .......... .......... .......... .......... 68%  979K 0s
   550K .......... .......... .......... .......... .......... 74% 4.51M 0s
   600K .......... .......... .......... .......... .......... 80% 4.64M 0s
   650K .......... .......... .......... .......... .......... 86% 5.26M 0s
   700K .......... .......... .......... .......... .......... 92% 5.63M 0s
   750K .......... .......... .......... .......... .......... 99% 5.67M 0s
   800K .......                                               100% 7.33M=3D=
0.6s

2021-06-17 16:01:03 (1.38 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [826660/826660]

--2021-06-17 16:01:03--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g-agent_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 601444 (587K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg-agent_2.2.12-1+d=
eb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8%  348K 2s
    50K .......... .......... .......... .......... .......... 17%  411K 1s
   100K .......... .......... .......... .......... .......... 25% 1.41M 1s
   150K .......... .......... .......... .......... .......... 34% 1.78M 1s
   200K .......... .......... .......... .......... .......... 42%  698K 1s
   250K .......... .......... .......... .......... .......... 51% 2.17M 0s
   300K .......... .......... .......... .......... .......... 59% 2.61M 0s
   350K .......... .......... .......... .......... .......... 68% 3.03M 0s
   400K .......... .......... .......... .......... .......... 76% 3.62M 0s
   450K .......... .......... .......... .......... .......... 85% 3.71M 0s
   500K .......... .......... .......... .......... .......... 93%  915K 0s
   550K .......... .......... .......... .......              100% 7.68M=3D=
0.5s

2021-06-17 16:01:04 (1.06 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg-agent_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [601444/601444]

--2021-06-17 16:01:04--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g-wks-client_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 478380 (467K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg-wks-client_2.2.1=
2-1+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10%  413K 1s
    50K .......... .......... .......... .......... .......... 21%  563K 1s
   100K .......... .......... .......... .......... .......... 32% 1.65M 1s
   150K .......... .......... .......... .......... .......... 42% 2.23M 0s
   200K .......... .......... .......... .......... .......... 53%  888K 0s
   250K .......... .......... .......... .......... .......... 64% 3.01M 0s
   300K .......... .......... .......... .......... .......... 74% 3.43M 0s
   350K .......... .......... .......... .......... .......... 85% 4.01M 0s
   400K .......... .......... .......... .......... .......... 96% 3.06M 0s
   450K .......... .......                                    100%  434K=3D=
0.4s

2021-06-17 16:01:05 (1.10 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg-wks-client_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [478380/478380]

--2021-06-17 16:01:05--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
g-wks-server_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 471652 (461K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpg-wks-server_2.2.1=
2-1+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10%  441K 1s
    50K .......... .......... .......... .......... .......... 21%  522K 1s
   100K .......... .......... .......... .......... .......... 32% 1.82M 0s
   150K .......... .......... .......... .......... .......... 43% 2.23M 0s
   200K .......... .......... .......... .......... .......... 54%  852K 0s
   250K .......... .......... .......... .......... .......... 65% 2.79M 0s
   300K .......... .......... .......... .......... .......... 75% 2.98M 0s
   350K .......... .......... .......... .......... .......... 86% 4.96M 0s
   400K .......... .......... .......... .......... .......... 97% 3.81M 0s
   450K ..........                                            100% 2.56M=3D=
0.4s

2021-06-17 16:01:06 (1.19 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpg-wks-server_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [471652/471652]

--2021-06-17 16:01:06--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
gconf_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 503196 (491K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpgconf_2.2.12-1+deb=
10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10%  440K 1s
    50K .......... .......... .......... .......... .......... 20%  522K 1s
   100K .......... .......... .......... .......... .......... 30% 1.82M 1s
   150K .......... .......... .......... .......... .......... 40% 1.84M 0s
   200K .......... .......... .......... .......... .......... 50%  925K 0s
   250K .......... .......... .......... .......... .......... 61% 2.87M 0s
   300K .......... .......... .......... .......... .......... 71% 3.38M 0s
   350K .......... .......... .......... .......... .......... 81% 3.91M 0s
   400K .......... .......... .......... .......... .......... 91% 3.61M 0s
   450K .......... .......... .......... .......... .         100% 2.60M=3D=
0.4s

2021-06-17 16:01:06 (1.23 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpgconf_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [503196/503196]

--2021-06-17 16:01:06--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
gsm_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 586612 (573K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpgsm_2.2.12-1+deb10=
u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8%  363K 1s
    50K .......... .......... .......... .......... .......... 17%  427K 1s
   100K .......... .......... .......... .......... .......... 26% 1.51M 1s
   150K .......... .......... .......... .......... .......... 34% 1.83M 1s
   200K .......... .......... .......... .......... .......... 43%  710K 0s
   250K .......... .......... .......... .......... .......... 52% 2.32M 0s
   300K .......... .......... .......... .......... .......... 61% 2.69M 0s
   350K .......... .......... .......... .......... .......... 69% 3.16M 0s
   400K .......... .......... .......... .......... .......... 78% 3.60M 0s
   450K .......... .......... .......... .......... .......... 87% 4.07M 0s
   500K .......... .......... .......... .......... .......... 96%  993K 0s
   550K .......... .......... ..                              100% 4.21M=3D=
0.5s

2021-06-17 16:01:07 (1.08 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpgsm_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [586612/586612]

--2021-06-17 16:01:07--  http://deb.debian.org/debian/pool/main/g/gnupg2/gp=
gv_2.2.12-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 569288 (556K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gpgv_2.2.12-1+deb10u=
1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8%  318K 2s
    50K .......... .......... .......... .......... .......... 17%  433K 1s
   100K .......... .......... .......... .......... .......... 26% 1.26M 1s
   150K .......... .......... .......... .......... .......... 35% 1.68M 1s
   200K .......... .......... .......... .......... .......... 44%  686K 1s
   250K .......... .......... .......... .......... .......... 53% 2.28M 0s
   300K .......... .......... .......... .......... .......... 62% 2.69M 0s
   350K .......... .......... .......... .......... .......... 71% 2.96M 0s
   400K .......... .......... .......... .......... .......... 80% 3.53M 0s
   450K .......... .......... .......... .......... .......... 89%  893K 0s
   500K .......... .......... .......... .......... .......... 98% 4.00M 0s
   550K .....                                                 100% 7.64M=3D=
0.6s

2021-06-17 16:01:08 (1006 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/gpgv_2.2.12-1+deb10u1_arm64.deb=E2=80=99 saved [569288/569288]

--2021-06-17 16:01:08--  http://deb.debian.org/debian/pool/main/g/gnutls28/=
libgnutls30_3.6.7-4+deb10u6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1061884 (1.0M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgnutls30_3.6.7-4+=
deb10u6_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  4%  361K 3s
    50K .......... .......... .......... .......... ..........  9%  426K 2s
   100K .......... .......... .......... .......... .......... 14% 1.50M 2s
   150K .......... .......... .......... .......... .......... 19% 1.79M 1s
   200K .......... .......... .......... .......... .......... 24%  711K 1s
   250K .......... .......... .......... .......... .......... 28% 2.30M 1s
   300K .......... .......... .......... .......... .......... 33% 2.69M 1s
   350K .......... .......... .......... .......... .......... 38% 3.14M 1s
   400K .......... .......... .......... .......... .......... 43% 3.56M 1s
   450K .......... .......... .......... .......... .......... 48% 4.14M 1s
   500K .......... .......... .......... .......... .......... 53%  979K 0s
   550K .......... .......... .......... .......... .......... 57% 4.45M 0s
   600K .......... .......... .......... .......... .......... 62% 4.83M 0s
   650K .......... .......... .......... .......... .......... 67% 5.15M 0s
   700K .......... .......... .......... .......... .......... 72% 5.84M 0s
   750K .......... .......... .......... .......... .......... 77% 5.64M 0s
   800K .......... .......... .......... .......... .......... 81% 6.54M 0s
   850K .......... .......... .......... .......... .......... 86% 5.39M 0s
   900K .......... .......... .......... .......... .......... 91% 4.08M 0s
   950K .......... .......... .......... .......... .......... 96% 1.04M 0s
  1000K .......... .......... .......... ......               100% 4.04M=3D=
0.6s

2021-06-17 16:01:09 (1.56 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libgnutls30_3.6.7-4+deb10u6_arm64.deb=E2=80=99 saved [1061884/1061884]

--2021-06-17 16:01:09--  http://deb.debian.org/debian/pool/main/g/grep/grep=
_3.3-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 365884 (357K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/grep_3.3-1_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 13%  361K 1s
    50K .......... .......... .......... .......... .......... 27%  425K 1s
   100K .......... .......... .......... .......... .......... 41% 1.49M 0s
   150K .......... .......... .......... .......... .......... 55% 1.82M 0s
   200K .......... .......... .......... .......... .......... 69%  709K 0s
   250K .......... .......... .......... .......... .......... 83% 2.40M 0s
   300K .......... .......... .......... .......... .......... 97% 2.65M 0s
   350K .......                                               100% 2.72M=3D=
0.4s

2021-06-17 16:01:10 (836 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/grep_3.3-1_arm64.deb=E2=80=99 saved [365884/365884]

--2021-06-17 16:01:10--  http://deb.debian.org/debian/pool/main/g/gzip/gzip=
_1.9-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 126128 (123K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/gzip_1.9-3_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 40%  342K 0s
    50K .......... .......... .......... .......... .......... 81%  403K 0s
   100K .......... .......... ...                             100% 1.52M=3D=
0.3s

2021-06-17 16:01:10 (432 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/gzip_1.9-3_arm64.deb=E2=80=99 saved [126128/126128]

--2021-06-17 16:01:10--  http://deb.debian.org/debian/pool/main/h/hostname/=
hostname_3.21_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 14460 (14K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/hostname_3.21_arm64.=
deb=E2=80=99

     0K .......... ....                                       100% 11.5M=3D=
0.001s

2021-06-17 16:01:11 (11.5 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/hostname_3.21_arm64.deb=E2=80=99 saved [14460/14460]

--2021-06-17 16:01:11--  http://deb.debian.org/debian/pool/main/i/init-syst=
em-helpers/init-system-helpers_1.56+nmu1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 46832 (46K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/init-system-helpers_=
1.56+nmu1_all.deb=E2=80=99

     0K .......... .......... .......... .......... .....     100%  348K=3D=
0.1s

2021-06-17 16:01:11 (348 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/init-system-helpers_1.56+nmu1_all.deb=E2=80=99 saved [46832/46832]

--2021-06-17 16:01:11--  http://deb.debian.org/debian/pool/main/liba/libass=
uan/libassuan0_2.5.2-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 47052 (46K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libassuan0_2.5.2-1_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .....     100%  429K=3D=
0.1s

2021-06-17 16:01:11 (429 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libassuan0_2.5.2-1_arm64.deb=E2=80=99 saved [47052/47052]

--2021-06-17 16:01:11--  http://deb.debian.org/debian/pool/main/libc/libcap=
-ng/libcap-ng0_0.7.9-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 13848 (14K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libcap-ng0_0.7.9-2_a=
rm64.deb=E2=80=99

     0K .......... ...                                        100% 12.8M=3D=
0.001s

2021-06-17 16:01:12 (12.8 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libcap-ng0_0.7.9-2_arm64.deb=E2=80=99 saved [13848/13848]

--2021-06-17 16:01:12--  http://deb.debian.org/debian/pool/main/libf/libffi=
/libffi6_3.2.1-9_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 19340 (19K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libffi6_3.2.1-9_arm6=
4.deb=E2=80=99

     0K .......... ........                                   100% 3.89M=3D=
0.005s

2021-06-17 16:01:12 (3.89 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libffi6_3.2.1-9_arm64.deb=E2=80=99 saved [19340/19340]

--2021-06-17 16:01:12--  http://deb.debian.org/debian/pool/main/libg/libgcr=
ypt20/libgcrypt20_1.8.4-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 487120 (476K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgcrypt20_1.8.4-5_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 10%  420K 1s
    50K .......... .......... .......... .......... .......... 21%  587K 1s
   100K .......... .......... .......... .......... .......... 31% 1.54M 1s
   150K .......... .......... .......... .......... .......... 42% 1.85M 0s
   200K .......... .......... .......... .......... .......... 52%  926K 0s
   250K .......... .......... .......... .......... .......... 63% 2.52M 0s
   300K .......... .......... .......... .......... .......... 73% 2.86M 0s
   350K .......... .......... .......... .......... .......... 84% 2.64M 0s
   400K .......... .......... .......... .......... .......... 94% 4.15M 0s
   450K .......... .......... .....                           100% 3.42M=3D=
0.4s

2021-06-17 16:01:13 (1.19 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libgcrypt20_1.8.4-5_arm64.deb=E2=80=99 saved [487120/487120]

--2021-06-17 16:01:13--  http://deb.debian.org/debian/pool/main/libg/libgpg=
-error/libgpg-error0_1.35-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 68396 (67K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libgpg-error0_1.35-1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 74%  349K 0s
    50K .......... ......                                     100% 1014K=3D=
0.2s

2021-06-17 16:01:13 (418 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libgpg-error0_1.35-1_arm64.deb=E2=80=99 saved [68396/68396]

--2021-06-17 16:01:13--  http://deb.debian.org/debian/pool/main/libi/libidn=
2/libidn2-0_2.0.5-1+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 75640 (74K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libidn2-0_2.0.5-1+de=
b10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 67%  330K 0s
    50K .......... .......... ...                             100%  970K=3D=
0.2s

2021-06-17 16:01:13 (420 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libidn2-0_2.0.5-1+deb10u1_arm64.deb=E2=80=99 saved [75640/75640]

--2021-06-17 16:01:14--  http://deb.debian.org/debian/pool/main/libk/libksb=
a/libksba8_1.3.5-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 84690 (83K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libksba8_1.3.5-2_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 60%  435K 0s
    50K .......... .......... .......... ..                   100% 1.18M=3D=
0.1s

2021-06-17 16:01:14 (583 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libksba8_1.3.5-2_arm64.deb=E2=80=99 saved [84690/84690]

--2021-06-17 16:01:14--  http://deb.debian.org/debian/pool/main/libs/libsec=
comp/libseccomp2_2.3.3-4_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 39468 (39K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libseccomp2_2.3.3-4_=
arm64.deb=E2=80=99

     0K .......... .......... .......... ........             100%  380K=3D=
0.1s

2021-06-17 16:01:14 (380 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libseccomp2_2.3.3-4_arm64.deb=E2=80=99 saved [39468/39468]

--2021-06-17 16:01:14--  http://deb.debian.org/debian/pool/main/libs/libsel=
inux/libselinux1_2.8-1+b1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 76084 (74K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libselinux1_2.8-1+b1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 67%  453K 0s
    50K .......... .......... ....                            100% 1.34M=3D=
0.1s

2021-06-17 16:01:15 (580 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libselinux1_2.8-1+b1_arm64.deb=E2=80=99 saved [76084/76084]

--2021-06-17 16:01:15--  http://deb.debian.org/debian/pool/main/libs/libsem=
anage/libsemanage-common_2.8-2_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 17664 (17K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsemanage-common_2=
.8-2_all.deb=E2=80=99

     0K .......... .......                                    100% 4.68M=3D=
0.004s

2021-06-17 16:01:15 (4.68 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsemanage-common_2.8-2_all.deb=E2=80=99 saved [17664/17664]

--2021-06-17 16:01:15--  http://deb.debian.org/debian/pool/main/libs/libsem=
anage/libsemanage1_2.8-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 90452 (88K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsemanage1_2.8-2_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 56%  482K 0s
    50K .......... .......... .......... ........             100% 1.38M=3D=
0.1s

2021-06-17 16:01:15 (676 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsemanage1_2.8-2_arm64.deb=E2=80=99 saved [90452/90452]

--2021-06-17 16:01:15--  http://deb.debian.org/debian/pool/main/libs/libsep=
ol/libsepol1_2.8-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 217368 (212K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsepol1_2.8-1_arm6=
4.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23%  430K 0s
    50K .......... .......... .......... .......... .......... 47%  582K 0s
   100K .......... .......... .......... .......... .......... 70% 1.75M 0s
   150K .......... .......... .......... .......... .......... 94% 2.26M 0s
   200K .......... ..                                         100% 2.86M=3D=
0.3s

2021-06-17 16:01:16 (829 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsepol1_2.8-1_arm64.deb=E2=80=99 saved [217368/217368]

--2021-06-17 16:01:16--  http://deb.debian.org/debian/pool/main/libt/libtas=
n1-6/libtasn1-6_4.13-3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 47820 (47K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libtasn1-6_4.13-3_ar=
m64.deb=E2=80=99

     0K .......... .......... .......... .......... ......    100%  416K=3D=
0.1s

2021-06-17 16:01:16 (416 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libtasn1-6_4.13-3_arm64.deb=E2=80=99 saved [47820/47820]

--2021-06-17 16:01:16--  http://deb.debian.org/debian/pool/main/libu/libuni=
string/libunistring2_0.9.10-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 363068 (355K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libunistring2_0.9.10=
-1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 14%  475K 1s
    50K .......... .......... .......... .......... .......... 28%  563K 0s
   100K .......... .......... .......... .......... .......... 42% 1.97M 0s
   150K .......... .......... .......... .......... .......... 56% 2.40M 0s
   200K .......... .......... .......... .......... .......... 70%  918K 0s
   250K .......... .......... .......... .......... .......... 84% 3.07M 0s
   300K .......... .......... .......... .......... .......... 98% 3.76M 0s
   350K ....                                                  100% 3.59M=3D=
0.3s

2021-06-17 16:01:17 (1.07 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libunistring2_0.9.10-1_arm64.deb=E2=80=99 saved [363068/363068]

--2021-06-17 16:01:17--  http://deb.debian.org/debian/pool/main/libz/libzst=
d/libzstd1_1.3.8+dfsg-3+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 215692 (211K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libzstd1_1.3.8+dfsg-=
3+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23%  441K 0s
    50K .......... .......... .......... .......... .......... 47%  522K 0s
   100K .......... .......... .......... .......... .......... 71% 1.83M 0s
   150K .......... .......... .......... .......... .......... 94% 2.23M 0s
   200K ..........                                            100% 2.36M=3D=
0.3s

2021-06-17 16:01:17 (803 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libzstd1_1.3.8+dfsg-3+deb10u2_arm64.deb=E2=80=99 saved [215692/215692]

--2021-06-17 16:01:17--  http://deb.debian.org/debian/pool/main/l/lsb/lsb-b=
ase_10.2019051400_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 28416 (28K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/lsb-base_10.20190514=
00_all.deb=E2=80=99

     0K .......... .......... .......                         100% 1.42M=3D=
0.02s

2021-06-17 16:01:18 (1.42 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/lsb-base_10.2019051400_all.deb=E2=80=99 saved [28416/28416]

--2021-06-17 16:01:18--  http://deb.debian.org/debian/pool/main/l/lz4/liblz=
4-1_1.8.3-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 50152 (49K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/liblz4-1_1.8.3-1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... ........  100%  424K=3D=
0.1s

2021-06-17 16:01:18 (424 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/liblz4-1_1.8.3-1_arm64.deb=E2=80=99 saved [50152/50152]

--2021-06-17 16:01:18--  http://deb.debian.org/debian/pool/main/m/mawk/mawk=
_1.3.3-17+b3_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 76916 (75K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/mawk_1.3.3-17+b3_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 66%  436K 0s
    50K .......... .......... .....                           100% 1.17M=3D=
0.1s

2021-06-17 16:01:18 (554 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/mawk_1.3.3-17+b3_arm64.deb=E2=80=99 saved [76916/76916]

--2021-06-17 16:01:18--  http://deb.debian.org/debian/pool/main/n/ncurses/l=
ibncursesw6_6.1+20181013-2+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 120160 (117K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libncursesw6_6.1+201=
81013-2+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 42%  453K 0s
    50K .......... .......... .......... .......... .......... 85% 1.23M 0s
   100K .......... .......                                    100%  284K=3D=
0.2s

2021-06-17 16:01:19 (556 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libncursesw6_6.1+20181013-2+deb10u2_arm64.deb=E2=80=99 saved [120160/1201=
60]

--2021-06-17 16:01:19--  http://deb.debian.org/debian/pool/main/n/ncurses/l=
ibtinfo6_6.1+20181013-2+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 320920 (313K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libtinfo6_6.1+201810=
13-2+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 15%  368K 1s
    50K .......... .......... .......... .......... .......... 31%  434K 1s
   100K .......... .......... .......... .......... .......... 47% 1.62M 0s
   150K .......... .......... .......... .......... .......... 63% 1.77M 0s
   200K .......... .......... .......... .......... .......... 79%  716K 0s
   250K .......... .......... .......... .......... .......... 95% 2.42M 0s
   300K .......... ...                                        100% 2.59M=3D=
0.4s

2021-06-17 16:01:20 (776 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libtinfo6_6.1+20181013-2+deb10u2_arm64.deb=E2=80=99 saved [320920/320920]

--2021-06-17 16:01:20--  http://deb.debian.org/debian/pool/main/n/ncurses/n=
curses-base_6.1+20181013-2+deb10u2_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 258480 (252K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/ncurses-base_6.1+201=
81013-2+deb10u2_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 19%  466K 0s
    50K .......... .......... .......... .......... .......... 39%  553K 0s
   100K .......... .......... .......... .......... .......... 59% 1.94M 0s
   150K .......... .......... .......... .......... .......... 79% 2.35M 0s
   200K .......... .......... .......... .......... .......... 99%  902K 0s
   250K ..                                                    100% 2.56M=3D=
0.3s

2021-06-17 16:01:20 (842 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/ncurses-base_6.1+20181013-2+deb10u2_all.deb=E2=80=99 saved [258480/258480=
]

--2021-06-17 16:01:20--  http://deb.debian.org/debian/pool/main/n/ncurses/n=
curses-bin_6.1+20181013-2+deb10u2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 402332 (393K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/ncurses-bin_6.1+2018=
1013-2+deb10u2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 12%  353K 1s
    50K .......... .......... .......... .......... .......... 25%  416K 1s
   100K .......... .......... .......... .......... .......... 38% 1.47M 0s
   150K .......... .......... .......... .......... .......... 50% 1.78M 0s
   200K .......... .......... .......... .......... .......... 63%  692K 0s
   250K .......... .......... .......... .......... .......... 76% 2.25M 0s
   300K .......... .......... .......... .......... .......... 89% 2.63M 0s
   350K .......... .......... .......... .......... ..        100% 3.15M=3D=
0.4s

2021-06-17 16:01:21 (877 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/ncurses-bin_6.1+20181013-2+deb10u2_arm64.deb=E2=80=99 saved [402332/40233=
2]

--2021-06-17 16:01:21--  http://deb.debian.org/debian/pool/main/n/nettle/li=
bhogweed4_3.4.1-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 137768 (135K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libhogweed4_3.4.1-1_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 37%  473K 0s
    50K .......... .......... .......... .......... .......... 74%  560K 0s
   100K .......... .......... .......... ....                 100% 2.02M=3D=
0.2s

2021-06-17 16:01:21 (635 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libhogweed4_3.4.1-1_arm64.deb=E2=80=99 saved [137768/137768]

--2021-06-17 16:01:21--  http://deb.debian.org/debian/pool/main/n/nettle/li=
bnettle6_3.4.1-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 225320 (220K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libnettle6_3.4.1-1_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 22%  472K 0s
    50K .......... .......... .......... .......... .......... 45%  559K 0s
   100K .......... .......... .......... .......... .......... 68% 1.94M 0s
   150K .......... .......... .......... .......... .......... 90% 2.40M 0s
   200K .......... ..........                                 100% 2.74M=3D=
0.2s

2021-06-17 16:01:22 (887 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libnettle6_3.4.1-1_arm64.deb=E2=80=99 saved [225320/225320]

--2021-06-17 16:01:22--  http://deb.debian.org/debian/pool/main/n/npth/libn=
pth0_1.6-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 17552 (17K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libnpth0_1.6-1_arm64=
.deb=E2=80=99

     0K .......... .......                                    100% 2.45M=3D=
0.007s

2021-06-17 16:01:22 (2.45 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libnpth0_1.6-1_arm64.deb=E2=80=99 saved [17552/17552]

--2021-06-17 16:01:22--  http://deb.debian.org/debian/pool/main/o/openldap/=
libldap-2.4-2_2.4.47+dfsg-3+deb10u6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 215896 (211K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libldap-2.4-2_2.4.47=
+dfsg-3+deb10u6_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23%  306K 1s
    50K .......... .......... .......... .......... .......... 47%  445K 0s
   100K .......... .......... .......... .......... .......... 71% 1.26M 0s
   150K .......... .......... .......... .......... .......... 94% 1.67M 0s
   200K ..........                                            100% 1.89M=3D=
0.3s

2021-06-17 16:01:23 (603 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libldap-2.4-2_2.4.47+dfsg-3+deb10u6_arm64.deb=E2=80=99 saved [215896/2158=
96]

--2021-06-17 16:01:23--  http://deb.debian.org/debian/pool/main/o/openldap/=
libldap-common_2.4.47+dfsg-3+deb10u6_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 90012 (88K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libldap-common_2.4.4=
7+dfsg-3+deb10u6_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 56%  326K 0s
    50K .......... .......... .......... .......              100%  994K=3D=
0.2s

2021-06-17 16:01:23 (460 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libldap-common_2.4.47+dfsg-3+deb10u6_all.deb=E2=80=99 saved [90012/90012]

--2021-06-17 16:01:24--  http://deb.debian.org/debian/pool/main/p/p11-kit/l=
ibp11-kit0_0.23.15-2+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 303144 (296K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libp11-kit0_0.23.15-=
2+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16%  329K 1s
    50K .......... .......... .......... .......... .......... 33%  449K 1s
   100K .......... .......... .......... .......... .......... 50% 1.30M 0s
   150K .......... .......... .......... .......... .......... 67% 1.73M 0s
   200K .......... .......... .......... .......... .......... 84%  712K 0s
   250K .......... .......... .......... .......... ......    100% 2.29M=3D=
0.4s

2021-06-17 16:01:24 (706 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libp11-kit0_0.23.15-2+deb10u1_arm64.deb=E2=80=99 saved [303144/303144]

--2021-06-17 16:01:24--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m-modules_1.3.1-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 302800 (296K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam-modules_1.3.1=
-5_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16%  482K 1s
    50K .......... .......... .......... .......... .......... 33%  569K 0s
   100K .......... .......... .......... .......... .......... 50% 2.01M 0s
   150K .......... .......... .......... .......... .......... 67% 2.43M 0s
   200K .......... .......... .......... .......... .......... 84%  929K 0s
   250K .......... .......... .......... .......... .....     100% 3.15M=3D=
0.3s

2021-06-17 16:01:25 (973 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libpam-modules_1.3.1-5_arm64.deb=E2=80=99 saved [302800/302800]

--2021-06-17 16:01:25--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m-modules-bin_1.3.1-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 105700 (103K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam-modules-bin_1=
.3.1-5_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 48%  479K 0s
    50K .......... .......... .......... .......... .......... 96%  563K 0s
   100K ...                                                   100% 20.8M=3D=
0.2s

2021-06-17 16:01:25 (534 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libpam-modules-bin_1.3.1-5_arm64.deb=E2=80=99 saved [105700/105700]

--2021-06-17 16:01:25--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m-runtime_1.3.1-5_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 211252 (206K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam-runtime_1.3.1=
-5_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 24%  485K 0s
    50K .......... .......... .......... .......... .......... 48%  572K 0s
   100K .......... .......... .......... .......... .......... 72% 2.01M 0s
   150K .......... .......... .......... .......... .......... 96% 2.36M 0s
   200K ......                                                100% 2.97M=3D=
0.2s

2021-06-17 16:01:26 (868 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libpam-runtime_1.3.1-5_all.deb=E2=80=99 saved [211252/211252]

--2021-06-17 16:01:26--  http://deb.debian.org/debian/pool/main/p/pam/libpa=
m0g_1.3.1-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 124932 (122K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpam0g_1.3.1-5_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 40%  355K 0s
    50K .......... .......... .......... .......... .......... 81%  987K 0s
   100K .......... .......... ..                              100%  267K=3D=
0.3s

2021-06-17 16:01:26 (446 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libpam0g_1.3.1-5_arm64.deb=E2=80=99 saved [124932/124932]

--2021-06-17 16:01:27--  http://deb.debian.org/debian/pool/main/p/pcre3/lib=
pcre3_8.39-12_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 316596 (309K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libpcre3_2%3a8.39-12=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16%  468K 1s
    50K .......... .......... .......... .......... .......... 32%  550K 0s
   100K .......... .......... .......... .......... .......... 48% 1.96M 0s
   150K .......... .......... .......... .......... .......... 64% 2.36M 0s
   200K .......... .......... .......... .......... .......... 80%  902K 0s
   250K .......... .......... .......... .......... .......... 97% 3.09M 0s
   300K .........                                             100% 3.02M=3D=
0.3s

2021-06-17 16:01:27 (973 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libpcre3_2%3a8.39-12_arm64.deb=E2=80=99 saved [316596/316596]

--2021-06-17 16:01:27--  http://deb.debian.org/debian/pool/main/p/perl/perl=
-base_5.28.1-6+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1403048 (1.3M) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/perl-base_5.28.1-6+d=
eb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  3%  447K 3s
    50K .......... .......... .......... .......... ..........  7%  519K 3s
   100K .......... .......... .......... .......... .......... 10% 1.96M 2s
   150K .......... .......... .......... .......... .......... 14% 2.26M 1s
   200K .......... .......... .......... .......... .......... 18%  864K 1s
   250K .......... .......... .......... .......... .......... 21% 2.99M 1s
   300K .......... .......... .......... .......... .......... 25% 3.32M 1s
   350K .......... .......... .......... .......... .......... 29% 4.06M 1s
   400K .......... .......... .......... .......... .......... 32% 3.69M 1s
   450K .......... .......... .......... .......... .......... 36% 1.04M 1s
   500K .......... .......... .......... .......... .......... 40% 2.80M 1s
   550K .......... .......... .......... .......... .......... 43% 2.85M 1s
   600K .......... .......... .......... .......... .......... 47% 2.76M 1s
   650K .......... .......... .......... .......... .......... 51% 2.90M 0s
   700K .......... .......... .......... .......... .......... 54% 2.76M 0s
   750K .......... .......... .......... .......... .......... 58% 1.81M 0s
   800K .......... .......... .......... .......... .......... 62% 2.79M 0s
   850K .......... .......... .......... .......... .......... 65% 2.96M 0s
   900K .......... .......... .......... .......... .......... 69% 2.92M 0s
   950K .......... .......... .......... .......... .......... 72% 2.90M 0s
  1000K .......... .......... .......... .......... .......... 76% 1.88M 0s
  1050K .......... .......... .......... .......... .......... 80% 2.85M 0s
  1100K .......... .......... .......... .......... .......... 83% 3.04M 0s
  1150K .......... .......... .......... .......... .......... 87% 3.20M 0s
  1200K .......... .......... .......... .......... .......... 91% 2.92M 0s
  1250K .......... .......... .......... .......... .......... 94% 3.07M 0s
  1300K .......... .......... .......... .......... .......... 98% 1.96M 0s
  1350K .......... ..........                                 100% 2.89M=3D=
0.7s

2021-06-17 16:01:28 (1.82 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/perl-base_5.28.1-6+deb10u1_arm64.deb=E2=80=99 saved [1403048/1403048]

--2021-06-17 16:01:28--  http://deb.debian.org/debian/pool/main/p/pinentry/=
pinentry-curses_1.1.0-2_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 62684 (61K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/pinentry-curses_1.1.=
0-2_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 81%  489K 0s
    50K .......... .                                          100% 1.31M=3D=
0.1s

2021-06-17 16:01:28 (553 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/pinentry-curses_1.1.0-2_arm64.deb=E2=80=99 saved [62684/62684]

--2021-06-17 16:01:28--  http://deb.debian.org/debian/pool/main/r/readline/=
libreadline7_7.0-5_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 133576 (130K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libreadline7_7.0-5_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 38%  461K 0s
    50K .......... .......... .......... .......... .......... 76%  547K 0s
   100K .......... .......... ..........                      100% 1.90M=3D=
0.2s

2021-06-17 16:01:29 (606 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libreadline7_7.0-5_arm64.deb=E2=80=99 saved [133576/133576]

--2021-06-17 16:01:29--  http://deb.debian.org/debian/pool/main/r/readline/=
readline-common_7.0-5_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 70572 (69K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/readline-common_7.0-=
5_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 72%  444K 0s
    50K .......... ........                                   100% 1.33M=3D=
0.1s

2021-06-17 16:01:29 (545 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/readline-common_7.0-5_all.deb=E2=80=99 saved [70572/70572]

--2021-06-17 16:01:29--  http://deb.debian.org/debian/pool/main/s/sed/sed_4=
.7-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 305512 (298K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/sed_4.7-1_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 16%  398K 1s
    50K .......... .......... .......... .......... .......... 33%  556K 0s
   100K .......... .......... .......... .......... .......... 50% 1.63M 0s
   150K .......... .......... .......... .......... .......... 67% 2.04M 0s
   200K .......... .......... .......... .......... .......... 83%  884K 0s
   250K .......... .......... .......... .......... ........  100% 2.74M=3D=
0.3s

2021-06-17 16:01:30 (870 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/sed_4.7-1_arm64.deb=E2=80=99 saved [305512/305512]

--2021-06-17 16:01:30--  http://deb.debian.org/debian/pool/main/s/shadow/lo=
gin_4.5-1.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 748128 (731K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/login_1%3a4.5-1.1_ar=
m64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6%  484K 1s
    50K .......... .......... .......... .......... .......... 13%  573K 1s
   100K .......... .......... .......... .......... .......... 20% 2.01M 1s
   150K .......... .......... .......... .......... .......... 27% 2.43M 1s
   200K .......... .......... .......... .......... .......... 34%  936K 1s
   250K .......... .......... .......... .......... .......... 41% 3.11M 0s
   300K .......... .......... .......... .......... .......... 47% 3.82M 0s
   350K .......... .......... .......... .......... .......... 54% 4.37M 0s
   400K .......... .......... .......... .......... .......... 61% 4.11M 0s
   450K .......... .......... .......... .......... .......... 68% 1.14M 0s
   500K .......... .......... .......... .......... .......... 75% 2.88M 0s
   550K .......... .......... .......... .......... .......... 82% 2.91M 0s
   600K .......... .......... .......... .......... .......... 88% 2.96M 0s
   650K .......... .......... .......... .......... .......... 95% 3.11M 0s
   700K .......... .......... ..........                      100% 3.00M=3D=
0.5s

2021-06-17 16:01:31 (1.55 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/login_1%3a4.5-1.1_arm64.deb=E2=80=99 saved [748128/748128]

--2021-06-17 16:01:31--  http://deb.debian.org/debian/pool/main/s/shadow/pa=
sswd_4.5-1.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 980320 (957K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/passwd_1%3a4.5-1.1_a=
rm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5%  469K 2s
    50K .......... .......... .......... .......... .......... 10%  552K 2s
   100K .......... .......... .......... .......... .......... 15% 1.93M 1s
   150K .......... .......... .......... .......... .......... 20% 2.31M 1s
   200K .......... .......... .......... .......... .......... 26%  908K 1s
   250K .......... .......... .......... .......... .......... 31% 2.99M 1s
   300K .......... .......... .......... .......... .......... 36% 3.67M 1s
   350K .......... .......... .......... .......... .......... 41% 4.06M 0s
   400K .......... .......... .......... .......... .......... 47% 3.40M 0s
   450K .......... .......... .......... .......... .......... 52% 1.14M 0s
   500K .......... .......... .......... .......... .......... 57% 2.70M 0s
   550K .......... .......... .......... .......... .......... 62% 2.92M 0s
   600K .......... .......... .......... .......... .......... 67% 2.86M 0s
   650K .......... .......... .......... .......... .......... 73% 2.99M 0s
   700K .......... .......... .......... .......... .......... 78% 2.85M 0s
   750K .......... .......... .......... .......... .......... 83% 1.87M 0s
   800K .......... .......... .......... .......... .......... 88% 2.86M 0s
   850K .......... .......... .......... .......... .......... 94% 3.12M 0s
   900K .......... .......... .......... .......... .......... 99% 2.95M 0s
   950K .......                                               100% 2.79M=3D=
0.6s

2021-06-17 16:01:31 (1.67 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/passwd_1%3a4.5-1.1_arm64.deb=E2=80=99 saved [980320/980320]

--2021-06-17 16:01:31--  http://deb.debian.org/debian/pool/main/s/sqlite3/l=
ibsqlite3-0_3.27.2-3+deb10u1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 602996 (589K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsqlite3-0_3.27.2-=
3+deb10u1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  8%  463K 1s
    50K .......... .......... .......... .......... .......... 16%  548K 1s
   100K .......... .......... .......... .......... .......... 25% 1.92M 1s
   150K .......... .......... .......... .......... .......... 33% 2.32M 0s
   200K .......... .......... .......... .......... .......... 42%  896K 0s
   250K .......... .......... .......... .......... .......... 50% 2.99M 0s
   300K .......... .......... .......... .......... .......... 59% 3.66M 0s
   350K .......... .......... .......... .......... .......... 67% 4.07M 0s
   400K .......... .......... .......... .......... .......... 76% 3.93M 0s
   450K .......... .......... .......... .......... .......... 84% 1.11M 0s
   500K .......... .......... .......... .......... .......... 93% 2.73M 0s
   550K .......... .......... .......... ........             100% 2.82M=3D=
0.4s

2021-06-17 16:01:32 (1.33 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/libsqlite3-0_3.27.2-3+deb10u1_arm64.deb=E2=80=99 saved [602996/602996]

--2021-06-17 16:01:32--  http://deb.debian.org/debian/pool/main/s/systemd/l=
ibsystemd0_241-7~deb10u7_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 313840 (306K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsystemd0_241-7~de=
b10u7_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 16%  441K 1s
    50K .......... .......... .......... .......... .......... 32%  522K 0s
   100K .......... .......... .......... .......... .......... 48% 1.82M 0s
   150K .......... .......... .......... .......... .......... 65% 2.22M 0s
   200K .......... .......... .......... .......... .......... 81%  847K 0s
   250K .......... .......... .......... .......... .......... 97% 2.83M 0s
   300K ......                                                100% 5.03M=3D=
0.3s

2021-06-17 16:01:33 (913 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsystemd0_241-7~deb10u7_arm64.deb=E2=80=99 saved [313840/313840]

--2021-06-17 16:01:33--  http://deb.debian.org/debian/pool/main/s/systemd/l=
ibudev1_241-7~deb10u7_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 146316 (143K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libudev1_241-7~deb10=
u7_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 34%  466K 0s
    50K .......... .......... .......... .......... .......... 69%  552K 0s
   100K .......... .......... .......... .......... ..        100% 1.95M=3D=
0.2s

2021-06-17 16:01:33 (651 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libudev1_241-7~deb10u7_arm64.deb=E2=80=99 saved [146316/146316]

--2021-06-17 16:01:33--  http://deb.debian.org/debian/pool/main/s/sysvinit/=
sysvinit-utils_2.93-8_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 78308 (76K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/sysvinit-utils_2.93-=
8_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 65%  474K 0s
    50K .......... .......... ......                          100% 1.38M=3D=
0.1s

2021-06-17 16:01:34 (616 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/sysvinit-utils_2.93-8_arm64.deb=E2=80=99 saved [78308/78308]

--2021-06-17 16:01:34--  http://deb.debian.org/debian/pool/main/t/tar/tar_1=
.30+dfsg-6_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 767536 (750K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/tar_1.30+dfsg-6_arm6=
4.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  6%  447K 2s
    50K .......... .......... .......... .......... .......... 13%  529K 1s
   100K .......... .......... .......... .......... .......... 20% 1.71M 1s
   150K .......... .......... .......... .......... .......... 26% 1.94M 1s
   200K .......... .......... .......... .......... .......... 33%  956K 1s
   250K .......... .......... .......... .......... .......... 40% 2.85M 0s
   300K .......... .......... .......... .......... .......... 46% 3.45M 0s
   350K .......... .......... .......... .......... .......... 53% 3.71M 0s
   400K .......... .......... .......... .......... .......... 60% 3.00M 0s
   450K .......... .......... .......... .......... .......... 66% 1.06M 0s
   500K .......... .......... .......... .......... .......... 73% 2.04M 0s
   550K .......... .......... .......... .......... .......... 80% 2.27M 0s
   600K .......... .......... .......... .......... .......... 86% 2.13M 0s
   650K .......... .......... .......... .......... .......... 93% 2.34M 0s
   700K .......... .......... .......... .......... ......... 100% 1.92M=3D=
0.5s

2021-06-17 16:01:34 (1.37 MB/s) - =E2=80=98/work/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/tar_1.30+dfsg-6_arm64.deb=E2=80=99 saved [767536/767536]

--2021-06-17 16:01:34--  http://deb.debian.org/debian/pool/main/t/tzdata/tz=
data_2021a-0+deb10u1_all.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 265548 (259K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/tzdata_2021a-0+deb10=
u1_all.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 19%  335K 1s
    50K .......... .......... .......... .......... .......... 38%  386K 0s
   100K .......... .......... .......... .......... .......... 57% 1.24M 0s
   150K .......... .......... .......... .......... .......... 77% 1.39M 0s
   200K .......... .......... .......... .......... .......... 96%  583K 0s
   250K .........                                             100% 1.80M=3D=
0.4s

2021-06-17 16:01:35 (583 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/tzdata_2021a-0+deb10u1_all.deb=E2=80=99 saved [265548/265548]

--2021-06-17 16:01:35--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/bsdutils_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 118476 (116K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/bsdutils_1%3a2.33.1-=
0.1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 43%  316K 0s
    50K .......... .......... .......... .......... .......... 86%  340K 0s
   100K .......... .....                                      100% 1.37M=3D=
0.3s

2021-06-17 16:01:36 (366 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/bsdutils_1%3a2.33.1-0.1_arm64.deb=E2=80=99 saved [118476/118476]

--2021-06-17 16:01:36--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/fdisk_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 173616 (170K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/fdisk_2.33.1-0.1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 29%  257K 0s
    50K .......... .......... .......... .......... .......... 58%  278K 0s
   100K .......... .......... .......... .......... .......... 88% 1016K 0s
   150K .......... .........                                  100% 1.11M=3D=
0.4s

2021-06-17 16:01:37 (384 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/fdisk_2.33.1-0.1_arm64.deb=E2=80=99 saved [173616/173616]

--2021-06-17 16:01:37--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libblkid1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 186456 (182K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libblkid1_2.33.1-0.1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 27%  226K 1s
    50K .......... .......... .......... .......... .......... 54%  238K 0s
   100K .......... .......... .......... .......... .......... 82%  495K 0s
   150K .......... .......... .......... ..                   100%  424K=3D=
0.6s

2021-06-17 16:01:38 (299 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libblkid1_2.33.1-0.1_arm64.deb=E2=80=99 saved [186456/186456]

--2021-06-17 16:01:38--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libfdisk1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 220856 (216K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libfdisk1_2.33.1-0.1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 23%  155K 1s
    50K .......... .......... .......... .......... .......... 46%  182K 1s
   100K .......... .......... .......... .......... .......... 69%  644K 0s
   150K .......... .......... .......... .......... .......... 92%  746K 0s
   200K .......... .....                                      100%  938K=3D=
0.8s

2021-06-17 16:01:39 (284 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libfdisk1_2.33.1-0.1_arm64.deb=E2=80=99 saved [220856/220856]

--2021-06-17 16:01:39--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libmount1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 198712 (194K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libmount1_2.33.1-0.1=
_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 25%  455K 0s
    50K .......... .......... .......... .......... .......... 51%  585K 0s
   100K .......... .......... .......... .......... .......... 77% 1.79M 0s
   150K .......... .......... .......... .......... ....      100% 1.04M=3D=
0.3s

2021-06-17 16:01:40 (735 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libmount1_2.33.1-0.1_arm64.deb=E2=80=99 saved [198712/198712]

--2021-06-17 16:01:40--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libsmartcols1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 144400 (141K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libsmartcols1_2.33.1=
-0.1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 35%  172K 1s
    50K .......... .......... .......... .......... .......... 70%  199K 0s
   100K .......... .......... .......... .......... .         100%  718K=3D=
0.6s

2021-06-17 16:01:41 (236 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libsmartcols1_2.33.1-0.1_arm64.deb=E2=80=99 saved [144400/144400]

--2021-06-17 16:01:41--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/libuuid1_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 77788 (76K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/libuuid1_2.33.1-0.1_=
arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 65%  356K 0s
    50K .......... .......... .....                           100% 1.56M=3D=
0.2s

2021-06-17 16:01:42 (485 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/libuuid1_2.33.1-0.1_arm64.deb=E2=80=99 saved [77788/77788]

--2021-06-17 16:01:42--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/mount_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 170948 (167K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/mount_2.33.1-0.1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 29%  395K 0s
    50K .......... .......... .......... .......... .......... 59%  595K 0s
   100K .......... .......... .......... .......... .......... 89% 1.43M 0s
   150K .......... ......                                     100% 7.61M=3D=
0.2s

2021-06-17 16:01:42 (676 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/mount_2.33.1-0.1_arm64.deb=E2=80=99 saved [170948/170948]

--2021-06-17 16:01:43--  http://deb.debian.org/debian/pool/main/u/util-linu=
x/util-linux_2.33.1-0.1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 1023512 (1000K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/util-linux_2.33.1-0.=
1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... ..........  5%  325K 3s
    50K .......... .......... .......... .......... .......... 10%  337K 3s
   100K .......... .......... .......... .......... .......... 15%  388K 2s
   150K .......... .......... .......... .......... .......... 20%  515K 2s
   200K .......... .......... .......... .......... .......... 25% 1.38M 2s
   250K .......... .......... .......... .......... .......... 30%  506K 2s
   300K .......... .......... .......... .......... .......... 35%  873K 1s
   350K .......... .......... .......... .......... .......... 40% 1.01M 1s
   400K .......... .......... .......... .......... .......... 45%  991K 1s
   450K .......... .......... .......... .......... .......... 50% 1.00M 1s
   500K .......... .......... .......... .......... .......... 55%  989K 1s
   550K .......... .......... .......... .......... .......... 60% 1.07M 1s
   600K .......... .......... .......... .......... .......... 65% 1.04M 1s
   650K .......... .......... .......... .......... .......... 70% 1.07M 0s
   700K .......... .......... .......... .......... .......... 75% 1.16M 0s
   750K .......... .......... .......... .......... .......... 80% 1.06M 0s
   800K .......... .......... .......... .......... .......... 85% 1.36M 0s
   850K .......... .......... .......... .......... .......... 90% 1.08M 0s
   900K .......... .......... .......... .......... .......... 95% 1.16M 0s
   950K .......... .......... .......... .......... ......... 100% 1.23M=3D=
1.3s

2021-06-17 16:01:44 (765 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/util-linux_2.33.1-0.1_arm64.deb=E2=80=99 saved [1023512/1023512]

--2021-06-17 16:01:44--  http://deb.debian.org/debian/pool/main/x/xz-utils/=
liblzma5_5.2.4-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 149176 (146K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/liblzma5_5.2.4-1_arm=
64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 34%  368K 0s
    50K .......... .......... .......... .......... .......... 68%  433K 0s
   100K .......... .......... .......... .......... .....     100% 1.54M=3D=
0.3s

2021-06-17 16:01:45 (520 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/liblzma5_5.2.4-1_arm64.deb=E2=80=99 saved [149176/149176]

--2021-06-17 16:01:45--  http://deb.debian.org/debian/pool/main/z/zlib/zlib=
1g_1.2.11.dfsg-1_arm64.deb
Resolving deb.debian.org (deb.debian.org)... 151.101.110.132, 2a04:4e42:11:=
:644
Connecting to deb.debian.org (deb.debian.org)|151.101.110.132|:80... connec=
ted.
HTTP request sent, awaiting response... 200 OK
Length: 89340 (87K) [application/x-debian-package]
Saving to: =E2=80=98/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstra=
p-target/1.0-r0/rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.df=
sg-1_arm64.deb=E2=80=99

     0K .......... .......... .......... .......... .......... 57%  372K 0s
    50K .......... .......... .......... .......              100% 1.02M=3D=
0.2s

2021-06-17 16:01:45 (513 KB/s) - =E2=80=98/work/build/tmp/work/jailhouse-de=
mo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/partia=
l/zlib1g_1%3a1.2.11.dfsg-1_arm64.deb=E2=80=99 saved [89340/89340]

/bin/ls: cannot access '//proc': Too many levels of symbolic links
mount: /proc: mount(2) system call failed: Too many levels of symbolic link=
s.
Segmentation fault (core dumped)

------=_Part_792_1674631409.1623984712483
Content-Type: text/plain; charset=US-ASCII; name=build_rpi4_fail.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=build_rpi4_fail.txt
X-Attachment-Id: 63daf1e5-0629-4ddf-96b7-1c08c44e630c
Content-ID: <63daf1e5-0629-4ddf-96b7-1c08c44e630c>

:~/lch/jailhouse-images$ ./build-images.sh 
Available images demo images:
1: QEMU/KVM Intel-x86 virtual target
2: QEMU ARM virtual target
3: QEMU ARM64 virtual target
4: Orange Pi Zero (256 MB edition)
5: Intel NUC (NUC6CAY, 8 GB RAM)
6: SIMATIC IPC127E (2 cores / 2 GB edition)
7: Marvell ESPRESSObin (1 GB edition)
8: Marvell MACCHIATObin
9: LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
10: Avnet Ultra96 v1
11: Avnet Ultra96 v2
12: Raspberry Pi 4 (1-8 GB editions)
13: Pine64+ (Allwinner A64, 2 GB edition)
0: all (may take hours...)

Select images to build (space-separated index list): 12
Unable to find image 'ghcr.io/siemens/kas/kas-isar:2.4' locally
2.4: Pulling from siemens/kas/kas-isar
45b42c59be33: Pull complete 
4bcc31cf69b2: Pull complete 
6a30beef3f10: Pull complete 
ba638257320c: Pull complete 
4ef5907f4360: Pull complete 
9bec5e830f62: Pull complete 
f615df3e96ed: Pull complete 
ab2a8f18e73a: Pull complete 
a96249fe00b6: Pull complete 
ec336f30059b: Pull complete 
Digest: sha256:cc464a9650b2f91b8caa088adbe8e0c64a167ca29cff69108d92520903cb95c1
Status: Downloaded newer image for ghcr.io/siemens/kas/kas-isar:2.4
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: warning: unable to close /proc/sys/fs/binfmt_misc/register: Invalid argument
update-binfmts: exiting due to previous errors
2021-06-17 15:58:36 - INFO     - kas 2.4 started
2021-06-17 15:58:36 - INFO     - /repo$ git rev-parse --show-toplevel
2021-06-17 15:58:36 - INFO     - /repo$ git rev-parse --show-toplevel
2021-06-17 15:58:36 - INFO     - Using /repo as root for repository jailhouse
2021-06-17 15:58:36 - INFO     - /work$ git clone -q https://github.com/ilbers/isar /work/isar
2021-06-17 15:58:40 - INFO     - Repository isar cloned
2021-06-17 15:58:40 - INFO     - /repo$ git rev-parse --show-toplevel
2021-06-17 15:58:40 - INFO     - Using /repo as root for repository jailhouse
2021-06-17 15:58:40 - INFO     - /work/isar$ git status -s
2021-06-17 15:58:40 - INFO     - /work/isar$ git rev-parse --verify -q origin/dbb9df67c1321aa7f6020948a964a2bcf636684a
2021-06-17 15:58:40 - INFO     - /work/isar$ git checkout -q dbb9df67c1321aa7f6020948a964a2bcf636684a
2021-06-17 15:58:40 - INFO     - /repo$ git rev-parse --show-toplevel
2021-06-17 15:58:40 - INFO     - Using /repo as root for repository jailhouse
2021-06-17 15:58:40 - INFO     - /work/isar$ /tmp/tmpx65rgjgt/get_bb_env /work/build
2021-06-17 15:58:40 - INFO     - /repo$ git rev-parse --show-toplevel
2021-06-17 15:58:40 - INFO     - Using /repo as root for repository jailhouse
2021-06-17 15:58:40 - INFO     - /repo$ git rev-parse --show-toplevel
2021-06-17 15:58:40 - INFO     - Using /repo as root for repository jailhouse
2021-06-17 15:58:40 - INFO     - /work/build$ /work/isar/bitbake/bin/bitbake -c build mc:rpi4-jailhouse-demo:demo-image
Parsing recipes: 100% |##########################################| Time: 0:00:01
Parsing of 38 .bb files complete (0 cached, 38 parsed). 76 targets, 0 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100% |#######################################| Time: 0:00:01
NOTE: No setscene tasks
NOTE: Executing Tasks
ERROR: mc:rpi4-jailhouse-demo:isar-bootstrap-target-1.0-r0 do_bootstrap: Execution of '/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/temp/run.do_bootstrap.3273' failed with exit code 1:
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
I: Retrieving apt 1.8.2.2
I: Validating apt 1.8.2.2
I: Retrieving libapt-pkg5.0 1.8.2.2
I: Validating libapt-pkg5.0 1.8.2.2
I: Retrieving libattr1 1:2.4.48-4
I: Validating libattr1 1:2.4.48-4
I: Retrieving libaudit-common 1:2.8.4-3
I: Validating libaudit-common 1:2.8.4-3
I: Retrieving libaudit1 1:2.8.4-3
I: Validating libaudit1 1:2.8.4-3
I: Retrieving base-files 10.3+deb10u9
I: Validating base-files 10.3+deb10u9
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
I: Retrieving libsasl2-2 2.1.27+dfsg-1+deb10u1
I: Validating libsasl2-2 2.1.27+dfsg-1+deb10u1
I: Retrieving libsasl2-modules-db 2.1.27+dfsg-1+deb10u1
I: Validating libsasl2-modules-db 2.1.27+dfsg-1+deb10u1
I: Retrieving dash 0.5.10.2-5
I: Validating dash 0.5.10.2-5
I: Retrieving libdb5.3 5.3.28+dfsg1-0.5
I: Validating libdb5.3 5.3.28+dfsg1-0.5
I: Retrieving debconf 1.5.71
I: Validating debconf 1.5.71
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
I: Retrieving libc-bin 2.28-10
I: Validating libc-bin 2.28-10
I: Retrieving libc-l10n 2.28-10
I: Validating libc-l10n 2.28-10
I: Retrieving libc6 2.28-10
I: Validating libc6 2.28-10
I: Retrieving locales 2.28-10
I: Validating locales 2.28-10
I: Retrieving libgmp10 2:6.1.2+dfsg-4
I: Validating libgmp10 2:6.1.2+dfsg-4
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
I: Retrieving libgnutls30 3.6.7-4+deb10u6
I: Validating libgnutls30 3.6.7-4+deb10u6
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
I: Retrieving libgcrypt20 1.8.4-5
I: Validating libgcrypt20 1.8.4-5
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
I: Retrieving liblz4-1 1.8.3-1
I: Validating liblz4-1 1.8.3-1
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
I: Retrieving libhogweed4 3.4.1-1
I: Validating libhogweed4 3.4.1-1
I: Retrieving libnettle6 3.4.1-1
I: Validating libnettle6 3.4.1-1
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
I: Retrieving libsystemd0 241-7~deb10u7
I: Validating libsystemd0 241-7~deb10u7
I: Retrieving libudev1 241-7~deb10u7
I: Validating libudev1 241-7~deb10u7
I: Retrieving sysvinit-utils 2.93-8
I: Validating sysvinit-utils 2.93-8
I: Retrieving tar 1.30+dfsg-6
I: Validating tar 1.30+dfsg-6
I: Retrieving tzdata 2021a-0+deb10u1
I: Validating tzdata 2021a-0+deb10u1
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

ERROR: Logfile of failure stored in: /work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/temp/log.do_bootstrap.3273
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
| I: Retrieving apt 1.8.2.2
| I: Validating apt 1.8.2.2
| I: Retrieving libapt-pkg5.0 1.8.2.2
| I: Validating libapt-pkg5.0 1.8.2.2
| I: Retrieving libattr1 1:2.4.48-4
| I: Validating libattr1 1:2.4.48-4
| I: Retrieving libaudit-common 1:2.8.4-3
| I: Validating libaudit-common 1:2.8.4-3
| I: Retrieving libaudit1 1:2.8.4-3
| I: Validating libaudit1 1:2.8.4-3
| I: Retrieving base-files 10.3+deb10u9
| I: Validating base-files 10.3+deb10u9
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
| I: Retrieving libsasl2-2 2.1.27+dfsg-1+deb10u1
| I: Validating libsasl2-2 2.1.27+dfsg-1+deb10u1
| I: Retrieving libsasl2-modules-db 2.1.27+dfsg-1+deb10u1
| I: Validating libsasl2-modules-db 2.1.27+dfsg-1+deb10u1
| I: Retrieving dash 0.5.10.2-5
| I: Validating dash 0.5.10.2-5
| I: Retrieving libdb5.3 5.3.28+dfsg1-0.5
| I: Validating libdb5.3 5.3.28+dfsg1-0.5
| I: Retrieving debconf 1.5.71
| I: Validating debconf 1.5.71
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
| I: Retrieving libc-bin 2.28-10
| I: Validating libc-bin 2.28-10
| I: Retrieving libc-l10n 2.28-10
| I: Validating libc-l10n 2.28-10
| I: Retrieving libc6 2.28-10
| I: Validating libc6 2.28-10
| I: Retrieving locales 2.28-10
| I: Validating locales 2.28-10
| I: Retrieving libgmp10 2:6.1.2+dfsg-4
| I: Validating libgmp10 2:6.1.2+dfsg-4
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
| I: Retrieving libgnutls30 3.6.7-4+deb10u6
| I: Validating libgnutls30 3.6.7-4+deb10u6
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
| I: Retrieving libgcrypt20 1.8.4-5
| I: Validating libgcrypt20 1.8.4-5
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
| I: Retrieving liblz4-1 1.8.3-1
| I: Validating liblz4-1 1.8.3-1
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
| I: Retrieving libhogweed4 3.4.1-1
| I: Validating libhogweed4 3.4.1-1
| I: Retrieving libnettle6 3.4.1-1
| I: Validating libnettle6 3.4.1-1
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
| I: Retrieving libsystemd0 241-7~deb10u7
| I: Validating libsystemd0 241-7~deb10u7
| I: Retrieving libudev1 241-7~deb10u7
| I: Validating libudev1 241-7~deb10u7
| I: Retrieving sysvinit-utils 2.93-8
| I: Validating sysvinit-utils 2.93-8
| I: Retrieving tar 1.30+dfsg-6
| I: Validating tar 1.30+dfsg-6
| I: Retrieving tzdata 2021a-0+deb10u1
| I: Validating tzdata 2021a-0+deb10u1
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
| ERROR: Execution of '/work/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/temp/run.do_bootstrap.3273' failed with exit code 1:
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
| I: Retrieving apt 1.8.2.2
| I: Validating apt 1.8.2.2
| I: Retrieving libapt-pkg5.0 1.8.2.2
| I: Validating libapt-pkg5.0 1.8.2.2
| I: Retrieving libattr1 1:2.4.48-4
| I: Validating libattr1 1:2.4.48-4
| I: Retrieving libaudit-common 1:2.8.4-3
| I: Validating libaudit-common 1:2.8.4-3
| I: Retrieving libaudit1 1:2.8.4-3
| I: Validating libaudit1 1:2.8.4-3
| I: Retrieving base-files 10.3+deb10u9
| I: Validating base-files 10.3+deb10u9
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
| I: Retrieving libsasl2-2 2.1.27+dfsg-1+deb10u1
| I: Validating libsasl2-2 2.1.27+dfsg-1+deb10u1
| I: Retrieving libsasl2-modules-db 2.1.27+dfsg-1+deb10u1
| I: Validating libsasl2-modules-db 2.1.27+dfsg-1+deb10u1
| I: Retrieving dash 0.5.10.2-5
| I: Validating dash 0.5.10.2-5
| I: Retrieving libdb5.3 5.3.28+dfsg1-0.5
| I: Validating libdb5.3 5.3.28+dfsg1-0.5
| I: Retrieving debconf 1.5.71
| I: Validating debconf 1.5.71
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
| I: Retrieving libc-bin 2.28-10
| I: Validating libc-bin 2.28-10
| I: Retrieving libc-l10n 2.28-10
| I: Validating libc-l10n 2.28-10
| I: Retrieving libc6 2.28-10
| I: Validating libc6 2.28-10
| I: Retrieving locales 2.28-10
| I: Validating locales 2.28-10
| I: Retrieving libgmp10 2:6.1.2+dfsg-4
| I: Validating libgmp10 2:6.1.2+dfsg-4
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
| I: Retrieving libgnutls30 3.6.7-4+deb10u6
| I: Validating libgnutls30 3.6.7-4+deb10u6
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
| I: Retrieving libgcrypt20 1.8.4-5
| I: Validating libgcrypt20 1.8.4-5
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
| I: Retrieving liblz4-1 1.8.3-1
| I: Validating liblz4-1 1.8.3-1
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
| I: Retrieving libhogweed4 3.4.1-1
| I: Validating libhogweed4 3.4.1-1
| I: Retrieving libnettle6 3.4.1-1
| I: Validating libnettle6 3.4.1-1
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
| I: Retrieving libsystemd0 241-7~deb10u7
| I: Validating libsystemd0 241-7~deb10u7
| I: Retrieving libudev1 241-7~deb10u7
| I: Validating libudev1 241-7~deb10u7
| I: Retrieving sysvinit-utils 2.93-8
| I: Validating sysvinit-utils 2.93-8
| I: Retrieving tar 1.30+dfsg-6
| I: Validating tar 1.30+dfsg-6
| I: Retrieving tzdata 2021a-0+deb10u1
| I: Validating tzdata 2021a-0+deb10u1
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
NOTE: Tasks Summary: Attempted 44 tasks of which 0 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  mc:rpi4-jailhouse-demo:/work/isar/meta/recipes-core/isar-bootstrap/isar-bootstrap-target.bb:do_bootstrap
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
2021-06-17 16:16:00 - ERROR    - Command returned non-zero exit status 1
hehongwu@hehongwu-ThinkPad-X230:~/lch/jailhouse-images$ 


------=_Part_792_1674631409.1623984712483--
