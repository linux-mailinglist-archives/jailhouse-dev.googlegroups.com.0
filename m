Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOEEZXYAKGQEUBXLI4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id AA889131378
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:40 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id u18sf27132701wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320440; cv=pass;
        d=google.com; s=arc-20160816;
        b=eL6hupL/g6LztJP75jNKjqPQupsIEsqWmlb2uidosFg6ZhN903JHhwqrz0z/X4FCNU
         t/wdYP0546V5woJ4ddU/eKuwTgffp2k9UV4d27nIb8YygKfJnjtHbVJVyFC81/EUaHPE
         nZyxwwO8J9Mv2npbvOdRR10aUv6mGALRngnkCv+Io17VlL8qd1YLYmIiEODv1mF+ydVA
         A9L/YlEKlCCaD7kAzKQTj+e/TEjmP/XBg5naKJfHp8LInZdXCcmpMspXbR4tpkr1aWVG
         L8aHpnytp9LDKg4sy9zzYFFDlqw1wEbygbJMmPiYJfIpU4WaoR7c1BXW2QaPCIKUW04p
         08wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=zij2q0FrymsnmOJuZVZN2IDUwhJqFRUt/B/Ek8/+hk8=;
        b=Tg5GnB0wG8c2YoHYN6GmBsjsTHJaL47Py5W0hAHqeBbImPTaxVPuLFG79CINAMAXX7
         rFnQmffq2fAdUNuW5z+CKJzKfm3pH+1mItISwShLOEyC751m3TzBnh8S1G7KJe3iYWP7
         WFR0Xad7ylyLLjOoIMppABVS6V+SQZWwBISDhlu9/meLbdQPQbXMDP7goxRWSTh8TD50
         Avdtgih4nYA7/JYf2VWHtB69+AI7tdF78SYfrTfsRQqLpdps6iHrtFfSaBIFcns5Vmc0
         qRwj8qc0phDk7Mw23gzzv7e77T2TuLOIxx0LvfLQradgC7dmaSCdUpqhWqzWQRxW6XAz
         0dDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zij2q0FrymsnmOJuZVZN2IDUwhJqFRUt/B/Ek8/+hk8=;
        b=MMDjqO6rVwXlR60amSdhS4fPZgZhtWL8L/r3iDcmiKB6WynDlpW0vlgYuHhrHcoyyB
         CsQ+EjefSnd8NO2OAnZY7OhXP1wn5wxtKy1543Cj2HwwSMDEFyFAJTJ+bTkMh60wB9+D
         hAYiDRk23LS3Yl2muCvI2Jq4gqzIlUoTAruGmtWei/ZhijQuULmGV8y5hADaDQAlblhh
         nr6mos/2gjolDuNgUU1lfuHFWEA5ieaDbgffIFoY2l/dOP+t3+3959NM1hmBwjr+0638
         XPu0k505B7yAv9jhtAMV4kkEMUzRB7T9/hhkO6zLd81pJSAt2KPsVhU3RH9N6vNdLTgP
         LVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zij2q0FrymsnmOJuZVZN2IDUwhJqFRUt/B/Ek8/+hk8=;
        b=YlRSZpMN5v15xv8+7kvgp4RD27Y4WrzGh3r7B1/SYtOwsfIinJbXM+ozcYHcP0+6Em
         AuXZrAfKRYi2Q1M3wjo64kL/oa0gwlLyb8PKXCgXvMkr/yxyANCuc4i9ZyfM0nJcfPcy
         0AmoV49g5v+Vdk84551G8lulQXOi9g2AVUA0pT4QDfpX2sQb3gND3AFoLfkL4jFR8qXY
         RHUxWt+qKSe1bm3BCBKWVcOUQAwY7QU4BlrNaBJf5bW7yd78sBKghtMTKj5ptSM+aLRl
         widCVh+G/PeUAZSZ5d5/tixeUfJR9xW0QFuVEhkZyjz7C2YFS/PkwEtSALIM0n+hO7bp
         s/pA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJnkLgnCq6/SLOfdZjCypNOG3PjslbByV4bRQWimcOjs3C6Zrb
	ech3hH/U6e8ivB7kgu2mwRU=
X-Google-Smtp-Source: APXvYqw4FcxmAAlMMnWtG/F/+N5ZCZr2rkfUSS3o3E7pX9xeAM+7air4L5AsInJC7v/jq5EohZn00w==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr106124259wrw.233.1578320440409;
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls12977894wrr.5.gmail; Mon, 06 Jan
 2020 06:20:39 -0800 (PST)
