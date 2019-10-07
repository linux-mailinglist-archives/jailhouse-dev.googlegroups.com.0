Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7PX5PWAKGQEJQI2Y6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D0CDDA2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 10:49:02 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id a21sf1745650edt.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 01:49:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570438142; cv=pass;
        d=google.com; s=arc-20160816;
        b=gBPb3SOw759tnpqwXN5OPHQhvq5lwrDay1yGkUNR1PCEClhREwEyBS3uPwFHafwhNh
         bnMH7dbHz3Zr2bskUS9JYF3jtJDE4WIY43zP85avgSDOM6FNBi5VP2/kj1xHaWWknoij
         FSeaXWdqo/QFGqpODjiLFDk1fWdQOfMehIbI11Kesy1kR4U3c2XRyi2qElDVWWKK3OD5
         N+n6aTfA+E3URndUYF0apsXFqi6vy061+zE8sIgclrbAkJPIJWVY/Wokn/v2XUA9V7El
         m5WARAbp46frjLlWZ8oCSl7oqvDrQYdjCh2vOpOYlMURjTUiKyBZ6fghhmLE7fcOePwd
         kg4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ReyncpEWd83+m46LiJcHEiXy+bLFH96+bXuhd94G1xQ=;
        b=DJEgXF5WTiMuEFJEUUf8yfTS+SsGjvr0ye7Y0JFMcUXf9R1XykKRQq1C8duKd3ZOLX
         Y0TC6PCwP8eqHnU9IElBtNTBYU59FUyn4JiRHss+38IHdeyXfxEzGjVmrtttRZy3jOIe
         TzPTMxd9b3nkzQK6fgfUM0UnhWOfpRFxoeLEX1hCDuhbfkSWoKqXD3EzjZGYVmaxM35o
         Bqd7yDR0FxFNq06yzUpKGKx3X43gNJZnep1dpW5KxH8/p5HcratLzk/60F7eBN0pB6vg
         rhbGLrqkhFD9/Rh1j3fTXd4nTc8woDx+K7DAkWTZrbLSg9tyB119SvIIESXzsFeLIgTG
         /EQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ReyncpEWd83+m46LiJcHEiXy+bLFH96+bXuhd94G1xQ=;
        b=F+BZjXhNH6/fr5OafxNN+5/nBWIom0t1zhLPniad4yQc9yg0/lPVwu6t41JjZpbUXe
         4R9J1/bihMarfehHNuVQGCj+FkgoPYaUwah9rzmSTuljlW2ffDUa1npb/Ii5L/t3ME5n
         YmuQHqdFf5ECazHKWfa7bXm5NQZJzaH6pWPMU9l9qNhL5cuhuNqaJqmI5KHqAHojoUSV
         f9zlEUvaBkVjTEdB5fhCiD7lVeGb4pnn8v5R3bFF1wdlwfOzptTi+mrfkvQZAi+JTlom
         P18LboJ8jr0HqQAUQoRyRxA3qpxARMTGpNTGv7qVKNngPbzWtPSOeV9EtzM5XGvm0X8y
         ttNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ReyncpEWd83+m46LiJcHEiXy+bLFH96+bXuhd94G1xQ=;
        b=NZB5KobvJK88LqTR/ZP7jhAyiPuqRc9fJc7GqUl5ElY2tafLq3lNRXJqKPYOu3osD3
         uPgWrhZ3KZU69Pzk6PCe7x/Oka3bIF9/TfAnjXfi5u1jZS89o3BguF+vuqRItgeDWmqY
         nvTp/tmexfSkWvbb//AwLxKrd4FWqpkBfQt0lbqZe+T3aGm0531OxMXgvz8565iJuDvH
         v+92nNCpcrgoaHHJRD7UKIwfiJ+74c/GrQ0jsQOv4MkK0J7iJlY5tRcpRqGFVlG7jys6
         jI+luTqQj5wjJG4glQwq5FQ/5PjcTkvlwmA+fRqcCvXUompY9MYc2TNJOzik2y6jg+05
         /unA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWTd3BDUz/wwJFTqRtzhyyD7RzS1mF2S6p4yiNHXrb1rjZ0ruVN
	E5PvYtU8B9jazmXR8kgkB08=
