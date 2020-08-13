Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBZXI2T4QKGQEVLYDWSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6612439E6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 14:39:03 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id f59sf4642037qtb.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 05:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/wyoIIKtHB10tbnFnM+EIk6ZApKknhonjGLDwWWMZ48=;
        b=FW6Rvh36vdkYs3W2VZPLZIlolAp2zeMNsZTgZp79tsMFb+RzvYGUqykWn7f5BLvfxH
         AcjOWxIbPN1ugTu0X99RY2gl7Ff5ENQqNwx+QOt0IRqXLEuVW4EF6LD+aWboHkRdv3/F
         dbXYSfri8Qt4YjW/XmQBqHHa6SDZMWyGkplFOuMIcvmeSCIMLEU0GieKKAdamOHjEyJn
         7GtwY4/NNSCVdCw2qrBeBi5RVIe+7zN8bDyj8F8HamtLpcIlEQTgCkX13xBocMXWuMeo
         WZMVfC4qCeh0qG42NjMuv7SBiAVItbLlE5yNccywflDwIGxFNTQtcyg/9ndgnXOvDr2M
         ZHcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/wyoIIKtHB10tbnFnM+EIk6ZApKknhonjGLDwWWMZ48=;
        b=q6sioX4vI0d3n1zNgqK1CLLa221cq7BUefFaFpi4983DRHe9HqInNcVkoHSM5d/Zi5
         VhJmNrPByLvHp24Xm2hyvSnwLLMCuRaErh0pa2shZPVZACfMHXW3SIIvqe0buozJ3osU
         52+jyPtpOpnGJjnvGx6a7eiJ4ArZnO6asZkUXGYLCrQTLHsEXq8kJOCNvvNcLtjezH+g
         u/TaPZQJsqWYDRbLcnW2iFrGdAwwq/75gNWg/YyfA2vOlAHxiggGlRDtRZ80/ffcLp1c
         N8W6/G7THCO1IIR6Qh8KZe5UbEq/IiA8pf4r4i8VygsKUBBKrOj3qL05buFX63kd2+ni
         EeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/wyoIIKtHB10tbnFnM+EIk6ZApKknhonjGLDwWWMZ48=;
        b=tkoImu5V9ynAL81j7uPG39kEW7SO86h93yC3QukR435Oq1nJVmdVz2yaezth4eAyA0
         EVPnXnMiK+rmSqr5fBj2K/VhYln1K7wL+F9gTOOo3LP6yYMieERrxS0IaGLdHCAaF6sK
         2+sL31hsJrPTnJF81v85hUnTPLfB7/Se2Z69pGIfm1xKfslWnsuN/dY2wDe4ATGVSniF
         vBw9GBL+/7Tt2xTWyH3XnL2vlk5NBPQhZ7B4sTT8sxQ8VBLK7PQ42TxjWZphBputM0QV
         Jz5CZf1Y773cOq0ZDnIdbZXcy+TTU7tfVO/C+Skmy76x7KLkDIOIE6KvbTyP6IcPN7sB
         0hyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EPcsHwOWdsf/mZWTqghWmLabskdBloKh9FOi9YuewKveZX16K
	41ZeSjpuQgs+SkqgnEMzVuM=
X-Google-Smtp-Source: ABdhPJyklkSi1zT3ryxUovdRBGXKt+klpPLpCupVd+fQb7PDIR+qqTYXBWpti1N6nKZUo7L6bFHTxg==
X-Received: by 2002:a0c:8b5d:: with SMTP id d29mr4189684qvc.172.1597322342469;
        Thu, 13 Aug 2020 05:39:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:141a:: with SMTP id k26ls2212006qtj.4.gmail; Thu, 13 Aug
 2020 05:39:01 -0700 (PDT)
X-Received: by 2002:ac8:6bc1:: with SMTP id b1mr4841883qtt.42.1597322341619;
        Thu, 13 Aug 2020 05:39:01 -0700 (PDT)
Date: Thu, 13 Aug 2020 05:39:00 -0700 (PDT)
From: stranzjanmarc@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
Subject: Starting jailhouse on real hardware without QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2132_1276194773.1597322340939"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_2132_1276194773.1597322340939
Content-Type: multipart/alternative; 
	boundary="----=_Part_2133_467715553.1597322340939"

------=_Part_2133_467715553.1597322340939
Content-Type: text/plain; charset="UTF-8"

I am using a PC (AMD Ryzen) with Linux (Ubuntu 18.04, Kernel 5.5.19).
I want to activate the hypervisor "jailhouse" on this PC and start another 
Linux on a CPU core without using KVM / QEMU.

I built and installed "jailhouse" from the GIT repository (as of 
08/13/2020).

With "sudo jailhouse config create configs/x86/sysconfig.c" I created a 
system configuration.
When "make" was called again, the "configs/x86/sysconfig.cell" file was 
created.

