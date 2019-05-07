Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZNPYTTAKGQEQNAY6XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id F07B4158F2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 07:30:13 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id x1sf12279345wrd.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 22:30:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557207013; cv=pass;
        d=google.com; s=arc-20160816;
        b=T99NeWR9fdkqRt280dK7dkClakiLFZsRAoylTHOsQNjtbfoS6r6KCwndy1at82rSAG
         IpCDV5IMQvYdF4386EAmfs3VpqCrHYgvqgkrFSvt4nqYRwS+LaSjgqsGOEI3HDMMk4ag
         ou9pcbmkceXBmAwLhMU9mYeeVVaagjMDdUSLxw/w6gFtdyhPlhAE/nDaAWIzK3u88N8s
         SsxN1E2QbsVaMpXJ4l2Diqy3nxIEPcf8ATX65nAnKQkKv2In6x4r/nHD39Syf5fGwhE0
         DaR5CqyD9cWiv9ocQGZHYBkV3JUwi8IorQVBdkiTKKHWy5KhDwx0MU72Yt0XZ4nwZFrj
         de/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:cc:to:sender:dkim-signature;
        bh=DkK9cmwr8DPqrWxv4h/qJ9YLf8q4btQ9TWEsIT8o4t8=;
        b=sJ/lqMjuF8EKRlk4IGxOJfudbWpQHabzyuh+/hDAUDgzL+/BkqWTKaF35IwcrgbP2B
         SAph+h2BTG8KOx4YJWuC9ODuAliZ7OIPxmZ+EFpbs3GIQ4Xt4vWMIo8kVyC4dG8+jOtV
         qmU+CP1soAwOrcl0/pxO/AsOuGdg3NoQS3iWiGDS18IP3PsNrCXIIfIrE7IkJr4u5VxS
         aGonfl6rQr0DwjopxwoTcf5uXYRvjFjGJ2kOR8q9otX3LKZ21PHnn2BXj+MExjSLW92S
         cUIQ/JYJledtGqTPODGYtU1o7qX7EyK1O0/O0bLKPnzuJqOgTLtoyzdnY4v3VJARjwoh
         GIzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DkK9cmwr8DPqrWxv4h/qJ9YLf8q4btQ9TWEsIT8o4t8=;
        b=ivwsevUAUReuTRD55/YY0nw3ha1kXS0Nti4sEho50mztQLGpj0OQb7uikDnkTYJJwr
         tQ7OF/vguZy25WHbwooCJXGQQ1WsW5QcKH0I9gFko+0sdN1Pfd7ozn0lp+WB35HvKsTq
         n6k38jdLjIbwy8yQbCQ6u9UViL9vTofc9ZQR1HyXj9UXRz1s+BBkAkuSyW9Oo5WMpGyr
         LF85NnZz940+Z4Z/XcwUAhfTr2ZZu8QdRLRUR1jdy5W9It2upTtBIfFTBlyQXuOu0T07
         DipAxZBne4SQ+7I7+3W/8EVrtlmDwqPNXrcDae8kU6DWAQLkIXkC5Tk4tVjsQEgzxRyE
         6pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DkK9cmwr8DPqrWxv4h/qJ9YLf8q4btQ9TWEsIT8o4t8=;
        b=uKFkdmF2TgogXKWFxausplXmP3OTgPXYq2s8veYdh67ogomPmrLR/DbljjxaS5uyJV
         +Guc2P1ML+vfWu67ngKGDwmvRXC4NhogVqPAz1e4NOrH+ZzYeYr1NGPbkOWke1qy4cfM
         b+YFM8AlIAP85GWbh5kgGEC79m5cEJijYhc1MNkDdgMMT2YJN6UkUideRbDpOhETgDYh
         MPwhrflKBJm5fMRfugt9ASZD12BfMohWptMeIyNWMtd0vtFmPJb3I6ZZYVQzvB0HtdbJ
         vRGAQVUuQ09Y1REdXPkvNjXlufv+kWlOlvOzJPV1YKybeyrlwzzhRj72r4l/BKR3u76O
         fSXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLV3TyvlfKzakwJmdg7rwkyVc85/XxzE2AcH76ykfbGxhQq/O/
	tLoupPwpwzZmJBeDm2o38Vk=
X-Google-Smtp-Source: APXvYqxh9k9+OSYx4RWB17ojMPF0WhwvyfjbJYoDe4QwQtSaa5Num09i99pX0+xC/fdVrGih9ZE3uA==
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr4501122wrv.224.1557207013678;
        Mon, 06 May 2019 22:30:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f306:: with SMTP id i6ls3595288wro.3.gmail; Mon, 06 May
 2019 22:30:12 -0700 (PDT)
