Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUGPUX6QKGQEQSJ64XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BFB2AC062
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 17:01:22 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id o7sf1620554lfo.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 08:01:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604937682; cv=pass;
        d=google.com; s=arc-20160816;
        b=tM2O5ypHt8tfuPq9IZlyax+3LnAV1Vj69tpoyqZegsukK7LT5P//MW++YBNmJgfUEg
         Tl2SiBubQF1mOBm5a/GmIfrdl7PflB1bd6VRlG0zmSGjmwb5nvGWRnMtXcK+yCqpW3vC
         IFnTcKBIY5y58hwNdzXt0Dg5cH1Dmt2KLHSjagnmauA6b+qdT0MtHD5Z7h4sMMAPcw8R
         V3zk70qq3fIqopTTRef5LZuzRndKyOWJuKOcZltKOA0gspovuQWZ0WwolrohU5TgikQF
         PBET8E6Nhz7mIEcGdHJY032XkGzGFp0trw6cYt2EREDK0XXLcPDtx+AHYLoh7mKDDHJp
         YA+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Q+hgHFr2NxRqMmE1//iWEsfQsBNiEvLKYV/Le14FFbQ=;
        b=AotEQErw774tO3FKBs9Yg3aba7s1QtyGE9cKBBIpcPaDinmWaYL+XXEUXY9LhZ/xtd
         8XepRRfdAO0PI7IpVzPPpPEwVdyHJ74Elb8YMzhAzMGE7ygaEk3CLQgEGqmii4awh4yF
         e1MBJIy6Efzer/tslsOppmW4Gva9yOIliOmbDy7pMYzMd3Tyob9UVSoTjTJsP6iIRbwS
         XD6sePn97+huK+Sk1cHRCvdgaECO7ZY1ZNKxXYLpcCPrd9cO7ghhZJlofHLLmbi7g5p3
         F/F81bXOHCgHlTbJm3jMxBw8OywmkogkHWhDzbS4xliPGipj79EhDY92MK7cIxXhBDSo
         zOmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="Gm9HwyB/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q+hgHFr2NxRqMmE1//iWEsfQsBNiEvLKYV/Le14FFbQ=;
        b=MfeP4ZEOAXKBXUp4WrsjntUgZEjqF0yggfc85Kl2Rom7o8ZFWZ/m1C0wlAIISvNWKo
         OjUmfzrbz8Zy8EOIF2yaJ/if8DNYpyply69WtfFkr+E+paWK2OI7q9I9eWMJxxYvCBgR
         pyIrvUwmpsqHJCL0tM83xqAkkqSrI9g1s/mfRy7DAv2GmfMiseHbXkma43nNq9Yq9KMI
         cmCm8swDJHp2TMf+5tR7poMzcNM03tcAPgOkb7tLzrnEFR38lCoDzP+amUhU968plfiE
         ghjMwF6iUKzhEM6UURnwUXM5j/qVN+EYyC31byJNtf8+5s6XmkzWc+6SdKKodZyJejhF
         G4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q+hgHFr2NxRqMmE1//iWEsfQsBNiEvLKYV/Le14FFbQ=;
        b=IAiAW5CLU15vU5xDFatSg1MYwvqCZtYP/yfugUeJo5Kx4iTMtbUhcbQYZCphGA69se
         a/fF6vwNUldefnW/LXn6N3nJWlOb0l29JxdO/nWqofAraet+6isb1DfojWiSsJl6F/fE
         Z9GSkgUKErX2Kic9CazV8pTSpilC7NiOmDb9sUfvr2HcIw/Mrac3mMXJyi4v/3QJaPiZ
         GBApTdRlB7M3/vyO5nG6dXq6+YjhktmTZLIlIhIyQcWjpRHF8OYOEX1+zTdIxOdfESud
         JElQaH3vAbTb8JGFAW8Nvw4+gObBMp+WrwiLn0+WgyC+huovUWSbK77OIAQ67JzAweml
         z7AQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530AO2V27Pn5Qi3encqJT/qSewk5Nsk65bX0xEs6pdFE8hRYv/Op
	FpmYkvEECm70hMek/sAoIYM=
X-Google-Smtp-Source: ABdhPJwrrYCCzv0tWhMM0ggzORfgbS15Ap8nlcMr30OXphSXOtCudU4/BjCuPKQzhIh0SsqSaXKu3g==
X-Received: by 2002:a19:7f55:: with SMTP id a82mr1937954lfd.603.1604937680431;
        Mon, 09 Nov 2020 08:01:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:480e:: with SMTP id v14ls4001141lfa.2.gmail; Mon, 09 Nov
 2020 08:01:19 -0800 (PST)
