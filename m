Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIEVRP6QKGQEQJJQAZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E372A67D2
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Nov 2020 16:37:05 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id p6sf7273273ljj.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Nov 2020 07:37:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604504225; cv=pass;
        d=google.com; s=arc-20160816;
        b=FoI+k77AnzT4Pxnso333QX3HiPA1d2TlX8NXnA8X/SwMurBHevYeknSXNgAbdqFSV7
         I1QGl9vb2un76z/w9liNFFXc+RUqgYq2HrsL3X7ZObl2iyA/riG6AFkzUGqqX1Trmb3I
         d+sqiY8Q0+IOQ3lslmmMLozUjOgbX0XMTXtj1H/6Qje3ycgEimrE0AN+MVIUT/QfHXsF
         tCX8h83odzZULRDO74PyRxKLpHV9zB3Cl4QHGLmCR6WcYg2BTz9QqQoIfhXYugKBoSp2
         +AbaTCiAAIyZFVCSkR165zXWRDMDI+hE7I1UF5rfarjFldimjVBQhhEBZSmmkkw1ZFIJ
         sHEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UkLETpOmyap4Uv19dDVWtNzeROW0QK9brWvXxuSyDNM=;
        b=v+wjk3QEps8mGsnxI7JCpqKUelv4+ecJyS4GQw6ckJMl6byw1pGg3r4nVcqHPcMk3S
         ecqeCZv20z9nZFqII0BQdiWA6oNRi311kWbpNUgUSQeZ2Z2UK12DIlq9K+b+cOYzdrf2
         UiPw/sKr/UKeQ3qWnQ8QfqpNLgt3BIlklj5RveAKAHfEkuebg4RymtxED24E3qdbnEUg
         XPZCUUqHeYGh1H6xCBdnk9Kt04IIFG9tZDfEmFxyQ3FpSwppDOjwT7gh/EafNzdRaHPq
         yZ6USipQlGvqSnxwIieYwXBqaQrMxadmgGnoN1GrPSl0v7nSAC7x+5iYccfYT+077euN
         fP9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=AZDPoyon;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UkLETpOmyap4Uv19dDVWtNzeROW0QK9brWvXxuSyDNM=;
        b=nETNMmaPCXGfjWmSB1vHkVdaLeQiGdiv4CfEmavnd1i0O4RqE453vMnwU6xjMeSTGF
         fhD7eyN18bPbM2ZDV5iac5JmI5XyondAEPspYTCBw7zb8/uOkru2LZ+nvlNmhI3YmEsl
         ZrUrnKVPsZjY8dpzfaxK2eUkB9aWf3oVxqFzG5S0u/PPnUlJqmG8TMO5zDp1TJwFHZeX
         xxE43hEqf8caOo9FKtG1AXiEDMC3ewMYVJXTH3Q0epx6/qJ3TdGTRLh1AVOmLtf0l4nO
         GwiVKQ0iowwIcReqmoAYUOFqmuHXlE9w9nw0YrypOVCU+hJ9euxWFXWL5Nc+j3pzF4U1
         IvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UkLETpOmyap4Uv19dDVWtNzeROW0QK9brWvXxuSyDNM=;
        b=Kp/JhJCPqFq26TpKa9JQ9Q/9kpdQY/eRLYXqVJZVDumiKv/K5X8daLudzCh54+Gb5D
         IrbVhKs5zAARNEgN9yk9aWSXHncNaCscHVV4tftqIhVGSrJfcjI+G7PxancxM0E649nB
         7t4t/7FQVljgaspIPi2EyJN2dm23RMpEsJnBoZdulc1shMN9mArBVWnqVpD/ZzJgqoqh
         Cbk1zUg3HStp9gqLgWsNhaXQRykUKiO3qngs2cf6ZQv2ti+Eok8QNacze/XKpkC1z7Jx
         Pz2HLzOINsSexk7Gd7PkEZAnmRUgANhkemNQawRbnGsNhWt/QjvuWBp7VJYqMX3v6g41
         RZSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532bXPEq83soMJovDt4Z638Vtuk/5426l7XpNcoX4a/yMBsSVBno
	V/13Pl5txFtBxx4vUdQ6fV0=
