Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLUKXLYQKGQEJJDZBMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BD149F07
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:37:35 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id cq10sf3252332edb.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 22:37:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580107055; cv=pass;
        d=google.com; s=arc-20160816;
        b=VD7SrLDR3wLLEdMSn4XEp4pajKzunGGwWPt5CLGyqyRcfju2kncRihzWwa+AvINM6F
         +iDC9vDx4ENlG6ddjZcmO31uQlk1Bimer91t4pEEMXTB6jNzxBtjnQhbY3QixpyjMv3h
         zyr7TkCo50KSwEl7t69aUw1CEkrQ994b5WL0VMKmFr0rmAvebhBMAzuzYcXRMxgUmZDu
         Zk2c9uBBJ+1xX1hqqfjoEWcYjlfpLfH8qI8IG6YS9cKQ7Pw8JDdcdeZnl3GWsZu+OGpX
         8kRIbbYLuIFtOWZj23NHyk1dm6pMHujgfWIqWYuLngzC1OdPOrDgQkRuLrxk8GT+QwZ3
         1O5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=eTnn350VSIzHq7wWDHTAO+/PPSxjJ/NtGNVSGk3/ZSE=;
        b=PdvaSi+qbHS1uLDEJhdMyosFYEv58wzo3v8UGbinVtfi+CGwDpI6UY0PW6B11FNBr9
         dj9kapXZHyMWQ2nN3rn/v4jYJqrXhv1j64H+xPC37soDGsDDKmFP0Kn9rlIT/izd6FI5
         GWuHo2Q80iO5YT2YTpSF5DydPXs9JKw6cQKeXgQPYSpaKDUg0lqk/ua6EDxp9tYP0r1n
         cma/UU/HczJkhWNdnoqDsAF1wzHQzyvHh6JrJ+gJK2ryKfjojvVSoLimUqL5aPsC8feD
         oMz0vj0LQCCRhqEA/lB5AAjtdvvvQKyo0z8zTDCIWuhipj19BKUj2EWx0lDLBbykJQ/y
         gvCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="IKRWcdu/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eTnn350VSIzHq7wWDHTAO+/PPSxjJ/NtGNVSGk3/ZSE=;
        b=IiGr80Xfw1bbHBgAL9SsDxJDMoneZ5a99HZnbG9R+tHy/egqMd5fZe78vzc48+aUym
         Gar8JrXxvbW35d0Mn29A12PcJRFCJmiztCxcMtVmN7sSvfT7qhLdcxOA/cDzNjsbAYlI
         DgzkvMA8C5GzZLm1QpZsMbypxyO6fRYVDDilEwu9Y2jaQXszhVIXlXrDIyAHzhRuhiAI
         kbTxHVidwNKoEQ126N7OENglvQ2mHsyg4LumEw5gwtmLYqjD4nLJUqvkiF/eMhqTByzo
         I3kF6cUTgeZ1OgZi+vL43qSHOt2GX369hBhxC9/aeyDRwBXw4q3+11XETr0tWsXwDmpQ
         c/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eTnn350VSIzHq7wWDHTAO+/PPSxjJ/NtGNVSGk3/ZSE=;
        b=ElZhF6OtlXCfnPOiadGEOWVRFbhlfXsT1VWR2ZJEAclHbKCZWaPsoJ5lqhUkpSY29R
         qyaA7pmOpExqDnwVBU81V4oy3EgoF17vMO7xGD0piMUUPFZrg3K2nS2aUfAziTfVAGRt
         x7DtBnpIIYw1GaMC68ylVLn8mawbog8/r6/0WW9LN2AGP1PeDToBXYh/kUwO4IF5Qk/m
         W9UpeZ7h36wuksNEGbERCz+uWbTS5AWCQ+G7xfq6MhRm5gcW/n1Vg4yn3liD3SQ7mTjz
         C3ytzJGRqsJHm5tlJ6hbeCdyyldWwcuVrgHtWtEcgbkrlKOQToh5lzdMzD/BsrfLiQtS
         PJhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXyhIs+wpZVP/0DY9B9bT/X1jfft1dwR6O9MwLoekG6X93oHicw
	Sy1sXqClvDMIdD80iSb+buI=
X-Google-Smtp-Source: APXvYqzYPNzS6P+sWAS/Cq42gQEKblIpfT6mJoPH/RTaDmxFz9PAlldPyRi73QqbZ1qY+1yw9X037w==
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr11977657edx.157.1580107054994;
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fd15:: with SMTP id i21ls2186434eds.9.gmail; Sun, 26 Jan
 2020 22:37:34 -0800 (PST)
