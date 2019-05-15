Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZOH57TAKGQE4GTU64I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 793941EB98
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:03:18 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 205sf316939ljj.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:03:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914598; cv=pass;
        d=google.com; s=arc-20160816;
        b=qr9GDV8gbfIU/CI88e2I2HuovRRh1Imac/QspmL+6fHleEAYTqSNZfKmIYUSv5i7TT
         xstfaDNrrzIbQebiSELk9D56EMXptSXD5s1kixABsCEiCf3DHbv/6pgsB0lkNB1QIbe0
         xeCY/FueLhzw8Rdze2Zw60v594cfeTNFZuDYqqRpjfUYa5kk08+IX44V4YzpLaC7Ub+A
         xhAjjR2ya7h8SXmvloxciETaoUrLZRtj8DFelRdheupHl9JjnwzBLBR5xgjeo4J8M2sQ
         zjU1ZVzYaGG9e7W6NgggmD/2gQQudWrXLEa6et2ZV9KJ9IvlIPg/188mWC+plZaD+3mu
         AU0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=bKc95vn45nNS+Kx2eXH18Z7SnuB2HfIl6xBfbxgHFEw=;
        b=Beo897S1KZB4oE8RqEvI9suY8fV2iu7T1qotu4Tr3U5ZBqmXUJY+QdAriwYpRcfpzv
         NEziy6gNY3NzMQRCZc1tUoNbs8JE98etIuv1138GLatXqOB5iyrzJz7sJLIi6Sx27Clt
         HI7HrPppOT3/vXognMBKTt/QalK8xKkDPBPvPo1+qTPsnrx3eW3oGKAl+XelJZCYr3tI
         AKZyyl1I9CTkEX0KUVYB7c5GGx5EjRBJ3cBM3eKgCAuOiY4kSp1D3B6QPgXLhFAJ72/E
         HqhTohvp/qxAN1+iKDFLBCPtnFZ9u834SUaDB2IpeSapkQDgbodOVJoXV1y1Xiv0zpUi
         b0eA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gf3tPrIr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bKc95vn45nNS+Kx2eXH18Z7SnuB2HfIl6xBfbxgHFEw=;
        b=qaEvAVv5eVTYvzrtMrB4npCQJy1/Uen9j2/ije1VHepaQIQS+Us/qLgSgSxgTwP+MQ
         jnsJq4frDngqRwN008EpUnZYwQIQHtj/zS5oQscpCTA1Pvs6eeVBlLwwEWFWbFCLtt52
         lol6OcQC6sfo9v4KKqodWVKwG0OndBtC5ZBf27PBiEIfd9CPPYoTxNRO3kkR/KlALP3i
         KHyki5AEepHGfL9SW7CtlQiArTWXmTKme1Ls5FCvy218FmIjxdJ/QFDGFfoLIN0RjGTU
         bQ/7rwwjeIFXhfzCQisHzf30rHL4RXUJW6mq9PhoTYilJfJgvHhpegBJ5kfDc0S4z1AL
         dU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bKc95vn45nNS+Kx2eXH18Z7SnuB2HfIl6xBfbxgHFEw=;
        b=Z7nXIa3HtDg6ydmB6s9o+TJLG7gwuEG7Lhv/m9eYqZ7MNTYAtcUDGmtO2gVet7zbRX
         hzDEpAbNR8issCh1cWe+trc5OP0dk9vfRA5Y2TWsdDD+TvyUHtEXu6neZWiJAGcZovbN
         O/6uxR81Y56yVN+ZBfWjMDLYGOfoo/vTPM6QcRpKhh+JerGYjTRURv+drFqRZoZqwIv+
         K88JV8dpAoitrsFzXHJ5ds+AvtPUyWnkpAsB1741poO9OEJP1pZnduGvnt2jMebj9M3q
         QWXYkjeL6/VCwiGjGdeoiAKXM07aBs4AcZ2izKhF91IIMKb6pXNojshS7XfyQ7xguyqi
         Mx/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXP3tDPxEr6+wr1QKwom+GOm3yMTKSqi3IBhabEmWe12vCk2MsD
	dVFE9AP7+3Xc7fgXJbAtMRw=