X-Received: by 2002:adf:f70b:: with SMTP id r11mr109869124wrp.388.1578320439761;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320439; cv=none;
        d=google.com; s=arc-20160816;
        b=w/HkMVTgxGcNolwwRq0ovIm4ckuHDUFHTe6pYpIbtYQNrFxS2e2szyo9/CxPrq5iXT
         y5k5im/d1mNOC2pOQbgbYI4kKpxh1hcPDi1EJSQwHDji1Ylat3GEMUB+moawj0RBq4sD
         Ry4khj2WjJpGjydcAuL4914BuE8u4WPI1J8pTayTuZNBnk3XqYA93xn2Xlq+w6/l1/bb
         sfeyDdDDRfBQbIv+80RKEdzqGQwl226wDYApHmvP/+5H7YIHbL1QoEaBJqcf9UkHw9Qa
         EGGhYwBVx3g2PEUwBXyqIyND3Cd0vjNYp05Wqn9XNV4tlw0mFkm9hEV6qqzVALVsDT/6
         kF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=We0FizwL1iIv2YBQadMb20tLQfafNBY1qTwX009e1AE=;
        b=oMarmbJizqDS1f9z60WONkYnoT0nWyZHxk2wyJTUC8+kiuOoa7HZgVmWUAmPp3Zg+5
         Zu+eI6NeWu7g9eetQs6bMUBNp2ptHx82bxvKpXzffe9bq4hIgbTnv1YdYqDAojM4naAV
         s501l+ayD7T6pUPnoN2gzCyKxjFqjBIkE49QWc0zZczu8mr8UcanTFfiOsBeSq53WLdM
         SSS9B7XUFYnh3yUdmypA1AGP8djFpN1dwPifjqAEmsWRu62kfDb+z56/r1T6KWPGy20f
         5vkJ+9GmxMZlQggzGsu9OHCxIvKk+LjDlWKXtt1kiFWsIMKFDluUlwOh+koLOmht2+qz
         of1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s82si762032wme.0.2020.01.06.06.20.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006EKdRO025694
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjJ008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/19] inmates: Provide generic enable/disable_irqs
Date: Mon,  6 Jan 2020 15:20:27 +0100
Message-Id: <aa744baef8179fb9af38b408077d3eacf491b4ba.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Allows arch-independent inmates to control the interrupt mask.

Drop the unneeded "arch" prefix at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/arm/include/arch/inmate.h   | 7 ++++++-
 inmates/lib/arm64/include/arch/inmate.h | 7 ++++++-
 inmates/lib/include/inmate_common.h     | 2 +-
 inmates/lib/x86/include/inmate.h        | 7 ++++++-
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/inmates/lib/arm/include/arch/inmate.h b/inmates/lib/arm/include/arch/inmate.h
index f6988367..da70ba71 100644
--- a/inmates/lib/arm/include/arch/inmate.h
+++ b/inmates/lib/arm/include/arch/inmate.h
@@ -44,7 +44,12 @@
 
 void __attribute__((interrupt("IRQ"), used)) vector_irq(void);
 
-static inline void arch_disable_irqs(void)
+static inline void enable_irqs(void)
+{
+	asm volatile("cpsie if"); /* enable IRQs and FIQs */
+}
+
+static inline void disable_irqs(void)
 {
 	asm volatile("cpsid if"); /* disable IRQs and FIQs */
 }
diff --git a/inmates/lib/arm64/include/arch/inmate.h b/inmates/lib/arm64/include/arch/inmate.h
index 5e797aa0..a85b98f5 100644
--- a/inmates/lib/arm64/include/arch/inmate.h
+++ b/inmates/lib/arm64/include/arch/inmate.h
@@ -44,7 +44,12 @@
 
 void __attribute__((used)) vector_irq(void);
 
-static inline void arch_disable_irqs(void)
+static inline void enable_irqs(void)
+{
+	asm volatile("msr daifclr, #3"); /* enable IRQs and FIQs */
+}
+
+static inline void disable_irqs(void)
 {
 	asm volatile("msr daifset, #3"); /* disable IRQs and FIQs */
 }
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 6e350081..5af1213a 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -92,7 +92,7 @@ typedef enum { true = 1, false = 0 } bool;
 
 static inline void __attribute__((noreturn)) stop(void)
 {
-	arch_disable_irqs();
+	disable_irqs();
 	halt();
 }
 
diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index 60bc91b9..28ae5945 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -76,7 +76,12 @@ typedef unsigned int u32;
 typedef signed long long s64;
 typedef unsigned long long u64;
 
-static inline void arch_disable_irqs(void)
+static inline void enable_irqs(void)
+{
+	asm volatile("sti");
+}
+
+static inline void disable_irqs(void)
 {
 	asm volatile("cli");
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aa744baef8179fb9af38b408077d3eacf491b4ba.1578320435.git.jan.kiszka%40siemens.com.