X-Received: by 2002:aa7:c591:: with SMTP id g17mr12557285edq.341.1580107054183;
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580107054; cv=none;
        d=google.com; s=arc-20160816;
        b=xd4YpVezth7iUqODSsByyRutuQ/veeE76VFLl4SBkk9VCZXa08IgnkkftLxX7ylZRJ
         v7yvKBmvu2goMcPIdyR9dkUZ2bWLy2tiWBGNXA1yw8uRZOex7txlbsQK8j6SDp31mhZ/
         37kWg1x3G3c6iVpe6gw9aDgO22VOzMeTojolmgZ4vfTvmGJOnZh239Fwyg9XAt+32DO0
         0NMKrelsdfv8QtIrHWkSWGFifl9+qfqo2ILHSkZvMfDomfaHtrKR/oAQngyLow5+leo1
         OLfeGH6VRNLfVcitFaF1sn8tR1Nn5KgH0rUVg46uPqSEwb7M0rY7ftM2cpK915kUJU1X
         0Dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SE341Wg+tZW8bsGcbLvaaChfreB+ozfoGbUZcp9w5IY=;
        b=G44iMy5Vt0ATaesfe9qjf67kyy9G0pRMiX7JpQMPVfGYOwI+nMxu71myCnLUiQ/7/U
         9AdvFz/9F/51AZnM1PdxhyOXmAImcUdhmRVmdr/H+XhgWk62OoBfNwqlmgMtdWEixt5F
         mpBI105MsURJuFyjncGXFNsu3710OUAEL1Nxb6X/aOJs+OYveJTURD5jpk6jse9vatwp
         cVAiO+2FSy5wllr9u3fVlPlzVPXGygu5xGO5HGABStT3uPs5srGCbo0j8MORl3DxZdcW
         FesoPwKOSxZB/R22Xlow78l6W3u9UyaNaDgHONUyjgB2TU858+wuCKhAkeWRPTq2rdSW
         8Rvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="IKRWcdu/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id ba12si538964edb.3.2020.01.26.22.37.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MVLWc-1j5RYZ2nFe-00YhID; Mon, 27 Jan 2020 07:37:33 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
Date: Mon, 27 Jan 2020 07:37:25 +0100
Message-Id: <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580107046.git.jan.kiszka@web.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580107046.git.jan.kiszka@web.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:+vayE2F6XHoFzncE5wtfe19TDI+HdqXOZx/JbgZ+X7xnLk3C4zc
 pilrJW/q6+09Mcx3LbQID+u4RKYTrgprCHt1Z7CvskAXLJRfqi0aCzF/mjPcRDYkc4VetEz
 c8CGcnKXlX6Z0d0C+YcFIleDrVhT5atwCaYta4PESD7fpD3Pw1DyXopx7mdImL/kLmg6CY9
 tIH2K7acTHw3jg3ukAfLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q4DCHNxeLas=:R0aCkuHaBbnIjT3eKypmFF
 HsNc17P45v7QIj2wM7UZA0kcIpUgLm+d9Ygf631MxCC1SOBn4i0pjw48L4QeUzOuU7bOIITjU
 H1DLYhOk0L0DlbTv3Usagcy9+PTRHLAtdolsULCDo6pnASxhMV0m5Zd3rhf+Kt2IMu0Wn65Uk
 3CyrmIcpU5uGAZYVMoPedYUYudCn8Stafr3pB9rLbPeNi52l0Sk70GIguiopvhmT7q0Q2dU9Z
 2kokhsl1C53vwMYmhy7LcUwqT7IfVDn+YHxmLPDulqiIuWhTQOa+G7dlLndahVE6FiB3XgAzD
 UMUeHiTPnJLJB2whzbgVHhG/f8YY4UVqTMuM7qOVG7jyjFCXv7JHiRSQENmF4nmUT0oRNs4Ys
 vugb8QJ+RVGO/I+SUJEdvz6AO27GBTonxjfOX+wb/OwYNLKkbNqbZ+50u2neOCDSRY7MbIQXB
 sZzgS0sJb19Mg85VXOBxvBB9quXMCXC67vMGCwXBapudcVNFBeV3Jc44lj/5/D9qyXqhthwyI
 PasE1pbYfXvBKdMTL7FTumKIFiVG9GFx3HnjbbhBk0Zj7yR1IR5kPii+95kodTeklridbMN78
 90wPW1eYUANs/eqmmSv3Jv4AJnqDLLJ/VzooQlo1HZCelEeIMjcw3HNvrVuIeZHy9zlmzQCdg
 BWtrPpOSaq2cs9KjHjXnOcHyzRzbzQkFWSfFBZzyGtrBmPAgmMoKlcXH0ZD5ieJtFGUq9SMFY
 Ky8aFrqxLNuIVoG1nHwl7tWBuVmBOaYrkdvbYo7JYvb83zEL0ZArPAGx4S+BSt/iGPRMqjJ1+
 2zrSDIE5czgzt5vzX7SJsO+IY0rNMm57pIv5jzEHmx8x9D/seHAzv1Gxup67o3DcOi4rqhGTT
 wpSozHlgMZEYmVuqcmlz5P5IGCwa0xkVGAZz9FFSTlLVehkFWMGOT36TQLP5T2qmP5Jb5jqZH
 0i3fRqzC/khPwt0xLlG3frZqPwPf4BnVM0Qe+5zMIk0Lkj20NTtRo0yMl0asLXby6TA6XpWyg
 YwMEviXNLoeWwIUgE9aY0G/NnHhsEpkYZDpdp8joumOsxiOfTR5/P0x3zZ/7kwe+akrWu5Nft
 OvfdcaSAPCOSu+tNb/2J/gjzKZtuWl+Ach+ph6NkErE/X6n8DECORbr9746ORk50GGv2xdaMK
 6nXPKA4mtgH8UVoL1JypDq/A9yXoNVbGU+GcRLREwZawSUSDFR6o9ULhcFf455syVtEZ6c+rS
 H2RLe+PpmNUl5O12d
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="IKRWcdu/";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Better pad than rely on both sides using the same compiler logic.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
index 83cec97b..aeab2816 100644
--- a/include/arch/arm-common/asm/jailhouse_hypercall.h
+++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
@@ -38,6 +38,7 @@

 #define COMM_REGION_COMMON_PLATFORM_INFO	\
 	__u8 gic_version;			\
+	__u8 padding[7];			\
 	__u64 gicd_base;			\
 	__u64 gicc_base;			\
 	__u64 gicr_base;			\
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka%40web.de.
