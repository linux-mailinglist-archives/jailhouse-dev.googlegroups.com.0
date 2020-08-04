Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBC4SUX4QKGQET3W5NTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9667523B9C1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Aug 2020 13:39:57 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id s60sf1644603pjc.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Aug 2020 04:39:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596541196; cv=pass;
        d=google.com; s=arc-20160816;
        b=w4Dv1Io8pKwXsVACjhUyJTLPG1U18g1mTt1pgSOBWoB3Mp6a/nnJ3ktwRIgyqc2UZS
         5jqGBtbRiZLx0YOEL4tI+1Uc+2rWVzQvWx5iGthjtCjV1Y+fAGOSZTWjAgmySFgBnRCM
         hNPNw+4KYhdvcLYutgb8wl9Za0wbPLjC852TYpZMy6zOmI9ZkG6Fuh4ncbkArsFSn15b
         hg246BCGdjG/JpotT4UhbF/KnxXdbDIUCn2grPdtAUM1TA54Z6uz4wxZa1QSiQBuF+Q1
         txaKS0AYUR5vqAN++l9K4+0BRWix1BLNzhNRnrBSj7kMRbpkURkNbtuLyYrXqwBK5NSZ
         XR5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=Puubj0+NoDU2r5SdwHLRvFT/OAXQ1IWTX5/RoDPTdNY=;
        b=AuJJsjnXwiNE7hrki7e8XXShRoyryCjLL/ldxQ2mrGRj7b3mu+w1BDx7GG16zpYjuN
         JYSa4hP/jD4Ozt5KwrtOrlw3SDA9THYr/3yFsRaVHbqqVSLXSbWkgi+ogl96WIFpQ5nk
         7mcCRyTagvWMd7NCwTA8AS4dOXqYziw2iufcuBc9jbDud31Ft5W3K0cDFdlgKwY/bpZU
         mejlMSUqIC1hBAMVWyeoWCPB0Q4Ta7uuJBk4TI/6mmrwqERxczJPcJonXA2vz9B8N2bu
         QknnKboXSQu8lMEmjl1mzr5sJqHGXZi0U4/TPjQSjroLBDGPYf78wUAyltg65/Ic1YLj
         +ZlA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=vyJPkgde;
       spf=neutral (google.com: 2607:f8b0:4864:20::234 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Puubj0+NoDU2r5SdwHLRvFT/OAXQ1IWTX5/RoDPTdNY=;
        b=UJ82ooa+tQYjKL4bEi1yQsmGouHGuwlTR5IMvY60t4daxQch9yKhufz4K22D4pxcBl
         ddJnfEM2L0wMm2Yr3pdprL28C+vbtNcuhoyzM/bwnMPqZc6upbsj+dP6sjnobPmPNo/7
         i19d22YDjHIDbYSMPtE4hWs6LDHFptu2NY/Tcyjq8E2azfLSLhCzwh2Hbn//NoiA3oOI
         upsY0tPynu4/mOFQRyizgAohUv7eNSboiKrrwRDu56CtUKNG8ZTDbax8H5fwYXY1QnHT
         8K72i9nuOxy95Tj4mPkNoqD9hCJl/iy8rHpT1fOG493otQfqalvBzoGB4z6Tdm/zTjMX
         /7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Puubj0+NoDU2r5SdwHLRvFT/OAXQ1IWTX5/RoDPTdNY=;
        b=KS/d3deljMGeoaT/Knl/VevH2fTsRFUH9gAi+wt68PNcMof49IdfmmgNr80OHUuDmq
         KeqY6zLAzHU8+B2Z1AuaUR9g3cPFFWPqx1e/zk10Gv5atzTGpXrJ83+Biop+Ym89kHSY
         +q09Ppw3w4yQZBmSx7YUwwEnz4iEhThNjRq9VGfHisrTUktSmNSAiGLrag4Nq5N5ONW2
         s7pKQKt3RGKHP2fSLmkUSUefVT7Bn9PGScoIyYI0xpoZOsnOHLWqyCIlqmlxxRGHuCDo
         66rK335+iHmCK0p4FEHtWDM4R/DLBfp5tG4DIl+M4LOZqcff4m3fnR8w0lbbFwJfLgcb
         4oMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53225W24ZvsSSj3R257zSb0LnO+T8O+7TBUpEH6SZDuHVSP5SryX
	7AofeHv2tLu5fNeXuUA3/Pc=
X-Google-Smtp-Source: ABdhPJwnvrXxmlWREiUAkvVymaekov2s9b4q419BcqWGTChJLnkeGPICU/EVntPMVsIhc7OcHKdrLA==
X-Received: by 2002:a17:902:8f95:: with SMTP id z21mr9286928plo.32.1596541195919;
        Tue, 04 Aug 2020 04:39:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:2c11:: with SMTP id s17ls6735144pfs.9.gmail; Tue, 04 Aug
 2020 04:39:54 -0700 (PDT)
X-Received: by 2002:a63:fe42:: with SMTP id x2mr19282022pgj.207.1596541194801;
        Tue, 04 Aug 2020 04:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596541194; cv=none;
        d=google.com; s=arc-20160816;
        b=GNTtdc0fwLQAup2itDvluV2+yAQeZfnWCOxGr8vtYjPxnHaEiglYR4s8UvUdN5c+CP
         9y/98DGdQ9+1aUCc0TAB1C41zB/Hsm5lgO66vMJIOHvtbx7blDY+7UILz9xQ/HRIXNW/
         b0gZR3OYp+vL7+eMrjSbNsPAfI1+GuYhKQm2BBvDJQ50IdkGsWeAQ97FwjPopSnuymKI
         +oVva7O4OOzsiLCR0RjLQbjMd1RtC1hKPUvxtQzOpl9Q5IeApPSRvK7kQ6qhimRqGZ9a
         5p+raAJe8UFpmiJjlLJKrHHYYnTp2BeRBd4LEUApCa+l499D8ESOD6aXeiZ36sGyBPJO
         LBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ueOJHtjKhXQWImFHaEUh0HjzimAjZcJn2jRKJQBvzKg=;
        b=NMgke1B+wcArKX05MQH3ydi5KE+z5L95gyh7QpeOEkhIf0UwFYelYl7Ao2FAaSDXBU
         DeIosCW/fsar9ykJvbVQgh9UsnlIMsiV/q7ySMcfhTPcmeU+H9AetCdLOK+u+U4Z6D6f
         Ou3b7uVZa7/uDgPwAwTeTI/xB8ew09/Jpc+QHEdMa3tqD+u2uBkf6kTECmOYuoWdwwDv
         MWqV0S+o/qJ282k+jNEaNE81IeHJbW/ZMobWO5vrsZozGSH2S7JHqxpQs789eHfIEGjp
         9IRX/WE3RMntpSJmtnLav5EURaxGuVxHnbzNQOrx29/iwaKifKK6COwHAK3hV7UjEx3c
         HgMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=vyJPkgde;
       spf=neutral (google.com: 2607:f8b0:4864:20::234 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com. [2607:f8b0:4864:20::234])
        by gmr-mx.google.com with ESMTPS id bk18si49368pjb.3.2020.08.04.04.39.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 04:39:53 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::234 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::234;
Received: by mail-oi1-x234.google.com with SMTP id u24so26167860oiv.7
        for <jailhouse-dev@googlegroups.com>; Tue, 04 Aug 2020 04:39:53 -0700 (PDT)
X-Received: by 2002:a05:6808:b12:: with SMTP id s18mr2791141oij.171.1596541193216;
 Tue, 04 Aug 2020 04:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
 <f9395dda-b39c-0826-ff6a-8c60f4efac1b@siemens.com>
In-Reply-To: <f9395dda-b39c-0826-ff6a-8c60f4efac1b@siemens.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Tue, 4 Aug 2020 13:39:42 +0200
Message-ID: <CAGdCPwvM4TNSFr2-KrkhoC5-Usme55GYPHk5n0hh_Qv++fG5jQ@mail.gmail.com>
Subject: Re: GSoC Report: Week 8
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000b10d5a05ac0bb6b1"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=vyJPkgde;       spf=neutral (google.com: 2607:f8b0:4864:20::234 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--000000000000b10d5a05ac0bb6b1
Content-Type: text/plain; charset="UTF-8"

> That is actually a valid finding. The demo image is not using the GPU
> but this means that we are using GPU RAM for sharing?! Fix for that
> welcome.
>

Regarding the GPU memory, the RPi firmware reserves memory for the GPU from
the top of the first 1G of memory. It's configured by gpu_mem variable in
config.txt and it defaults to 64M. In the default jailhouse-images
configuration, GPU has the range of 0x3b400000-0x40000000 reserved (can be
seen in /proc/device-tree/memreserve), while Jailhouse hypervisor
uses 3fc00000-3fffffff. I don't know if the reserved memory area has any
other use when GPU is not used.

When I connect a FullHD screen to RPi running jailhouse-images, the
framebuffer gets allocated at 0x3e887000-0x3ebfa800, so it doesn't conflict
with any memory region used by Jailhouse. When I used the same
configuration in AGL where the GPU is used with gpu_mem=256M, I was not
able to run the rpi4-linux-demo. But that might have been some other issue,
too, will get back there.

For the AGL setup I want to reserve the memory for Jailhouse (and the
non-root cells) outside of the GPU region using the device tree overlay. I
can port that back into jailhouse/jailhouse-images, if you're interested.

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwvM4TNSFr2-KrkhoC5-Usme55GYPHk5n0hh_Qv%2B%2BfG5jQ%40mail.gmail.com.

--000000000000b10d5a05ac0bb6b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">That is actually a valid find=
ing. The demo image is not using the GPU <br>
but this means that we are using GPU RAM for sharing?! Fix for that welcome=
.<br></blockquote><div><br></div>Regarding the GPU memory, the RPi firmware=
 reserves memory for the GPU from the top of the first 1G of memory. It&#39=
;s configured by gpu_mem variable=C2=A0in config.txt and it defaults to 64M=
. In the default jailhouse-images configuration, GPU has the range of=C2=A0=
0x3b400000-0x40000000 reserved (can be seen in /proc/device-tree/memreserve=
), while Jailhouse hypervisor uses=C2=A03fc00000-3fffffff. I don&#39;t know=
 if the reserved memory area has any other use when GPU is not used.<br><br=
><div>When I connect a FullHD screen to RPi running jailhouse-images, the f=
ramebuffer gets allocated at=C2=A00x3e887000-0x3ebfa800, so it doesn&#39;t =
conflict with any memory region used by Jailhouse. When I used the same con=
figuration in AGL where the GPU is used with gpu_mem=3D256M, I was not able=
 to run the rpi4-linux-demo. But that might have been some other issue, too=
, will get back there.=C2=A0</div></div><div><br></div>For the AGL setup I =
want to reserve the memory for Jailhouse (and the non-root cells) outside o=
f the GPU region using the device tree overlay. I can port that back into j=
ailhouse/jailhouse-images, if you&#39;re interested.<br><br>Jakub</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwvM4TNSFr2-KrkhoC5-Usme55GYPHk5n0hh_Qv%2B%2B=
fG5jQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAGdCPwvM4TNSFr2-KrkhoC5-Usme55GYPHk5n0=
hh_Qv%2B%2BfG5jQ%40mail.gmail.com</a>.<br />

--000000000000b10d5a05ac0bb6b1--
