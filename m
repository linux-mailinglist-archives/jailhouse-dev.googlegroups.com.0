Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBCOMQP7AKGQEW3COYCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA302C6402
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Nov 2020 12:42:01 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id n13sf3360142wrs.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Nov 2020 03:42:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606477321; cv=pass;
        d=google.com; s=arc-20160816;
        b=wF1MCbhGTVU0UlU1L4Qv2GnKMSVeekeiQlk7/D77v4sV7uKPwY1x/Q7b3zau/mlwTy
         h6R4MV8WUtdxRhcv3vrd9ypIM15fgjF3OWV5nu88fw3vA1asEPQypCgZR5PCEtNGym1q
         WV3Hx0hTe6a8m8NmgBPGOdSjh0hNRCvALEptyz1epleXcEIa7/5fHqGTZfvZ+S/5X3eE
         GtYASMDU03HrUbuPm4toOTVZBmTwTBfKZxyrFSWCt7al8W7hAugRUFxmBwGc+bl7HYwa
         JwsYHlvCmhD8AvYPi/rKrk9cqEGkP8gB4B2VbN5EFqFPW9aN/OcCdaCvukt5eyg48ue6
         fOWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=j0fKZIdIKk9REVMND/44S2Haz1Cb7c5s0eZh0Q44MYE=;
        b=huHmgrvSPrRfWB6bbNlu46fFmm8C2ChJb4y/7nyvc9Ck9M+5ArNt79QCsz09GcyMBB
         YllnbSspW4grVKzI65FOqAOyYRvh+x5ktPydVmiCmeHwhXqj30uMLbO8jEHIir/+0Zs2
         uaJ6uFOaSD1P9h3cVlZyjtzTqlnQJNamWjyTK4YBObAfpdvnmD4jgfN5Qa3m5BSlRUVz
         9EImV9HJR90N7k8HT1c6m1cATeSan6ef3VsUow/2fOEbnFR0SbwrhkxSCDxINdjvAoHw
         FPt5PDd6iewUXZxGNTC1LpbKHU9Yebz+pYDJi9Y2Ug5hZUCMgKXv7DyAukVKxajEc8RD
         HPUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=yJoyTX9U;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j0fKZIdIKk9REVMND/44S2Haz1Cb7c5s0eZh0Q44MYE=;
        b=WPzio3lNet1H5t72x3CryViJNzfHunv3Y8J8nLq7a7gmEWkzAzp/Av6fgo7rCvurq0
         c4fqroLsGATQA3MRfA+/2UQ3ZaKcvtKRhTzahS6eSo00NRfMKIRdtpV2zFI1EEJNHVOR
         WDcfadh7TypgXxU7oPDayDwtvTX08vqN4V9VbW9M5FLH02mrUoGqbOWKd0gYzBSo5QpA
         EEGaVOTytTh31mll30dbf4m8T9sFJstJgpYdpsdfd4d0gj9IzOzGnO55f+nKsWVbth6A
         LYNBf/6xr7Oy6ybtmIDGTw+P7LkGZN+wrzNhMLpwh2UgZyLnDkhWCTL0bvJYyLXeNaP9
         xCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j0fKZIdIKk9REVMND/44S2Haz1Cb7c5s0eZh0Q44MYE=;
        b=BCUMqiLt6R2FXUoYFE7dP5SwGMrJPfpblf8N8K7VoMR+ApY3kQyrQZ7OJJCo+aRLYq
         Jsm2eA34hdtEQvpxT3Q66DrXW7ifkiqW6juzj5KPkOgXbTHdvZq8GxA3UdCLeHRhVn7f
         NCrl8mcq3M0gm5SNkQUxMrFrevQWnp2T35QsC+5hkVSk77FvJPhmXpti2FgpnXGpYdP/
         8y2W1dLwE3UvvbELeCHCmyVxc07v5gUCE1ItKz5VPfY3Fy77lndKvQNHdeGmX1qYfCTR
         utS30VnbFJssOV5OwF8+s965bEngguy7DB3nZ9tV9urp7hixJwWwUQ419XV0IZIIxiUe
         zz8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530W3BuFhCnjCsJeHQdvoC4tNO9W7PqdrjmuesJLbldT4mD944Nm
	CPnIFWrwrkMIrxa2WtOWKWI=
X-Google-Smtp-Source: ABdhPJzeM/osRMoOnxxWuje9N/4+L3xFdxKLJktsxBjz4m88MLv/M+hPUKghqbW/V4UClIuUv2wMHg==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr9898472wrv.46.1606477321601;
        Fri, 27 Nov 2020 03:42:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c689:: with SMTP id j9ls879632wrg.0.gmail; Fri, 27 Nov
 2020 03:42:00 -0800 (PST)
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr10054020wrw.123.1606477320632;
        Fri, 27 Nov 2020 03:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606477320; cv=none;
        d=google.com; s=arc-20160816;
        b=cW+HxEZtWunY+kXjmMTBKCzfuu3iR9J+f15dPNtIwElAL6H19/MX8CzWYHNVuSxRg2
         muAuxLCgnDCzbcTOJW0OVsPa7TC2/4m9nGP6u+gv13h4rbSRZgObNApJNS4vZW/purOX
         DINjWX7MxNCjh2Fkua9DbjkGJTyc3lpD7Er+zxYrpTQdcls2atNldCg4sic0ZAMP8dwy
         66iEa7pIxi/NWUh9axpDHzRJpe3UHRHjPC34hq8EsZ8OuDSW62+t1zr6+4IVfNOvd7Kh
         b3mr85ZWehO1IN3j5dP2PGrmzQJzmvnD2hpfzJ7o79Bq9UScFMCMbuXabIWJprkAPRFA
         Musg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gKRQ4ztzqu/wJj/dHSOW6MmCw/LONEqNSXPQfQyGhxw=;
        b=lO/yfVjayA6UCqFL3Fbay6yxPM8tXKpmE6wGoY0A5me99eY8bJGs9fyDVrrPHzuEmH
         9lKB9cHtfeSoHGitVhUJkSxJJeASp3Fj4Elm7SGXmPAQ7W/N/knDTcRPAAEmhjRWOZaI
         3jX/KghPsur3mOhAplr/grjM726tXStNK3V1EPj/YGyKRfs+Tkj83anuXIP5ZhfxWPEt
         qZg+4C7k6i3/NS42696GFsoyrmRDfRU3cEKFrv6+Q8LGVHah5Kcfidn8n3X+geLoveif
         rZHlruaUqBe70fpaWCyrfUXn3i0U7mJ+fhcMyv3nPJswJucXgDnTE1ZXH84evJ1dErGG
         cUfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=yJoyTX9U;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id y187si276690wmd.1.2020.11.27.03.42.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 03:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CjCQc3Dx7zySw;
	Fri, 27 Nov 2020 12:42:00 +0100 (CET)
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
	with LMTP id KRygSVfKTs2L; Fri, 27 Nov 2020 12:42:00 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CjCQb6z2VzySf;
	Fri, 27 Nov 2020 12:41:59 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v3 2/2] configs: add Wall and fix bracketing
Date: Fri, 27 Nov 2020 12:41:40 +0100
Message-Id: <20201127114140.37179-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127114140.37179-1-andrea.bastoni@tum.de>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=yJoyTX9U;       spf=pass
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
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201127114140.37179-2-andrea.bastoni%40tum.de.
