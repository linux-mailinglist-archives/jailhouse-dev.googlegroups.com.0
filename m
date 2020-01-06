Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4EZXYAKGQEWM56NHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F87131373
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:39 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id f11sf11393475edy.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320439; cv=pass;
        d=google.com; s=arc-20160816;
        b=VblqVRYB5m8wNXDgi0snIVBlgvD6YscA64WstVVFpuvcXp27DzxQ8sbIsI5b8xRgME
         +Xv8uGskP8o8n1CAXB3LRniBu7HomBTn8C94ehLX+1Oc2Mnza2LT39NAMmKNrv3yR30w
         bvJgoNa2Akol3M1bmU53jjjGOQQ0azMWkA/47E78r3rg2h7uw22C8zJeTgIyle543mCQ
         IouR8stvl2KODC7jOPkzdgyOpcLVHpaTNC7g/+LNqpPD9GCOQ7HsL22x+zuJ3EMNgih2
         jO5t3F1+z3D97jJiRw2I0KkubR0AB8qmNjq04KQt1GJwDWdIY5WVYkesAjMsLRg1aYQn
         nSkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=oO/QLuR/NnfpJ5Xou5f1d88Ptmx4ZtQWovQ1HQqkfew=;
        b=L5JnoGlDtJQo8mw/P6n6/4LITaLpGuECOQ6nYkhImi8hvOLJUTFS0EuVGxDfhA45/y
         ChEpyZApqROD9xoufLTAkPDFWmtMhSBVL5SWoPTKFiQlZ0tuRPg2asyC6PeaTSazKm0X
         sBI+Uei4W9pTqt+YQ0I6zRwm+jB+ffiJDRuJQF2NbeEN2aV1l4JLyTSlqVpOzwuCkzwv
         yo97uw6AHL/Kcur8p0PuWWpswIbd0DyU67XmeOFd2ATjSeztimROUyQY42Cbf3zsaxvR
         fjtzPmP6NxxYo3WqhGcCC51/Kteq2Kqrup+GLcz7S9qQ/92qLvmkJH7evgLvgzHqzrac
         LOZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oO/QLuR/NnfpJ5Xou5f1d88Ptmx4ZtQWovQ1HQqkfew=;
        b=DuNti6nVFQdl8ESzPirMicdLxDC60N4lY7R6+xl+qOhvrkIB8fn61dEURAg9mAEOmk
         0Sc/BYLeyxg6HPsXS8gKiun0aE558za86lGDQtOt7h6iS1fwp3FPNBL+lmZNSM8PF8g5
         8VqDFfdDbUxybFADjIgclQ1Ewsg3bgEd24Zfp163kKf1E15Ajpwnzge3CsKjt0CCWWN5
         ry7M3LZaY+aW8cRNWNMfU9bP62d/JKhWBU+sx3JG6+krWjPyCpTwK0mbfpDQkUZ6CWTa
         uTPDWk2ykDYOdMROyw868fmP5pNfEMG+wSEpx20R25c/3IQ+QG4a0yAge02tfrx29INw
         7Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oO/QLuR/NnfpJ5Xou5f1d88Ptmx4ZtQWovQ1HQqkfew=;
        b=YdqRL7ieMC8ADgszDlaw3OAIwWPD/pTzQZgeU22kkRmuWSiQG+2Ntd1wRcWFUoEtfE
         PXwr/UxMPMtZ2Ukhl9VsZNzPhxX5jDDq3h48rB7A0SG+InRAqwTz/v6C/gT8oqLSet4M
         GadqrbGEhZ0uyk0VfG/B7pnhFzH8xsGjgOHlMmkAJfpvzBHe8bd+bk1v0gmOynjKG4iM
         w5lEZ9Lg+ziuvC/cRJuj6O6h9sb47zW7R7UqYMh/8kC/WqXECQ6lXG4qWYinVdbFSAcf
         FoeknHN0+d0Lgf6V0WCrdU/MN5TVDVUgNsH4h1DbhlToYBHJtkfyzVekOoGHvoscOMbu
         +FVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUgx5vVABhSTgsy/Oi13ZfL6qGCkIxi9X5Y4qDYNOvrZMpOzwPD
	1KBD9zCoMUl5MVA66h3XlV4=
X-Google-Smtp-Source: APXvYqzmRMx+S0JH+FOpDml6LFfCHXad9psHhH9/8mT+iutBexZRI4GlcfyGjRi9NqaCO9U81kKKgg==
X-Received: by 2002:a17:906:ce3c:: with SMTP id sd28mr110582558ejb.251.1578320439350;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:897:: with SMTP id e23ls14072604edy.12.gmail; Mon,
 06 Jan 2020 06:20:38 -0800 (PST)