X-Received: by 2002:adf:8184:: with SMTP id 4mr7634956wra.27.1557207012920;
        Mon, 06 May 2019 22:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557207012; cv=none;
        d=google.com; s=arc-20160816;
        b=Zg3Ji9iPJr6DQjAFZknqawvixYsbZit2Onjky27BXQmIgaY+ryVeokSnJr2ZzYL6GW
         B+O8c3U9iThnBDJQgULZPSknIpN3LV9W6nov49WnhuCP53ZVaaRY1SUOw5Vw6fZI+a+I
         v540qong3bqMWe79A/IFJEX9Mjiu20hFm1VkPLjZwn/AsYYwywa3qeerg2i//tB49LnT
         nz44L7R0IDQVJ/c1SDdz929Q5dlzdhqvFGHm6brPPZhdnnDnC6JRXZ80ENRoAcCg1dyU
         rP7rnQJekzPmYEJIqxR1koqS/UivMOOZVx+ej8w+T8A2PKIvZhbcq7BOAqlnqyGa3TDK
         qSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=pvPHf30XUEFle2Y/9+NWm66rpO9dumYY+YTVs650Xig=;
        b=hKDLvCToKw1aOXgnFCeXgIVVp6titzwx/9x1oEzI5alr0tv6gqcuILlhCdhfRMTgoD
         qexvrOtCrL8ZkSpO4eGcDO9P/zkofkid+6Nd4jUz9S27oSexIB90LdNE+mhvMfj4vqPK
         zCF6lS8zQ7mFNBgJQiqC4K+SwPtfmIMAE5MDr0qSxKiO07GPSb4PmRcna4yRrfZcHoft
         ivyX3dKWdWcKol5Hdz6oLlyy4I/KgF0uKD2C84hmeQpOKigy32brmug6jtjG9Fubu+cX
         ZXJB81UxE85My6o9PhU8bIk2PLkn132EYWOYFlcDq7kf+REO2YT8OiRuN6FrQM2XbSzE
         n5MQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x18si503298wmh.2.2019.05.06.22.30.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 22:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x475UCg0028440
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 07:30:12 +0200
Received: from [139.22.37.57] ([139.22.37.57])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x475UB9O019481;
	Tue, 7 May 2019 07:30:12 +0200
X-Mozilla-News-Host: news://kiszka.org:119
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] kbuild: Set our own KBUILD_AFLAGS for hypervisor and inmates
Message-ID: <78816390-dfa9-6294-defc-e1f245c3c52e@siemens.com>
Date: Tue, 7 May 2019 07:30:11 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

So far we relied on the kernel for providing us with a usable
KBUILD_AFLAGS. We only filtered out the enforced asm/unified.h
inclusion. But this is wrong, and it breaks on ARM with Thumb-2 mode
enabled. We should actually define our own, stable KBUILD_AFLAGS.

Reported-by: Arvid Ros=C3=A9n <arvid@softube.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/Makefile          | 1 +
 hypervisor/arch/arm/Kbuild   | 2 --
 inmates/Makefile             | 1 +
 inmates/lib/arm/Makefile.lib | 2 --
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index bc988441..893ead42 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -23,6 +23,7 @@ LINUXINCLUDE :=3D -I$(src)/arch/$(SRCARCH)/include \
 		-I$(src)/include \
 		-I$(src)/../include/arch/$(SRCARCH) \
 		-I$(src)/../include
+KBUILD_AFLAGS :=3D -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS :=3D -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -fno-strict-aliasing -fno-pic -fno-common \
diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
index 53039d21..15a318df 100644
--- a/hypervisor/arch/arm/Kbuild
+++ b/hypervisor/arch/arm/Kbuild
@@ -12,8 +12,6 @@
=20
 include $(src)/../arm-common/Kbuild
=20
-KBUILD_AFLAGS :=3D $(subst -include asm/unified.h,,$(KBUILD_AFLAGS))
-
 always :=3D lib.a
=20
 # units initialization order as defined by linking order:
diff --git a/inmates/Makefile b/inmates/Makefile
index d9fa9e57..18a94853 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -25,6 +25,7 @@ INCLUDES +=3D -I$(src)/../hypervisor/arch/arm-common/incl=
ude
 endif
=20
 LINUXINCLUDE  :=3D $(INCLUDES)
+KBUILD_AFLAGS :=3D -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS :=3D -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
index 3c95be19..0976f894 100644
--- a/inmates/lib/arm/Makefile.lib
+++ b/inmates/lib/arm/Makefile.lib
@@ -40,8 +40,6 @@
=20
 -include $(GEN_CONFIG_MK)
=20
-KBUILD_AFLAGS :=3D $(filter-out -include asm/unified.h,$(KBUILD_AFLAGS))
-
 LINUXINCLUDE +=3D -I$(INMATES_LIB)/include
 LINUXINCLUDE +=3D -I$(INMATES_LIB)/../arm-common/include
=20
--=20
2.16.4

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/78816390-dfa9-6294-defc-e1f245c3c52e%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
