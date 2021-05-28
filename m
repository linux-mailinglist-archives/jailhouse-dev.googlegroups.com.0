Return-Path: <jailhouse-dev+bncBD2KJCOQRYJRBFH4YGCQMGQEJE7CUQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F695393CAF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 May 2021 07:22:30 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id u18-20020a05622a14d2b029022c2829ba03sf1505526qtx.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 May 2021 22:22:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622179349; cv=pass;
        d=google.com; s=arc-20160816;
        b=ckGA4Fcbiyg0G1sZN+oMEH0vyX+UD8ji6JwT2AcwM+bnYA4s3yNZnlu6TPKtvuetAB
         XZX9FaYk+I4RKXHZJPUwfYsK9hQBvfZKGQc/FZJG3LBlgeelYuNLhx9SZjNt9TfqDPFZ
         XVRKwi+IIp50bivySuqakJ+cc6w9aR5BJcC7/FHMSuM//3/AVlvMp3dqJFwyCFxat1Bz
         f4PGMdnj0rhS35ZTB1E70W091+uJlC/66l6GHj1X9LZnnRQO/2mCrEi688SqWO+hk+xs
         m6QSJrkuuRHBbRrWIKo62WHEOGTiIFN4NPFCfaQWuNEkGJ0Fqe/i3uKrOxxmBk+4zl15
         ibPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=aIKAVIQv038De7CjaCNhHMvRitF0toRWCdAR9rVfAyk=;
        b=je32NPRpwQyb+6D5P2FsrcfjCHBcnJQxgHval1CFNplBYdFYXYxEvOELrTIwkyY1kL
         3w9vl9iFyHN+gCQgBaWFhB9UXJDBsiHpEN/ZxtOXO2yTeC/x8nzj33cLoXWKXoJXm8oz
         T1z3Y+aSd6hKDE48RpJfKz2HvDJal70NT8xu1Us2dsyFlrtlpyvPThdsSsXF7DtkGm4F
         6x/S8SRKYEq2ctQuEvUJ/TXIU1u6kthx15NT+4EmolquTEBBNVFz9H25+2Y0BxX//ddr
         YSk+X1AtSPyAuw26YwPxSwV6zyc6w6AOKWYmV3Zf9Qde8YdvP19y/1evTcPxyS6piBnS
         Vj3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=umavx882;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::12d as permitted sender) smtp.mailfrom=kannan@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aIKAVIQv038De7CjaCNhHMvRitF0toRWCdAR9rVfAyk=;
        b=prLoJYZTVyWCKf0AUQkXK9kGkbs6nF8MUnWCUFUYproKaO63kEa/NVLWxWwbyYfNfB
         ZjbH7JW7KUjr+/EBZ7X9ITsH35D0I58pVVeaY2WXPqjnq6Iq5lbL2JuCPFDaTEApRQf5
         +bcsnm51E/ufJEk6tdVWexRzzQSBNY1GOX7YX0w6fuiyhBhYMf1w+CqD8DNEtkuAlQwg
         FtDNzbOqen2/IUTZ+JCXAd5P0ea3Q3ukKK1ng0naZ9iuYmGtoc3y7VCLNE9JXyktN5iu
         RPxwlyxeIoPHVHTWox0z4L24W8q4Bv+6gVdxBrKjcjNYIZLWJ8/LIdFDGkKpiMRNtkpK
         ib2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aIKAVIQv038De7CjaCNhHMvRitF0toRWCdAR9rVfAyk=;
        b=tFhxyKns9+nQng8pVxdkNC5M2twTWt07ojbqZZeHVnIalxwrmlY6yK4hvIUpmgafbr
         zgwgZAIQYWdJaTmspWK+Y0DHIsDEennd1G3GImKGt0bxr1rd88qPpdEIBaQlO5qoBV2R
         1fIUzZTCaweSK063AoU6IRQNRnJSG3cRm7S0FpYTdl2Jvqf8ltbzoh+dWKdl0JhfYdQg
         MQ61+pJMykUJ3VdcHskqPe84A/nd9bIIMeVGVRexLtObeNbRyEYAuPZr1WRUcH5EMjzS
         2fOKcdG7S/BoPKaFAsezWyUyn1fNNnkpmpwqwTQvuVbmELNhoWfGTXF2+Y1NV1aKqFUS
         Z1aQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530DpSCDA0QfVRiv1jqrUDILxW/yr5zo138yNXr9Xb16otFWK+dD
	gGSS+TJwsbdQYr6PSQ9w/+4=
X-Google-Smtp-Source: ABdhPJz46STgPJzjyC0tTqwSM8Q7vMJl7IkliwtkYLAm+pDBeWUmqQqTVO4pKIRhtb4O5dP0ndJNRA==
X-Received: by 2002:a05:620a:12f2:: with SMTP id f18mr2239164qkl.122.1622179349308;
        Thu, 27 May 2021 22:22:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:64c1:: with SMTP id y184ls3644322qkb.10.gmail; Thu, 27
 May 2021 22:22:28 -0700 (PDT)