X-Google-Smtp-Source: ABdhPJztihoLv5G//c9Ul2dZZ5yasKOwM6A4CK+CyDd+Xd/nk7zPApF46h+dPFDhbHrpXY71rbq6Ug==
X-Received: by 2002:ac2:5cb2:: with SMTP id e18mr9268491lfq.155.1604504225087;
        Wed, 04 Nov 2020 07:37:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c15:: with SMTP id x21ls474934ljc.8.gmail; Wed, 04 Nov
 2020 07:37:03 -0800 (PST)
X-Received: by 2002:a2e:7211:: with SMTP id n17mr11165227ljc.452.1604504223883;
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604504223; cv=none;
        d=google.com; s=arc-20160816;
        b=alAwjj2Yn9gBWPs/bTMuBMLZIh5H80wFGP1H1AM6GYAIsTjfPm2qWNXnPisa5udzul
         HEZmEV83J/PZoDukaXwisjx/A0/J8n1Wl0KpOKyfvP5vuZnYORQw0p/Yi8UG1FpqyEBv
         1oXxhtzWFYOjK4O/ERTIqVTGBzIph3zLYxPmk1wkq+HQLZz9T3dWPRRjmQEKDgqM0LOx
         tIJhN6jtn4zNsRL2Ky3OZt2zi+a/m6XeAqNdtR5Aud7gQvYwW+r2c8UsAmxFSbdj5KoR
         udcYbbHC3JKfdUklsF096HMilgrkLp9CJkMUaqtBHP8ynB6rCgeJY3QP0n9DytSbVzo5
         mK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+n3GUCzBqEmx8f7DZxJzkcgsJtQNV9ZZV8rPKI2CStU=;
        b=Hz9o39jL0FALPUMQ/QivStP51H4HKFgQMxVaFEDwpZbn/wXnoSDb7X+yrarGmJVStm
         VQXBD6Hy+kEjgN9RaQd3df3/oxagbsJ/cPLuq3+US44zOJCTA85W05qX2bZUrFcVNetn
         FjOjoFsNGVhRV0pCBvUTeetl+2VeGK5VTFkZre/vby8UsWQ5Yzp4k33jcZweWOhvbP4+
         dAG9+XJ2n1anV5QBa8QXR4XKuoC2VDR9R0OR6ZOpoOBsdVGRcub8vKmcvRceqsqtN+cz
         vHMcV6PI+mduoikHTf5EhGi2ctQd29rCPWc/K2Tzu5sd34wz3uV/CJni9aECOZq04PPK
         b5YQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=AZDPoyon;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id v24si84401lfo.5.2020.11.04.07.37.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CR9kR29F5zySh;
	Wed,  4 Nov 2020 16:37:03 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id zja6UCmTGZ2t; Wed,  4 Nov 2020 16:37:03 +0100 (CET)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CR9kQ4tkrzyS4;
	Wed,  4 Nov 2020 16:37:02 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	jan.kiszka@siemens.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 2/3] configs: arm64: Compact ZCU SMMU IDs using the mask-id stream specification
Date: Wed,  4 Nov 2020 16:36:47 +0100
Message-Id: <20201104153648.35076-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104153648.35076-1-andrea.bastoni@tum.de>
References: <20201104153648.35076-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=AZDPoyon;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Example of the mask-id stream_id configuration. Compact all 10h'07*
master IDs by masking-out the lower 4 bits.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/zynqmp-zcu102.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index bdcb04b3..4e275973 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -23,7 +23,7 @@ struct {
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[8];
+	__u32 stream_ids[3];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -147,6 +147,9 @@ struct {
 	},
 
 	.stream_ids = {
-		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
+		/* bits 30 - 16: SMR MASK
+		 * bits 14 - 0 : SMR ID
+		 */
+		0x860, 0x861, 0xf0870
 	},
 };
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201104153648.35076-3-andrea.bastoni%40tum.de.