The kernel module was loaded with "sudo insmod 
/lib/modules/5.5.19-050519-generic/extra/driver/jailhouse.ko".

Unfortunately, when I call "sudo jailhouse enable 
$HOME/Projects/Jailhouse/jailhouse.git/configs/x86/sysconfig.cell" I only 
get the message "JAILHOUSE_ENABLE: Invalid argument".
What could be the cause?


The command "jailhouse hardware check" did not result in any problems:


Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok

AMD-V (SVM)                     ok
  NPT                           ok
  Decode assist                 ok
  AVIC                          ok
  Flush by ASID                 ok

AMD-Vi (IOMMU #0)               ok
  Extended feature register     ok
  Valid base register           ok
  SMI filter                    ok
    Valid filter registers      ok
  Hardware events               ok

Check passed!


I would be very grateful for any help!

Best regards
Jan-Marc Stranz.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cf0c959a-a862-4ef3-80c9-2037c88fad45o%40googlegroups.com.

------=_Part_2133_467715553.1597322340939
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family: arial, sans-serif;">I am =
using a PC (AMD Ryzen) with Linux (Ubuntu 18.04, Kernel 5.5.19).</span></di=
v><div><span style=3D"font-family: arial, sans-serif;">I want to activate t=
he hypervisor &quot;jailhouse&quot; on this PC and start another Linux on a=
 CPU core without using KVM / QEMU.<br></span></div><div><span style=3D"fon=
t-family: arial, sans-serif;"><br></span></div><div><span style=3D"font-fam=
ily: arial, sans-serif;">I built and installed &quot;jailhouse&quot; from t=
he GIT repository (as of 08/13/2020).</span></div><div><span style=3D"font-=
family: arial, sans-serif;"><br></span></div><div><div><span style=3D"font-=
family: arial, sans-serif;">With &quot;sudo jailhouse config create configs=
/x86/sysconfig.c&quot; I created a system configuration.</span></div><div><=
span style=3D"font-family: arial, sans-serif;">When &quot;make&quot; was ca=
lled again, the &quot;configs/x86/sysconfig.cell&quot; file was created.</s=
pan></div><div><span style=3D"font-family: arial, sans-serif;"><br></span><=
/div><div><span style=3D"font-family: arial, sans-serif;">The kernel module=
 was loaded with &quot;sudo insmod /lib/modules/5.5.19-050519-generic/extra=
/driver/jailhouse.ko&quot;.</span></div><div><span style=3D"font-family: ar=
ial, sans-serif;"><br></span></div><div><span style=3D"font-family: arial, =
sans-serif;">Unfortunately, when I call &quot;sudo jailhouse enable $HOME/P=
rojects/Jailhouse/jailhouse.git/configs/x86/sysconfig.cell&quot; I only get=
 the message &quot;JAILHOUSE_ENABLE: Invalid argument&quot;.</span></div><d=
iv><span style=3D"font-family: arial, sans-serif;">What could be the cause?=
</span></div><div><span style=3D"font-family: arial, sans-serif;"><br></spa=
n></div><div><span style=3D"font-family: arial, sans-serif;"><br></span></d=
iv><span style=3D"font-family: arial, sans-serif;">The command &quot;jailho=
use hardware check&quot; did not result in any problems:</span></div><div><=
span style=3D"font-family: arial, sans-serif;"><br></span></div><div><br></=
div><div>F<span style=3D"font-family: courier new, monospace;">eature=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Availabilit=
y<br>------------------------------=C2=A0 ------------------<br>Number of C=
PUs &gt; 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ok<br>Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ok<br><br>AMD-V (SVM)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ok<br>=C2=A0 NPT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0 Decode assist=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ok<br>=C2=A0 AVIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0 Flush by ASID=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok=
<br><br>AMD-Vi (IOMMU #0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0 Extended feature register=
=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0 Valid base register=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0 SMI filter=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0=C2=A0=C2=A0 Valid filter regist=
ers=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>=C2=A0 Hardware events=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok=
<br><br>Check passed!<br></span></div><div><br></div><div><span style=3D"fo=
nt-family: arial, sans-serif;"><br></span></div><div><span style=3D"font-fa=
mily: arial, sans-serif;">I would be very grateful for any help!</span></di=
v><div><span style=3D"font-family: arial, sans-serif;"><br></span></div><di=
v><span style=3D"font-family: arial, sans-serif;">Best regards</span></div>=
<div><span style=3D"font-family: arial, sans-serif;">Jan-Marc Stranz.</span=
><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cf0c959a-a862-4ef3-80c9-2037c88fad45o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cf0c959a-a862-4ef3-80c9-2037c88fad45o%40googlegroups.co=
m</a>.<br />

------=_Part_2133_467715553.1597322340939--

------=_Part_2132_1276194773.1597322340939--
