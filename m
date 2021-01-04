Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CA2E9891
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:07 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id a19sf17301770lfd.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774207; cv=pass;
        d=google.com; s=arc-20160816;
        b=ujMOgf0oISBTjysSubZX8yokUdKXCCNztfVu+iv3zT2n+dvu8AHBaHGcR/TS1Oz+p4
         RqmqcJb6mWdq6NqReEIrkOzmfVfsJhv0alSTXDSaw4meTK2BPkbvqutqFF81eSEaNV72
         /Sa5G5pfShAPBTeR2QUBiSwv16/vbPbuvnKzSrHVdBmFO5IoAg89/p9xSflA0OU9qrY7
         CKOYcid6Y79WRxmkjtxh21r4qN1KGoZCPH8PmxVYNcA3JLeJAreN0NMILwABIE4QgeDf
         0NWLvu3g0CKhv/JD9MEqKapb8esgLzw0M9G8W88vJscc/WeIEuNgzlrApARDq59Qfj+2
         S+/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=UbhJNK28y2yRzwsjxXGIJa31EMnlP1hHKUmSCGhb4I8=;
        b=N3dt0G9clFYNxQzRKZbhfUtIaaok9J58Sr1UcHuTuBqW2a6m0aS2agYCWQjBdwSbXs
         ncylAVFmXN7VhqzXijdeQmJdRoeq0vNSPO/rF0xlrCaRPuDuHbuOk8x4RiQc5bOYQwUm
         Un3prj0GV1RjfrWS62EZvboqj0bypQ4TeHzQRC6QXcOaZbsdyox/4J+rnJneYXxOTn2/
         hFi0t+9s29llx/8GHGX6XK5OedUpw2hH7mmGWVREXMc4cC/Jp+ExfGqZdNSggkpA6gqA
         LEIK6xDNsJPNAQFHPsCmBAdIi/S5vrnQ0QmyW+k7eB9vSFVmi37+anCK1jnSNSKXIeFc
         Bn1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qGT4mh3p;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UbhJNK28y2yRzwsjxXGIJa31EMnlP1hHKUmSCGhb4I8=;
        b=ibG5tlRFzKLBVoQB0QAemcWVGQkQ6eFZuEWaLLXZmGImcMXL1CWc/IaGz3+5xJk/Ty
         xLO5uQYwGPJoKFSClRB8+cCMIijjqMgLUBfnPRTNSB3ohzj+rgsZ8auEOtjjEDxoUzUi
         dPAg4gaAnUlbOrNmI4MtGyjxDffOC4n2W6DyyjRqhWfOS7qweYVu45mLrj7HZ7UuI1kH
         gRyv4AshGLfWESEKgcRlkdXhnNWIqlo1PBHNTMCYslsT3xZGoKWwzpatatZwONd152cu
         e8qCQc0bReJdvB4VlnJb1qBc8V/G4A7FSxLGPGp8KqbVsrH6E7b3EJimXALMMDvE7fGp
         R3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UbhJNK28y2yRzwsjxXGIJa31EMnlP1hHKUmSCGhb4I8=;
        b=OZyi+t+ROffJYRWmnFSIZmxvJJuWMfdC6jb0cgC7ZYt57PBsZ5YwtyTSTj3zRdiodP
         r3/zsrLDIHUvKSFSWQvR34/x+G2hVgFw49ybPptydJKRAOdsvX94UAi+OardYZuROYZK
         Go+PrSSLFxYkm99l8rdfdG2P+rE0zXTynIpBPVNFu0RgiK+gYGAupRGTI6NMt8pcpxgc
         HbzVCrR69MHd028kTwM29D40UouLGtqby6L87WTb2lINcyUt2bsnINidlEynVMt1sJvs
         RmeNnXr8k/374CGLPojQiKe45iovCvGxMngTRPqGe/LKQGz2/Y4PtPqBhvWIXlawEA2R
         Samg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LK/ZPKAVSoFjmX48NxGQQwTx2Ku0cbcAKz0gNVgtB8YeiryFb
	9Jqw5CwXzlybcqDk+p2gK0g=