X-Google-Smtp-Source: APXvYqzqW0ro1nERUoqiQ0l6KP548hMclFgg5MG5OuSqEC8GwVJaYoG6nqnqY+0BwEhEhchiM3Okyw==
X-Received: by 2002:a19:5015:: with SMTP id e21mr20458361lfb.62.1557914598008;
        Wed, 15 May 2019 03:03:18 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5611:: with SMTP id k17ls161241lfb.15.gmail; Wed, 15 May
 2019 03:03:17 -0700 (PDT)
X-Received: by 2002:a19:196:: with SMTP id 144mr20984949lfb.35.1557914597314;
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914597; cv=none;
        d=google.com; s=arc-20160816;
        b=a4FLpYLGigKJnj4ZDWIAlGhrFV+rhoegSVdrPgWVWHmlLgQjfPt0KxSncxJgNGq71R
         jodLLW7FVsnQD5ae57EllVsu7LG2tTwC9VhXN5oSNIsKB168TQmFKXcmMrXXlilfMDq6
         /06s0IW8m2JpIJ9c+g1OvMbo4G5qEPmim9zpxINo2FkJHLIub82096746W11Em1Vud4M
         C3VfE3c1f9pQIlPWzvMpWIE58Ra7ikv14ceHlNLMuzJlXV75Kl8yUg7aABERED3bh+Bw
         kT77qR4haeT7eOFk01Im5xe+nMmR73jDr8zT3tksxilgm8QVVh0FMXw8Nj4zesKEFEqN
         uoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=ABcnZW6uy42/k0btVGCDL5qFLJRa/RYLtnK1Cd+5ycU=;
        b=z7eTgQrmZ+4HwRasds1kuZXiDw8a7uNYEbtqN55+nQ6G+IHKiMVt7vOaMR5YMdeJBc
         /f22NsQcKms5AyQ6hgv6AYjrN5e9eywbQKjJ+t3zbxYD30DcYGX+ylluZrD/s27ayfmR
         9WeLZZx9r8mXjQl+1DbWyVtR86VcfFwXhvGLsjHCZCK3OteYIng+4ZFfhjCOntPXPLuR
         ALjavnzOxICCBgWtm0zqu/zO/puERBz0US8uOOeYMghJ3SW42/AhMza6tV653aCwjG1M
         A0j1C+k1FG6C9wcPv+PUvdpcsWyJq7wdqcOAIRERbL5F6Q2I5PgitjeECt1SYP+373sV
         kXdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gf3tPrIr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id o20si136745lji.2.2019.05.15.03.03.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.54.22]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0Lakoa-1gy5VM2NI0-00kO0a; Wed, 15 May 2019 12:03:16 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 4/5] inmates: x86: Add 32-bit interrupt support
