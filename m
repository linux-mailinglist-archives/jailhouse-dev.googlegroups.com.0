Return-Path: <jailhouse-dev+bncBDOPFBHAQEBRBFV5XC2QMGQEQFG3JUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 89483946992
	for <lists+jailhouse-dev@lfdr.de>; Sat,  3 Aug 2024 14:12:08 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-e0b7922ed63sf12161188276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 03 Aug 2024 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1722687127; x=1723291927; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqhvBbXcF5KSFCu0bK3XPdKD9hyJRF7m+PtS323wVsE=;
        b=d7K5aekXfNB9rhyYa31rSQc7waAj5/aXwv2qXUpHDcn+Urf6CMa1ae0088qvrNuYUJ
         uFGxnjucFLIcTZuzaMlmAX4YToc/K3aQpibVyI9jkUt11FST/8FxMKFGF1N3fotdRyET
         B3LXGt0xq1LkbnMwSgJM6SyHiZJMYYTMNwecvrzxujfgebrhbKoIJ4Iw258BfHSlLP0V
         1Kmx4Ge8PbDiyxtxLjTnJEAAqeCBQKY8Rg4csSwVYZSrkYtjNW4D8OF6toUazDuWS/Pj
         PihwL6zRx6of+ftoiD5Rw/3rWuk4Vk05sl5mhxTRBYQ05aAnxEEc0i1rrbMIYjEebSo/
         pmmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722687127; x=1723291927; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqhvBbXcF5KSFCu0bK3XPdKD9hyJRF7m+PtS323wVsE=;
        b=nRjl4kp5XCZeyV96QIo/t9gEg1PVmGYC7bQSE3Lho+Y2bbK6IlYqWAqqvCdtytXYFX
         wk52+4Cn6aLD4D6c30G1Y/DBFZF+siARVWDrf96CaUQtLGYxNUtEt5QrYHZqRYVElIXM
         muky5mF9qJlxk5kpto/0LnbuQ26ap/sOJSYX5IRTtodvKGUszKGEQmkB933P984QJzLD
         Dn6FQ6Ux6VW5K2OLhf13sSFyTlbJNx1NrhTRIIpN8LYb0Gment/q4+GKHuA/DLFMZ71g
         cIxX95Ydg7pTJT0S0AomelmXzeYT4sEVPUzWVQdbQUHgLhmsEeKK+3GEMBBjvjupzhSh
         e7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722687127; x=1723291927;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqhvBbXcF5KSFCu0bK3XPdKD9hyJRF7m+PtS323wVsE=;
        b=iqUsa5nxqLVcdw1KlS1xyqonnn7aAzH3yajurtDeDo45/ttW4KMA2phSvZAqNn+OO5
         QRSlncvj6G569ctnat+zlTdTHUjRLWPpetgsD8+MwLoacWwx52qEUtzp3pJxOAq1eQf8
         8qA04P3CeO1SWvrvOjgVjbixJ8qZpCLBbhMFaKmb5LRUILrkxBs81hK9KVKqOxUL6Jr9
         hhAZOttt6ipTsAa3Hl00Y+5pZYrpbbZOuFPLTVq5gxGLbayJyVXW/K5dt8FyXnYnmmqi
         1eYiYEgY4PZGpcmrFUYLfQZAIZjxgz0/k36JGEJx1qjUR6yGNhOA1ZP6TSM1wMTDz8Ak
         rKYQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCULZKfGLurta4qxnoKap2sTE3XhtuMd7AZvINhrMacisnhWTA+nHeCotPH1jeVwDHybn9nrnZvpF+MDwtUMIGRr6eMCZ8yUbiuRQw0=
X-Gm-Message-State: AOJu0Yxl+TxMAPHRdRGIdU8dQ7NFDFs32rJxX+R3VfMfk7uj6L9+BN51
	6Jve10d/uClXbWdcJde4GWGyMF0GiDG47bsXpYXUUvBqr0XfGO+M
X-Google-Smtp-Source: AGHT+IEgenO7mnFNIx2DOJVLhdpXqF686GNESBxlDJApaHtBcHDK9IuFYlWyS4jRZkQ2mTbydEuyMg==
X-Received: by 2002:a05:6902:2785:b0:e0b:c402:b038 with SMTP id 3f1490d57ef6-e0bde38282bmr7077420276.16.1722687126980;
        Sat, 03 Aug 2024 05:12:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1003:b0:e0b:be54:a76d with SMTP id
 3f1490d57ef6-e0bf49e4dd3ls857639276.0.-pod-prod-09-us; Sat, 03 Aug 2024
 05:12:05 -0700 (PDT)
X-Received: by 2002:a05:690c:298:b0:62f:f535:f37 with SMTP id 00721157ae682-68959553e8bmr948557b3.0.1722687125493;
        Sat, 03 Aug 2024 05:12:05 -0700 (PDT)
Date: Sat, 3 Aug 2024 05:12:04 -0700 (PDT)
From: =?UTF-8?B?6ZmI6IiS5q+F?= <csydlut@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3b2a8c02-2e34-4a60-bb95-72a97aca445fn@googlegroups.com>
Subject: AM62, Jailhouse Uboot compile
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_375528_307151308.1722687124689"
X-Original-Sender: csydlut@gmail.com
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