X-Google-Smtp-Source: ABdhPJxwuSkRqY6r0eRg/c7O834zmnSv/LY2Dcm70O2XBVcwQIcX7syEeWHB1bxu5JfxRUxcWEE4Rw==
X-Received: by 2002:a2e:2417:: with SMTP id k23mr35248397ljk.373.1609774207558;
        Mon, 04 Jan 2021 07:30:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10d4:: with SMTP id k20ls5454273lfg.3.gmail; Mon,
 04 Jan 2021 07:30:06 -0800 (PST)
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr31084179lfq.585.1609774205921;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=nQNSGdRv3GFbJ7Os9LmnQxtyWPeqCBXyHGZ/unzL5Lvf7YktLcSN6/RQr+obJGh/8Q
         QEKjXUTUgQt+uenlwpPA3Ldv/x/tV0Zc0NclZNPsjK8mErJ+KmPzV8vZDQBdZVU854Zl
         ruG1cogbrqx9WBhNecf1w1A0DnvUf7zlxhY4OE9GL+ouA366VkMe6ktWk0R8uyweL1GR
         W23My7VweRODNJ97ILbFg9sD5R3XojVwO4fLzpNtfWopPG+Li7XJT/HIuUno75hdr7eE
         RvqlXlh1GHOnv/Z7kz53Yw/o7N8Da69BD6E5ympmBqXsb3bNenS00vdxpZ9Fnq2LwjWE
         2D4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=IcDcjSjl4hyQPABp13riA0GmtuTitLVAGGwFNLGv6pM=;
        b=oHPG5qhghph49+I8sGAmruHG4V3WgL5ODZxSSW2jTXrZQ1iRgbPd36fGFMDGEK74fL
         gZc1XMlDfQAKcfe3Q0qEAk2GeA9Co24fUh5VRbBm8pkkgIO9pGxy/Jz4XqcTJrHdsrTJ
         j7ZA8OKuoeNcMAqwr+FpCMVXDq7LbElj4nQEtnDKgWOy6EDv2xxMbF+X6T82FiXO5HKg
         YTYmVkyeGzhtmY4kaX8aSQYGbf8RP93WUtTyDWWNGY6YR8jxhMF0bfCO+eY7QLZDmdrQ
         EbeEhAauOEK6ReYl67/mkqyIpdt0syaYn5uP56Q4/2s1Kr3bnuUyGN3s2bZTQ8dBOR1d
         Ugzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qGT4mh3p;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id a136si696816lfd.5.2021.01.04.07.30.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MZSBQ-1kSDKV0rdm-00WdYo for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:05 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 6/9] arm-common: Account for SMCCC versions > 1.1
Date: Mon,  4 Jan 2021 16:29:56 +0100
Message-Id: <5c5cde20c9a855224aef052d9ad34a60fb98bcea.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:r7SvkL3513qERWvKwbSaIMTQBwzVA5oai29n20GoSk3H8jg87X7
 fMe0IjHOJ2QH69K6Py4ptTP1UPB8pd2SzhMPuS9NI0p1TuPEEg3texYtbfsNjx9z0wSO5kw
 FEoSrOgIIQ80mkhGXG83EcR88BLGjOjoxykOnxg1QkK4O2FIeLKGZ9KHC6/7J7mVetF9+0t
 DUiUfxwf0dXIGobLDuNDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:v3I/y7y1xoI=:OHP5QnVQXg6gE9jk/24LhS
 aQ1RhXKyysIvj1qqLnQ1mh1yDVNtRWye3oN1sfjy5Gq0eCrXLpeQmNZY5rewOJD4AWNrkyypK
 yZ55SCT+KeFY9yn3sAvnICSwyOFz5657mJxH4VpXWvnBhbpl7FHBNi3YBMc9XYyrlge4RXrUC
 8tKbJiACMTetsqDCQ0BBZN453iL+feh1gM21JI77LWCXi6RvH6/rVNxf8q4kVokWMq0zmVg9l
 ZVa5kI9XzET3qijrMpz0HijVYT4seE3U11jsFeqPIqVCRqGNu7eHQv2nYxYmgnG106AV9CsOP
 zmPCjm4PsZAN0RBPXIke/QVSCIeGpqcP8SbYyStWTjhOeImSHQijn4U2pVkM0o1wSBaBPS9iv
 kupghbaDHmChC2OOdMXT/yQiDjfCxK9zUTCnG465I0ZmFBlcHuz0eQpnW7DCWSde3tvCcUhXq
 fgcBFLT8WwPa4RpJrihTBm2F0DlqvXabNotIG0kxwXidjAGl/etyhRvDDEO6CIK76zmYyKA4C
 zgSPq55px3KWdte7hTAC8YAH8Zinlfogm1F00khvFZRO2ZmWqDHZattAhop/taUc0AnVisw9W
 YxPwO7JR5YD6HcYRYuNJ6Cl1PEEAvmvppKlV/z2x4Sgi8aL5Y3+IAOSMNlergJW09QC7/tA/S
 C7nQplZh68o4HX0rtYQfzWyFGWsXWfjnVl/GBgi34vI2tFtWuQ+M1cokndQbVPvEl4IEJeZMk
 E2gVxnIfRYSaWuVMyJ4aOrYo4TP7bPZJrBgJZb5lawAosbUKG2mrswIrI205RFmrO6Ikns6ap
 RdsKp1l/LqE3tCHsD3FnEf8dpUz4FTIzM0fd8AKDqKboDSvryH0YMBPDDdK/9ssiiSNyXZa4j
 Dy4OP6dkghBNEav82p1g==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qGT4mh3p;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

We must not limit support to 1.1 exactly. Anything newer is fine as
well. Required since TF-A 2.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/smccc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 7734b999..bdbb067e 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -33,9 +33,9 @@ void smccc_discover(void)
 	if (ret != ARM_SMCCC_SUCCESS)
 		return;

-	/* We need to have SMCCC v1.1 */
+	/* We need to have at least SMCCC v1.1 */
 	ret = smc(SMCCC_VERSION);
-	if (ret != ARM_SMCCC_VERSION_1_1)
+	if (ret < ARM_SMCCC_VERSION_1_1)
 		return;

 	/* check if SMCCC_ARCH_FEATURES is actually available */
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5c5cde20c9a855224aef052d9ad34a60fb98bcea.1609774199.git.jan.kiszka%40web.de.