X-Received: by 2002:a37:a683:: with SMTP id p125mr2173406qke.332.1622179348517;
        Thu, 27 May 2021 22:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622179348; cv=none;
        d=google.com; s=arc-20160816;
        b=YZoto9rXPT/szh/AYbxGB2hrnkaYj/VtueealGPTR5X1azFAb5arHpUW8ivJeUCA0Z
         4znUxPcitRTiB2c7DoA2cM640xWyeRMxToG1nvhvCTkwScY6x6YRG26+TeFQHbYAObIX
         +95f0XsSqXV6RvYXEaTHvM8Y0JHZLyIJi19i1qVfo+wXHi/+EmzqnH5w1S59vWlt3kZY
         kFyqlHNNvc4GUu180VnbdrqyF3GD1Gs8GppLkj30eO+VihAOUYx/r9p9rvNArIuIN9o/
         GOrpb5BbsFheFfxi3oL0aQ0gTBoA+oI4bRIN+oUwjP4MdZiTm75npmtuhy76Hjsogehd
         glqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cfF717Y/i86N4LZVK5+oOuasLLtdsuE63RrSxtaVCZQ=;
        b=SrNXhDHEvvPxUqsQloZxcxrfSkIRsdZJss8TMvF9m3MZKPIqmhqb0QKg7ehNQUtFV3
         MCBMQ4bklqwoLdEPoydp1I2RT/htOc21vRv4QQN8S0POYgIsg1aGDt8/XJ35iDxl/ESQ
         nA6RcDirIceMEHHh1z1tMxCU3NEJt2+dkAFVAmNknFQKt8pqwmo+Rr9FPvmo2T1n8wBt
         yYuD4EgATt1WN1Zi4I/iB9SMeYjliy/19ougOx1Ee94JkfpZPxgu66rRLLRylu08hrqo
         pNy/g9elz/UmM9BB5Tbu1Opwt5m6BSIPzgXh5FKU8aWsxMMhpMfsAmTZ18k6QxnmUkjs
         8d+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=umavx882;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::12d as permitted sender) smtp.mailfrom=kannan@cimware.in
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com. [2607:f8b0:4864:20::12d])
        by gmr-mx.google.com with ESMTPS id 15si379030qkd.7.2021.05.27.22.22.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 22:22:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::12d as permitted sender) client-ip=2607:f8b0:4864:20::12d;
Received: by mail-il1-x12d.google.com with SMTP id g11so2336276ilq.3
        for <jailhouse-dev@googlegroups.com>; Thu, 27 May 2021 22:22:27 -0700 (PDT)
X-Received: by 2002:a92:d48e:: with SMTP id p14mr5712598ilg.33.1622179346482;
 Thu, 27 May 2021 22:22:26 -0700 (PDT)
MIME-Version: 1.0
From: Kannan Sivaraman <kannan@cimware.in>
Date: Fri, 28 May 2021 10:52:16 +0530
Message-ID: <CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US=BygPkHMnPA@mail.gmail.com>
Subject: Error when building jailhouse on debian - arm64
To: jailhouse-dev@googlegroups.com
Cc: Kannan Sivaraman <kannan@cimware.in>
Content-Type: multipart/alternative; boundary="000000000000b5a03b05c35d0f00"
X-Original-Sender: kannan@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=umavx882;       spf=pass (google.com: domain of kannan@cimware.in
 designates 2607:f8b0:4864:20::12d as permitted sender) smtp.mailfrom=kannan@cimware.in
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

--000000000000b5a03b05c35d0f00
Content-Type: text/plain; charset="UTF-8"

Good morning,
I get the following error when building on Debian Linux - arm64 platform.

Can someone help with this?

make[5]: *** No rule to make target
'/home/parallels/jh/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb',
needed by '__build'.  Stop.
make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.build:549:
/home/parallels/jh/jailhouse/configs] Error 2
make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568:
_module_/home/parallels/jh/jailhouse] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:8: all] Error 2
make: *** [Makefile:40: modules] Error 2

thanks,

Kannan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US%3DBygPkHMnPA%40mail.gmail.com.

--000000000000b5a03b05c35d0f00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Good morning,</div><div>I get the following error whe=
n building on Debian Linux - arm64 platform.</div><div><br></div><div>Can s=
omeone help with this?<br></div><div><br></div><div><pre class=3D"gmail-aLF=
-aPX-K0-aPE">make[5]: *** No rule to make target &#39;/home/parallels/jh/ja=
ilhouse/configs/arm64/dts/inmate-amd-seattle.dtb&#39;, needed by &#39;__bui=
ld&#39;.  Stop.
make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.buil=
d:549: /home/parallels/jh/jailhouse/configs] Error 2
make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568: _modul=
e_/home/parallels/jh/jailhouse] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:8: all] Error 2
make: *** [Makefile:40: modules] Error 2
<br><br></pre><pre class=3D"gmail-aLF-aPX-K0-aPE">thanks,<br></pre><pre cla=
ss=3D"gmail-aLF-aPX-K0-aPE">Kannan<br></pre></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US%3DBygPkHM=
nPA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US%=
3DBygPkHMnPA%40mail.gmail.com</a>.<br />

--000000000000b5a03b05c35d0f00--