X-Received: by 2002:a19:ca19:: with SMTP id a25mr2892620lfg.89.1604937679119;
        Mon, 09 Nov 2020 08:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604937679; cv=none;
        d=google.com; s=arc-20160816;
        b=mvc7cQfDeiPYPfkICcS6yV7EERY01357hCuaKrzjsYHq/BvEAKRoSpQKQzFUywrd1E
         Em+C9SkJo+CivBL1RjKobOT523TB8USD4fZLXLlHecg1b1X8DD7VUdSy7Tg+JNh0PgqT
         pEMN/FROg9kbFOFmYXr1O+0FP/yLazhls1z9kS6E2eWxGpRlIKM1I9t/w1GGLUWZ5FJa
         EJj6qRntFQ92yNb489cBqySvddawe74N+Sjo+dU8dsu1CbqA0jIedt/f16zn3t3HN9vJ
         aVRFDqM/9g3acAwY49Qj8q/s12O5+GXOYRE8Eq9rDU/jLdSBrgiAjYYodMgejudNsgIn
         Yl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OfHF5g4O8U7JNiU1dSwopGhdSak87aQdEiKqOEjZPBc=;
        b=HP4Uz10UtfyjRQGZnI3cJGrstUBo6n6rHUCpk6y4OAxLZpI9E4ai4RArhceKJe6P8v
         TVFwdo41QGzyebO7k+Og3Nz2tEYhpx0pW7pZssKejB1HhqbwyfU9Q9z1heFco77pwV8c
         RcQorn5aokSrEwNS8Uk6iY2TxvCJk74I39tnyrMmL7hsIK+qq9fpaUIXX1SpLzcGg0DU
         sWAPPsf+/4yHARci1wqzZ9OI7qskWPxOfP8TmICF2iYJEkT8WwSb9VE5nwCWHQwX/C/X
         JGvBq4+S/S9aYQOpF62vPwoveqPNKu/hzbVgf30BjJUD89St8FMHuoEjo1Y+iap26bQg
         PU0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="Gm9HwyB/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id x17si250150lfc.0.2020.11.09.08.01.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 08:01:19 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CVG263lMGzyR1;
	Mon,  9 Nov 2020 17:01:18 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id sYgPjhGhnTZU; Mon,  9 Nov 2020 17:01:18 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CVG260MGVzySv;
	Mon,  9 Nov 2020 17:01:18 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2 3/3] configs: add Wall and fix bracketing
Date: Mon,  9 Nov 2020 17:01:00 +0100
Message-Id: <20201109160100.103095-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109160100.103095-1-andrea.bastoni@tum.de>
References: <20201109160100.103095-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="Gm9HwyB/";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

In combination with Wextra, Wall enables additional checks such as
Wmissing-braces.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/Makefile                        |  2 +-
 configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j7200-evm.c            |  2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j721e-evm.c            | 12 +++++++-----
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/configs/Makefile b/configs/Makefile
index 513b0a9b..5a19621d 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -17,7 +17,7 @@ include $(ALWAYS_COMPAT_MK)
 LINUXINCLUDE := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
 		-I$(src)/../hypervisor/include \
 		-I$(src)/../include
-KBUILD_CFLAGS := -Werror -Wextra -D__LINUX_COMPILER_TYPES_H
+KBUILD_CFLAGS := -Werror -Wall -Wextra -D__LINUX_COMPILER_TYPES_H
 
 ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
 KBUILD_CFLAGS += -include $(obj)/../include/jailhouse/config.h
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index ace9cd3a..1fc98bf8 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -233,6 +233,6 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0003
+		{0x0003},
 	},
 };
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index d0c8aee3..cc452157 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -354,6 +354,6 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0002,
+		{0x0002},
 	},
 };
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 1b8b3c4c..af6a5a2f 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -261,6 +261,6 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0003, 0xf003,
+		{0x0003}, {0xf003},
 	},
 };
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index aa5b47a9..19f9d967 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -402,13 +402,15 @@ struct {
 
 	.stream_ids = {
 		/* Non PCIe peripherals */
-		0x0002, 0xf002,
+		{0x0002}, {0xf002},
 		/* PCI1 */
-		0x0100, 0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107,
-		0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f,
+		{0x0100}, {0x0101}, {0x0102}, {0x0103},
+		{0x0104}, {0x0105}, {0x0106}, {0x0107},
+		{0x0108}, {0x0109}, {0x010a}, {0x010b},
+		{0x010c}, {0x010d}, {0x010e}, {0x010f},
 		/* PCI2 */
-		0x4100, 0x4101, 0x4102, 0x4103, 0x4104, 0x4105,
+		{0x4100}, {0x4101}, {0x4102}, {0x4103}, {0x4104}, {0x4105},
 		/* PCI3 */
-		0x8100, 0x8101, 0x8102, 0x8103, 0x8104, 0x8105,
+		{0x8100}, {0x8101}, {0x8102}, {0x8103}, {0x8104}, {0x8105},
 	},
 };
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201109160100.103095-3-andrea.bastoni%40tum.de.