X-Received: by 2002:aa7:d30d:: with SMTP id p13mr106920226edq.247.1578320438564;
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320438; cv=none;
        d=google.com; s=arc-20160816;
        b=o3Aj4ohuiGhdHROta3T8NRR8LxFtv98V/7988ZFm5DBgVmxLWhjN/x0QVXiM1s+Nfv
         D/8oAMXoV1jFz7xTcodAksTwt0IrmnGs+5TWo6Rlg8isKsBFqxun6g0oHNGK/LJBlidz
         PaJE+LbAv0rvVQZyAL2LSupMLqhMsMPUTnPYjuROD/2olgjjhZDYt4/WklksSmG+w/Qg
         HrNmd2wQyZ47eYMdDd115vzZGUn3tRDG+xNVFm44sPnYpf4yeCl7AKHWBVG86Km7PufV
         +IyK5vGrVWos9zspFw1Bg84ShB7Z/0Zmz5DUn9Sby5dew/oLYazoXJs3O8u4GZWK1rHB
         2QpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=6hZBwIyFvr3lp3OxJsxp4wRA9n8DeWUK0oQODmJpAfs=;
        b=p4Hn0D31h3H64OBapQwejWOPh2I8w8139cGaPOfa11Q2z8XziZsrrtNyVbZK+qwiGe
         h194Wf1m5sVbFDJ8ViAGZ77OO/w2YBI+aDfmgx33cWPHoH03EI12/ZY3IUBnwbZDZ1fe
         f6XXrg5DF00vpltHLOeXFBSy6wlrzrIp4tR34OUF0qN57nvjNyC7+tjhICE3LmJag1YM
         rpJ91h8k0fDTXtSR+z4ymshGnW2/aZji4DkYcfNYZnKsyeXlFXJUhD5sgEORuGeLzwcz
         Tayot83I0S69hNoGoij40UzexI3yGTXXe5s0prNUJADf5Uodow3Hklojj9eIMzzSxtdz
         Pmcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z20si2130016ejx.1.2020.01.06.06.20.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKchY021807
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjE008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/19] inmates: Generalize gic_enable_irq to irq_enable
Date: Mon,  6 Jan 2020 15:20:22 +0100
Message-Id: <c2445bb08100d0bbdf06f9217a8fb25ea7bfe185.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

This will allow writing generic inmates that needs to use the service
for ARM. x86 is just a stub.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/demos/arm/gic-demo.c            | 2 +-
 inmates/lib/arm-common/gic.c            | 2 +-
 inmates/lib/arm-common/include/inmate.h | 2 --
 inmates/lib/include/inmate_common.h     | 1 +
 inmates/lib/x86/irq.c                   | 4 ++++
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/inmates/demos/arm/gic-demo.c b/inmates/demos/arm/gic-demo.c
index 13db0a41..58feea3f 100644
--- a/inmates/demos/arm/gic-demo.c
+++ b/inmates/demos/arm/gic-demo.c
@@ -58,7 +58,7 @@ void inmate_main(void)
 {
 	printk("Initializing the GIC...\n");
 	irq_init(handle_IRQ);
-	gic_enable_irq(TIMER_IRQ);
+	irq_enable(TIMER_IRQ);
 
 	printk("Initializing the timer...\n");
 	ticks_per_beat = timer_get_frequency() / BEATS_PER_SEC;
diff --git a/inmates/lib/arm-common/gic.c b/inmates/lib/arm-common/gic.c
index bf00d4a7..73d37c40 100644
--- a/inmates/lib/arm-common/gic.c
+++ b/inmates/lib/arm-common/gic.c
@@ -74,7 +74,7 @@ void irq_init(irq_handler_t handler)
 	gic_setup_irq_stack();
 }
 
-void gic_enable_irq(unsigned int irq)
+void irq_enable(unsigned int irq)
 {
 	gic->enable(irq);
 }
diff --git a/inmates/lib/arm-common/include/inmate.h b/inmates/lib/arm-common/include/inmate.h
index 86c0806c..ab5681d6 100644
--- a/inmates/lib/arm-common/include/inmate.h
+++ b/inmates/lib/arm-common/include/inmate.h
@@ -95,8 +95,6 @@ static inline void __attribute__((noreturn)) halt(void)
 		asm volatile("wfi" : : : "memory");
 }
 
-void gic_enable_irq(unsigned int irq);
-
 unsigned long timer_get_frequency(void);
 u64 timer_get_ticks(void);
 u64 timer_ticks_to_ns(u64 ticks);
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index b7226bba..b5ace7bf 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -100,6 +100,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type);
 typedef void(*irq_handler_t)(unsigned int);
 
 void irq_init(irq_handler_t handler);
+void irq_enable(unsigned int irq);
 
 #define CMDLINE_BUFFER(size) \
 	const char cmdline[size] __attribute__((section(".cmdline")))
diff --git a/inmates/lib/x86/irq.c b/inmates/lib/x86/irq.c
index dfb78358..6b0c2b57 100644
--- a/inmates/lib/x86/irq.c
+++ b/inmates/lib/x86/irq.c
@@ -139,6 +139,10 @@ asm(
 #endif
 );
 
+void irq_enable(unsigned int irq)
+{
+}
+
 void irq_send_ipi(unsigned int cpu_id, unsigned int vector)
 {
 	write_msr(X2APIC_ICR, ((u64)cpu_id << 32) | APIC_LVL_ASSERT | vector);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c2445bb08100d0bbdf06f9217a8fb25ea7bfe185.1578320435.git.jan.kiszka%40siemens.com.