X-Google-Smtp-Source: APXvYqw3fevKt61XMcP2YOIzRuFoOKkwh4sOCHeoac+p+Je86NPTdYao33z3CY1oTnzdNSS5XKjsbg==
X-Received: by 2002:a17:906:6c8:: with SMTP id v8mr23113201ejb.40.1570438142117;
        Mon, 07 Oct 2019 01:49:02 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a859:: with SMTP id dx25ls2444211ejb.16.gmail; Mon,
 07 Oct 2019 01:49:01 -0700 (PDT)
X-Received: by 2002:a17:906:cf82:: with SMTP id um2mr22939386ejb.254.1570438141154;
        Mon, 07 Oct 2019 01:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438141; cv=none;
        d=google.com; s=arc-20160816;
        b=dBdzhrIhb1h6dJrro2rKfRT2OgH3HB1smQu4/7b2q58+Z+0aUdef+5/8QSJ467k1iT
         9erUIzejIPiOplVqqhCuEx1AFeIwerpNkReaGEYeKk4+lm68mk4OB3GeuZjIFSuTpwnL
         Y35KniXPg9fcfzeq5VT4SYTaRTDtUNAZrK0MeN5U9yT/jwVRrhFPs41iIvZ5QtrUJEww
         N1oQwIN47+KzWK5W4VzriomBfIffHl2EzlouAhzUnvydbzVaYZ63gN2IhAH43yNlnfer
         fNu4ydebxgU/AehWoDV+tNnm/9XKKws2KMubXAdCfNTr4clDNApso/zFqFvb/7UchHdU
         L4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=b212XDPGvO+EpdTEPHtPTxLsBwyJczTclgyrzAa82GQ=;
        b=wXdw0x4qbnuili0zYzBYAYGgkkQ3HHrB2eg4jAkxsoREj8XU0+R0hCtuBQNK44zlSF
         4JPUHDdNeonPUYS3P10hXYJOmLe1fWtkr6mVTfbSw/i98rVc8TtSk+gF3XnDJz5gXXHW
         tWxIeqxruO3GXesRMzIzJm3OVO3FvayIq7HwnzKF22i1Y8Q9JddqdHKkYYSR6whBJW/s
         /PlI2B/ZH0I0uq1vb+pTdb5FC7oBoKCMic8pBrzCNTd/n7mZ3crI4QjKEp6KLWBRPjC2
         egYSD8x6O332H4YEUZzNfexcG4FJVY4QEV5muunzPrIO9lZhx2kMhXQG3LX64dotK/ww
         s4Kw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d11si581123edh.3.2019.10.07.01.49.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x978n0uc003045
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Oct 2019 10:49:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.114])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x978n01W011472
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Oct 2019 10:49:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 1/2] x86: apic: Add full support for IPI shorthands
Date: Mon,  7 Oct 2019 10:48:58 +0200
Message-Id: <0943a095a97df22273c128b5dafe838edc1be537.1570438139.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1570438139.git.jan.kiszka@siemens.com>
References: <cover.1570438139.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1570438139.git.jan.kiszka@siemens.com>
References: <cover.1570438139.git.jan.kiszka@siemens.com>
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

Adding this enables support for Linux kernel 5.4 which starts to use the
shorthands.

For self shorthand mode, delivery mode validation is improved. Trigger
mode and level are now passed through as this is safe and simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c             | 69 ++++++++++++++++++----------------
 hypervisor/arch/x86/include/asm/apic.h |  9 +++--
 2 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index de691329..40d6fce9 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -343,33 +343,6 @@ void apic_clear(void)
 	apic_ops.write(APIC_REG_SVR, 0xff);
 }
 
-static bool apic_valid_ipi_mode(u32 lo_val)
-{
-	switch (lo_val & APIC_ICR_DLVR_MASK) {
-	case APIC_ICR_DLVR_INIT:
-	case APIC_ICR_DLVR_FIXED:
-	case APIC_ICR_DLVR_LOWPRI:
-	case APIC_ICR_DLVR_NMI:
-	case APIC_ICR_DLVR_SIPI:
-		break;
-	default:
-		panic_printk("FATAL: Unsupported APIC delivery mode, "
-			     "ICR.lo=%x\n", lo_val);
-		return false;
-	}
-
-	switch (lo_val & APIC_ICR_SH_MASK) {
-	case APIC_ICR_SH_NONE:
-	case APIC_ICR_SH_SELF:
-		break;
-	default:
-		panic_printk("FATAL: Unsupported shorthand, ICR.lo=%x\n",
-			     lo_val);
-		return false;
-	}
-	return true;
-}
-
 static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,
 			  u32 icr_lo)
 {
@@ -430,6 +403,17 @@ static void apic_send_logical_dest_ipi(u32 lo_val, u32 hi_val)
 		}
 }
 