Date: Wed, 15 May 2019 12:02:30 +0200
Message-Id: <d51321d5ed55d50057666d0af7c5ce1cc89d6621.1557914551.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:pSsV6KptTWLD7JvdNc+W+6PUX03WAkESccbSl6i3Yb23092pqId
 ZRGyGnE+qti3IolE76Jvdfkw50DZ1oBmZPl6mTsv1WI/Jd2C0nXtbd/DzeYnlM3A5qyEcro
 rKwikRcezdfnvrR2rGiU0iRARFMUQbX4Pw9S8Rd4A1EqnM3qED9EgRlMRW9/mRPw1WGOipY
 WU/u1EDgnjJLLrqxe4w5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OVnzv6CQwHQ=:dH2hX0/nIq09l/P5Ny9B3/
 uv2jtcMyg5bokH3YPuakA84Hu5Vxy+xBEYMCmsXlakhGKSfKw1hQi6U6UFMZR9ITziQqmT1ti
 70PphUqNUeWMXbUCFLFjF8KZbcrN2n0kscDht8diu8+dyM7E6k+fYUbRlIysN30aniML1tbJk
 PV88Dl7+mlGCZy6q1mdD/tIiJhlKhVVbGAoKmWWi/8Jp4HeGN4WUBiE+VOV5JDfPWfvLWJY+k
 ybI/axzRmW/35r8DEc/IU/lvJEQqSj/G8CWa4K71CgCHC6vOMrD8/g63dgHw905++24gXSHMa
 g0B/skRMdOc+Catl5mHCQfLF+vOxwTpl/l3El1wDCEJ4UdrLN3xKJfUh2X0P7wsjUSgCxudxt
 57gLwTSlNnkAmCaE2A5oFyrkejw1M9meyTeRG3pyWkpsWbme3Rtw2RnIGh+d9yVkK/PppFtzD
 MFaCk0KYfWa5pPSOeULqkBpQu/KxMHk4DzfjMt8DlgjeyiypccHgNvJc+tFPV/WiQ+ek3sW8R
 KsdNe+0p858a6ZMBqBLlICXjlKoM/zF0o7o0tIW57qHTPvbhBJba5+q82UVZ7znGY2nacyZOs
 PyzJAwVi2zIRChSmgN0UFJLVq65PEuNsVdcoyj+r2PBLdmtpS6J12htPVT9pCycawhgVd1Otp
 w3m9r+NnE3kwc1jwqn4221hbBJT+Z17sySZP1i1yeJzay9q5ISZFtcUJzV3rNeeK4+Jr3PCxd
 CKGkVK8QTKrFG7HP2nTjsB0VriFqiSKpHcpXQxAMuHcAqXAfA7MTUNkliFsUgYL+4Ohm5iEOo
 LiBlBcx9bQ3qZBKkoQFG0PL0SzUcpb5RHRJ0dLZMSrojORo3kwU39FSirvjnSxiO8lRZSQXM6
 7DFvwH2AAhkAjY0/V+1JlFivKIl9Os1eQuzmU6FPMY8cUuYXuW4vJxsHQoXapZ
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=gf3tPrIr;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

Fill in the missing pieces to enable interrupt handling also in 32-bit
inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/x86/Makefile |  4 ++--
 inmates/lib/x86/int.c    | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 97a37341..dc017b90 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,10 +40,10 @@ include $(INMATES_LIB)/Makefile.lib

 always := lib.a lib32.a

-TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
-TARGETS_64_ONLY := int.o mem.o pci.o timing.o
+TARGETS_64_ONLY := mem.o pci.o timing.o

 lib-y := $(TARGETS) $(TARGETS_64_ONLY)

diff --git a/inmates/lib/x86/int.c b/inmates/lib/x86/int.c
index e85e3e12..663fa65e 100644
--- a/inmates/lib/x86/int.c
+++ b/inmates/lib/x86/int.c
@@ -63,7 +63,6 @@ void int_set_handler(unsigned int vector, int_handler_t handler)
 	idt[vector * 2 + 1] = entry >> 32;
 }

-#ifdef __x86_64__
 asm(
 ".macro eoi\n\t"
 	/* write 0 as ack to x2APIC EOI register (0x80b) */
@@ -74,8 +73,13 @@ asm(
 ".endm\n"

 ".macro irq_prologue irq\n\t"
+#ifdef __x86_64__
 	"push %rax\n\t"
 	"mov $irq * 8,%rax\n\t"
+#else
+	"push %eax\n\t"
+	"mov $irq * 4,%eax\n\t"
+#endif
 	"jmp irq_common\n"
 	".balign 16\n"
 ".endm\n\t"
@@ -90,6 +94,7 @@ asm(
 ".endr\n"

 "irq_common:\n\t"
+#ifdef __x86_64__
 	"push %rcx\n\t"
 	"push %rdx\n\t"
 	"push %rsi\n\t"
@@ -114,10 +119,25 @@ asm(
 	"pop %rax\n\t"

 	"iretq"
-);
 #else
-#error implement me!
+	"push %ecx\n\t"
+	"push %edx\n\t"
+	"push %esi\n\t"
+	"push %edi\n\t"
+
+	"call *int_handler(%eax)\n\t"
+
+	"eoi\n\t"
+
+	"pop %edi\n\t"
+	"pop %esi\n\t"
+	"pop %edx\n\t"
+	"pop %ecx\n\t"
+	"pop %eax\n\t"
+
+	"iret"
 #endif
+);

 void int_send_ipi(unsigned int cpu_id, unsigned int vector)
 {
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d51321d5ed55d50057666d0af7c5ce1cc89d6621.1557914551.git.jan.kiszka%40web.de.
For more options, visit https://groups.google.com/d/optout.
