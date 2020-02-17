Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHVRVHZAKGQEEJIUNGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E2160E25
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:55 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id a21sf1616968lfg.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930655; cv=pass;
        d=google.com; s=arc-20160816;
        b=u/ZIvXOUhxSWrvbiSyCNiKeCQctoYbAWFKbpoVNceK8u3owqJ1yfd2qcBU4UZqNqjI
         qKqaVZGbFQBJasBam4KTRtBw7G5BPlOlyT3HrfIB7ShfVJpDWanpDzAd1WqCH8emtCjO
         jEZiLeNw/mfcPorp8cq07Bs+fW4p54wV7hw9ZJRv0FUhAK/cDOLuSlNpLbhA/cG4nwSP
         +o0F+uGZjrVrbqB6lnDN1tTBHN/FPks/0DiPDyC7fgtTb1cI30kAlptwkCjeCS4z+URB
         w5YNFcDebr0lcabhYcV+TxI3UCz/B5huo9+cPQGjTN3zEMsJZYGtlSAE6d3p4kruJVZs
         SYTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=30YxIFZPJrs8cBUK8epGlS57oPLKV/RStaAoo2ff9k0=;
        b=rywIW0tCjLDHdtrA+krypIX5FG1tfZBb8IOh66xlvbWpByKndVNVco2ivycL/3qSsS
         PzHi+btr6YPGT6bHLzWvxaITMwzNc23xOq5UEiugY9sRq/xsmkoXIWTsaEIL/S2E0u2h
         dCnblfue2QAeJLpLdArLo73AoyD6PnN3GipMo/ssWo9Zx+pvtuLK6FicLwa82D0Nzkes
         z4dNEKqRWZeokvPkPcPtmcJoPrG0q8Km7ZvwzRaCkZN9bbeWKtCG2+UztTx8HbFl6SR1
         fW2E/pIgMBWsza1xFLafHOpp/auU8yPeMV+WeweiT/vMwoHt6Z8oWJB4GlJWBItvHcak
         qiEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=30YxIFZPJrs8cBUK8epGlS57oPLKV/RStaAoo2ff9k0=;
        b=gFrNRdh3VO/yqM+uCx+VfByUfpdra7raVozk5b9BdysPTgSsc814Dzd9/jrZfUWY6f
         BlrIjP1qJmFzXB5G/DJjRi7RA/10EwqFXJzybwQAowHLQkmXGVZaDVzaqvFK2KBfPnx/
         bK0PMM1YRZ3w1AH9PaTfVISMX5s9KmqQ4fHTZEYCrExozKXii1hE9dMGdhl7oveG1mgT
         eyekU3R269nBC+Mz2/wHb7xnA20qH8ZmUg13NIhgmyiW3tGvh0JLPAmrP4cz6dcEqbZg
         7VnqoVo9Z/K0DporSXXnZt0e7JOdlzhWLwV0xE1AWYUerWYwF4are/HafXK25SvkiIPb
         IsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=30YxIFZPJrs8cBUK8epGlS57oPLKV/RStaAoo2ff9k0=;
        b=I1BrWIh4px2XoA56kgj0HWwJGjFjir++r1Sh5+Ps5n09wlvJyFI+b3OqsWNPdBNw99
         SVeqRyn67w081q9m5A2GoLAd6RVMZKR83+OBgSBEyI6ycMQo7Pv/tdu9fXpL8rl9LBdV
         gU2EWBfX1nek5t1Nl+wiBhNvkS7zpSCzQnXr4sTAU0q0YcyWRmVXSibU5E8pPmfSo7m1
         KGOqx/DZo62F02Nwu5qGQ+umxmg6QNpckcULB1CPI8ZXSLo8NfTWfsw89vi/5FyyUiZ/
         rOUObNBIUrimwlMr20cax5f/Pn1KZR1u9Tw0XyFG0WHDsY75yLIN4ynSyJ3CEVPCZ1WO
         050A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVy8hM/s7Qu+7Ey5x1bo4PTkZFbafiNaP41+9VtSRZG2k6UQetA
	6jBih2BhYrCbJHRia1hTeKU=
X-Google-Smtp-Source: APXvYqzzUkN20TUp8hf/T+9Jh/4QmJhaUu2D/V/MGU9QRCsgtas+eEqaMpFI6mS9j6aOvh550fwsRg==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr9312482lji.93.1581930654360;
        Mon, 17 Feb 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:48a8:: with SMTP id u8ls926869lfg.7.gmail; Mon, 17 Feb
 2020 01:10:53 -0800 (PST)