+static void apic_send_ipi_all(u32 lo_val, int except_cpu)
+{
+	unsigned int cpu;
+
+	/* This implicitly selects APIC_ICR_SH_NONE. */
+	lo_val &= APIC_ICR_LVTM_MASK | APIC_ICR_DLVR_MASK |
+		  APIC_ICR_VECTOR_MASK;
+	for_each_cpu_except(cpu, this_cell()->cpu_set, except_cpu)
+		apic_send_ipi(cpu, 0, lo_val);
+}
+
 /**
  * Handle ICR write request.
  * @param lo_val	Lower 32 bits of ICR
@@ -439,16 +423,35 @@ static void apic_send_logical_dest_ipi(u32 lo_val, u32 hi_val)
  */
 static bool apic_handle_icr_write(u32 lo_val, u32 hi_val)
 {
+	u32 shorthand = lo_val & APIC_ICR_SH_MASK;
 	unsigned int target_cpu_id;
 
-	if (!apic_valid_ipi_mode(lo_val))
+	switch (lo_val & APIC_ICR_DLVR_MASK) {
+	case APIC_ICR_DLVR_FIXED:
+		break;
+	case APIC_ICR_DLVR_INIT:
+	case APIC_ICR_DLVR_LOWPRI:
+	case APIC_ICR_DLVR_NMI:
+	case APIC_ICR_DLVR_SIPI:
+		if (shorthand == APIC_ICR_SH_NONE ||
+		    shorthand == APIC_ICR_SH_ALLOTHER)
+			break;
+		/* fall through */
+	default:
+		panic_printk("FATAL: Unsupported/invalid APIC delivery mode, "
+			     "ICR.lo=%x\n", lo_val);
 		return false;
+	}
 
-	if ((lo_val & APIC_ICR_SH_MASK) == APIC_ICR_SH_SELF) {
-		apic_ops.write(APIC_REG_ICR, (lo_val & APIC_ICR_VECTOR_MASK) |
-					     APIC_ICR_DLVR_FIXED |
-					     APIC_ICR_TM_EDGE |
-					     APIC_ICR_SH_SELF);
+	switch (shorthand) {
+	case APIC_ICR_SH_SELF:
+		apic_ops.write(APIC_REG_ICR, lo_val);
+		return true;
+	case APIC_ICR_SH_ALL:
+		apic_send_ipi_all(lo_val, -1);
+		return true;
+	case APIC_ICR_SH_ALLOTHER:
+		apic_send_ipi_all(lo_val, this_cpu_id());
 		return true;
 	}
 
diff --git a/hypervisor/arch/x86/include/asm/apic.h b/hypervisor/arch/x86/include/asm/apic.h
index 1d6782dd..69a1fb8a 100644
--- a/hypervisor/arch/x86/include/asm/apic.h
+++ b/hypervisor/arch/x86/include/asm/apic.h
@@ -64,10 +64,11 @@
 #define APIC_ICR_DEST_PHYSICAL		0x00000000
 #define APIC_ICR_DEST_LOGICAL		0x00000800
 #define APIC_ICR_DS_PENDING		0x00001000
-#define APIC_ICR_LV_DEASSERT		0x00000000
-#define APIC_ICR_LV_ASSERT		0x00004000
-#define APIC_ICR_TM_EDGE		0x00000000
-#define APIC_ICR_TM_LEVEL		0x00008000
+#define APIC_ICR_LVTM_MASK		0x0000c000
+#define  APIC_ICR_LV_DEASSERT		0x00000000
+#define  APIC_ICR_LV_ASSERT		0x00004000
+#define  APIC_ICR_TM_EDGE		0x00000000
+#define  APIC_ICR_TM_LEVEL		0x00008000
 #define APIC_ICR_SH_MASK		0x000c0000
 #define  APIC_ICR_SH_NONE		0x00000000
 #define  APIC_ICR_SH_SELF		0x00040000
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0943a095a97df22273c128b5dafe838edc1be537.1570438139.git.jan.kiszka%40siemens.com.