------=_Part_375528_307151308.1722687124689
Content-Type: multipart/alternative; 
	boundary="----=_Part_375529_2043103710.1722687124689"

------=_Part_375529_2043103710.1722687124689
Content-Type: text/plain; charset="UTF-8"



Hi,

We now want to port the jailhouse running on custom hardware. But we are 
not so familiar with this set of software, so we buy the official board 
first.
The operation we have done is listed below.

1. Download the wic.xz image from official website and flash to the SD 
card. Make the target board boot from SD card.

The result is perfect. We can boot Linux and create two partitions easily.

2. Download the SDK : ti-processor-sdk-linux-am62xx-evm-09.02.01.10. Build 
up a develop Host via Ubuntu22.04. And then
      (1)Flash the files(tiboot3.bin , tispl.bin , u-boot.img)  located in 
<SDK_Path>/board-support/prebuilt-images/am62xx-evm-jailhouse into the SD 
Card boot partition.

      (2)Flash the rootfs from 
<SDK_Path>/filesystem/am62xx-evm-jailhouse/tisdk-jailhouse-image-am62xx-evm.tar.xz 
into the SD Card root partition.

The result is perfect. We can boot Linux and create two partitions easily.

 

Now we want to compile all the mentioned files by ourselves and preparing 
to port to our own hardwares.

1. Switch to top level directory of the SDK_Path;

2. #Host: make jailhouse_clean

3. #Host: make jailhouse

4. #Host: make jailhouse_install DESTDIR=<root partition of target>

5. #Host: make linux-extras

6. #Host: make linux-extras_install DESTDIR=<root partition of target>

7. #Host: make u-boot-extras

8. #Host: make u-boot-extras_install DESTDIR=<boot partition of target>

Now the SD card should hold all files needed to boot Linux & Jailhouse.
First, we can boot up the Linux successfully. But after we create a 
jailhouse cell, the root cell, which is running on CPU0, would crash 
immediately.

In order to find out the error, we overwrite tiboot3.bin tispl.bin 
u-boot.img by the files from prebuilt-image folder.

After that, Linux & Jailhouse can work smoothly.

 

Q1 : Whether we had make any misunderstanding about the commands?

Q2 : If we want to port jailhouse to our hardware, where is the start 
point? Could you give us some suggestions?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3b2a8c02-2e34-4a60-bb95-72a97aca445fn%40googlegroups.com.

------=_Part_375529_2043103710.1722687124689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi,</p> <p>We now want to port the jailhouse running on custom hardware.=
 But we are not so familiar with this set of software, so we buy the offici=
al board first.<br />The operation we have done is listed below.</p> <p>1. =
Download the wic.xz image from official website and flash to the SD card. M=
ake the target board boot from SD card.</p> <p>The result is perfect. We ca=
n boot Linux and create two partitions easily.</p> <p>2. Download the SDK :=
 ti-processor-sdk-linux-am62xx-evm-09.02.01.10. Build up a develop Host via=
 Ubuntu22.04. And then<br />=C2=A0 =C2=A0 =C2=A0 (1)Flash the files(tiboot3=
.bin , tispl.bin , u-boot.img)=C2=A0 located in &lt;SDK_Path&gt;/board-supp=
ort/prebuilt-images/am62xx-evm-jailhouse into the SD Card boot partition.</=
p> <p>=C2=A0 =C2=A0 =C2=A0 (2)Flash the rootfs from &lt;SDK_Path&gt;/filesy=
stem/am62xx-evm-jailhouse/tisdk-jailhouse-image-am62xx-evm.tar.xz into the =
SD Card root partition.</p> <p>The result is perfect. We can boot Linux and=
 create two partitions easily.</p> <p>=C2=A0</p> <p>Now we want to compile =
all the mentioned files by ourselves and preparing to port to our own hardw=
ares.</p> <p>1. Switch to top level directory of the SDK_Path;</p> <p>2. #H=
ost: make jailhouse_clean</p> <p>3. #Host: make jailhouse</p> <p>4. #Host: =
make jailhouse_install DESTDIR=3D&lt;root partition of target&gt;</p> <p>5.=
 #Host: make linux-extras</p> <p>6. #Host: make linux-extras_install DESTDI=
R=3D&lt;root partition of target&gt;</p> <p>7. #Host: make u-boot-extras</p=
> <p>8. #Host: make u-boot-extras_install DESTDIR=3D&lt;boot partition of t=
arget&gt;</p> <p>Now the SD card should hold all files needed to boot Linux=
 &amp; Jailhouse.<br />First, we can boot up the Linux successfully. But af=
ter we create a jailhouse cell, the root cell, which is running on CPU0, wo=
uld crash immediately.</p> <p>In order to find out the error, we overwrite =
tiboot3.bin tispl.bin u-boot.img by the files from prebuilt-image folder.</=
p> <p>After that, Linux &amp; Jailhouse can work smoothly.</p> <p>=C2=A0</p=
> <p>Q1 : Whether we had make any misunderstanding about the commands?<br /=
><br />Q2 : If we want to port jailhouse to our hardware, where is the star=
t point? Could you give us some suggestions?</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3b2a8c02-2e34-4a60-bb95-72a97aca445fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3b2a8c02-2e34-4a60-bb95-72a97aca445fn%40googlegroups.co=
m</a>.<br />

------=_Part_375529_2043103710.1722687124689--

------=_Part_375528_307151308.1722687124689--