X-Received: by 2002:a19:dc14:: with SMTP id t20mr7388256lfg.47.1581930653271;
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930653; cv=none;
        d=google.com; s=arc-20160816;
        b=Ls3qSqA0IQIxcM1Lpo4n3SPI4M32cYP9fMdsLtgTnj1OB94P4e4JBy2zVOOaSgBfmh
         DdFUTW0O2kWddABhaBJRQhJAiXn9whaXH9HIumu1eOmZZWHcC1Glr5jWUmYKGCUllZcT
         K3bNINcGpUJ1BAjQvgN+AV66ZBkG4bjsRH476F5KIBIRNu+BJzSSPKjX+04zMw2XS6S0
         +m3tY3yMcswsFYUfmZyH5f5mmB3aSJSA3SjUMDf3mRS08tkUrVxZ2i5Tl4YBXf6NvF2v
         902DXx6+6zU8r3XC+Pdkjp4ODieysbIE/XH27RXIEeAGsJTgsbrCtq90aDArSlKBkR3U
         0SlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3JEebdAcTEbX+0z/eJr9R9vRnI4JkxqRkFU8XNI5NTw=;
        b=WRciXj1HLwfKq25JFq2VKkUVe5MBoR9btJtjgtzO44jelQAtiqC6kW/S68ViCYrc0G
         /NznC00EcDsGcaHvccwUN4rA5haP36WKqOYzjp24I7sLVAEUvaBOmTazDyJal9Q3s43x
         htvGL43N7KbrBMwtvpESg/XmcytdS/TdlbyD4sSei5kvV1xJeCxigp8ceZ280ub4nbh/
         wcNVof3FTbncTNxVeChN9r3DvJN3bh3+y8YLiHlv+E0Pv/ntDOqXsL8QgQxz7HOCxeji
         vhJJ9JI+SjU4NTPW/0bUuPxdnYExCQ29KBsfN1F43T9TsDl1r3RhJGnHRcGyNiC191xM
         PMaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 68si256401lfi.3.2020.02.17.01.10.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 01H9AqOR005766
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3a020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/6] core, x86: Remove unneeded bitops.h inclusions
Date: Mon, 17 Feb 2020 10:10:46 +0100
Message-Id: <5c5f2e20c53315e4604c07290e9a262bbba35dc4.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This header already comes with jailhouse/control.h which all require.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c  | 1 -
 hypervisor/arch/x86/setup.c | 1 -
 hypervisor/arch/x86/vtd.c   | 1 -
 hypervisor/control.c        | 1 -
 hypervisor/paging.c         | 1 -
 hypervisor/printk.c         | 1 -
 6 files changed, 6 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index 4f75bb12..04b46501 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -18,7 +18,6 @@
 #include <jailhouse/control.h>
 #include <jailhouse/mmio.h>
 #include <asm/apic.h>
-#include <asm/bitops.h>
 #include <asm/control.h>
 
 #define XAPIC_REG(x2apic_reg)		((x2apic_reg) << 4)
diff --git a/hypervisor/arch/x86/setup.c b/hypervisor/arch/x86/setup.c
index 6f0be862..a3e1f9ed 100644
--- a/hypervisor/arch/x86/setup.c
+++ b/hypervisor/arch/x86/setup.c
@@ -17,7 +17,6 @@
 #include <jailhouse/printk.h>
 #include <jailhouse/processor.h>
 #include <asm/apic.h>
-#include <asm/bitops.h>
 #include <asm/vcpu.h>
 
 #define IDT_PRESENT_INT		0x00008e00
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index d33d429e..cc7d3bc6 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -22,7 +22,6 @@
 #include <jailhouse/unit.h>
 #include <asm/apic.h>
 #include <asm/iommu.h>
-#include <asm/bitops.h>
 #include <asm/ioapic.h>
 #include <asm/spinlock.h>
 
diff --git a/hypervisor/control.c b/hypervisor/control.c
index c1a4edff..016f97cc 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -19,7 +19,6 @@
 #include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <jailhouse/utils.h>
-#include <asm/bitops.h>
 #include <asm/control.h>
 #include <asm/spinlock.h>
 
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index c6fe1286..876f1521 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -14,7 +14,6 @@
 #include <jailhouse/printk.h>
 #include <jailhouse/string.h>
 #include <jailhouse/control.h>
-#include <asm/bitops.h>
 
 #define BITS_PER_PAGE		(PAGE_SIZE * 8)
 
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index 4b001970..1b6151e0 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -15,7 +15,6 @@
 #include <jailhouse/printk.h>
 #include <jailhouse/processor.h>
 #include <jailhouse/string.h>
-#include <asm/bitops.h>
 #include <asm/spinlock.h>
 
 bool virtual_console = false;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5c5f2e20c53315e4604c07290e9a262bbba35dc4.1581930651.git.jan.kiszka%40siemens.com.
