Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOEEZXYAKGQEUBXLI4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A9131377
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:40 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id g26sf1383279wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320440; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gf9Urjf7Yqq8eE7ugAglns1QCnwgUKGCmHz/f2kessjgHY3hu1dR+o2UYvr5D+a5It
         pvmlYPOOybSq8wudSWxY+Fuk8TvyXPsc7m3/kJfjjjA4Lrfpr4amGurZC4N43d13kFFw
         oAYZD57/4Gfz4a68H3McLR3tLOjn5RWcDQpG8F8q6Y9FebccyYFTLDi8vJUG/0VbZwbO
         5cuPcmPEoJWJm/lFx9QlJDeit/9T4Q3q46IKrEZTtZkk0sRaGlGU2bUmCYmtK+UhhUFd
         RrkPaulgrBSlKc872JLVh7YDme2oqTIjYsneR/CWJeHiUSHKLy5pP6E5exOu9ESfrxOs
         owJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=nj5Q8FrGxLfCDkYzg9WSpwAbsKGw5tVzUuQta0q8R0M=;
        b=sdLTPGWXE4FSgAtjpHf3jXcsOBRNc6jWf21jLftRqDAYUTxb0XIfWT/yi4H9gs1lKQ
         VKXo0+NaY4ZC4/9lZ2oJ99s4gEyntFvbDr6rjdFPUIkTMB1KQ3OtPW8AXUANv4qiObLr
         biUdNfcZO66wf468o5jsRW/P/ZE871kYvrvVqZzczbPG5ipetqn2caIC3TRDsyRptD4d
         JgPCgcFtTcDauXxQuYpg9d/IbTtscDQOXWealQr7zjy1qNKpDkE6ktsTD7eA/3/9NzKz
         SAbKU9hFPNR/l+X9HsIfgZhV6hxUnpGMqX4ZpXsSg4W71Z+CXh1MZQ6FWDwFXwoZ0Mzv
         mrVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nj5Q8FrGxLfCDkYzg9WSpwAbsKGw5tVzUuQta0q8R0M=;
        b=dE+ENG1W5SSU6eutGKCsT7LwRdhj7sorBFYFZcrYUMg81kD/aN3uW+KSJtr1y7CeIf
         SSZe5zuFXSM+M3hEaNF7ltfMYcLp7nL8BvOPvR1c7bjdZR8jYJuuyVX2v9y0+ttn9xKk
         6FCeHaAyJx2ElydnghItkhC37Su7smF6Bfx7SKvmNiOTfro2Q51t6ysQjUQR0cCLIPpx
         t0V9s6dwDF1EQseMfus6xkz927aonhY9fV4zaGb/+7+koisBbRe4/oTX8c90+YOBtA+W
         iTy/VUejtz30cRRkt3o43iXHOI2rNOSli05D0srB40Fqux0CA1Elwym9FwR8v+yHtAoF
         pa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nj5Q8FrGxLfCDkYzg9WSpwAbsKGw5tVzUuQta0q8R0M=;
        b=csX4DBWoWWB6vUC9X+6zb9bWyisdDdJ3M1Q/mY4T9mFGz5DTTxTmFzcW6akPcDEVe/
         HiMWqk0zDXXrJzpqtI6F+0O6GPRE2wKkoYKMjn4EbNfdqyUel2DFkf1u22a3++VYVx4T
         3puoXwhDPN4lNqzT/ynbKm+0Y/ahFYhBpKpr+V9kODE+l9yc/c5GPAcYLSQ6gzWKq0yx
         Vij19VE/xUOJnOToCsdwg4fTQAl89XlFmFuBegXXVwFGpgFgvnfmq5AfC7E0BHimoW6I
         JM2G0wA2UVVv3Lul2jQxveE0zk4gpKGTYrYcNu7/GCd7TSm7UxjiTO8xR75ez4Ad5M36
         LofQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRsIlYLsV+QEvb+goGLg7Lv2KRF6yY8fyJfx6QHCoQJm4fBsF2
	ArKyVDYtZWdaP/9RBdsnAx0=
X-Google-Smtp-Source: APXvYqzvx/JrnkNw2F5ajUd5KJWDaRwEMqSEGMHyAys9Vt7X1diUobMOaeF+6Aba0t1oc133ViDgcg==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr101440092wru.353.1578320440236;
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls12996213wrs.9.gmail; Mon, 06 Jan
 2020 06:20:39 -0800 (PST)
X-Received: by 2002:adf:f847:: with SMTP id d7mr106825947wrq.35.1578320439534;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320439; cv=none;
        d=google.com; s=arc-20160816;
        b=K5I0r8jIPWEoHZxKkmSgUN7LwpUbZdu2BrR3/uWYDaFRl5bM+uQvs1BDo+BKY5HPxZ
         +sq4hI3EbXMGAFuDz1gXOA010o95/+tOEvw5Qm/x2go3MqvwzrNzwDbsJuGP4Pb1v64N
         5tM/AoIhwTfk4HuYGt0BYHq7B0z83RQVp6tCNFx7iyz+PjP+wK8NpO0JMDVcxZ57tuEF
         rWiUvSmCvYiIkVN9E2c/zTTSs8Xol0sP3l6xoz6rPS4kjyuzpX4uazqVVLBq8OUzmh24
         C1RM1Uzbc51vDCxNKqlXtOieOUXVL8wxmsZl829opNNOgPl2lOmunZANzDV6SpqEiqMk
         8EUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=CUDynr1RCc70GG93eT6o/1Sk7aOxnWfBz2/MI++0FRI=;
        b=BDhHRIGwBicCbDAXa0i3vfjz/lfVUjaMRQtYjW2zj4imZg0fOGp2Rjs/AXCw5R5klq
         WJ6ZNQsDIvyHD8bpIPgbYWrsB8XHjQB6U9ugEoLWN0f82r8SRtcnl3uxgpPcT4vTdsvI
         cQkg1WgSovpeW9N07W6G+Bs8HWWI/p8nBFFMg2G/DYp6FNYd7aiXBu/kC4PsRw/HlAET
         gSSajZq4GUpxCJGY7Eo+4LHxtIh9jp6/Eqm6YVwEPEeFZcXRT3QbL/v87EPuTsI62XIs
         yL/3SZGLyXb0aKgyqb21mJMR/aXbZUMEBdeMOzIBX3PLkfRMwflUq6awANbyjVZluoym
         e3hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t131si669675wmb.1.2020.01.06.06.20.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006EKd7K005399
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjI008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/19] inmates: Provide delay_us for all archs
Date: Mon,  6 Jan 2020 15:20:26 +0100
Message-Id: <7e5652f6cd2d7250fd03a0f89fee39dde80cf506.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Implement the ARM version and move the prototype to the common header.
This will allow to use delay_us in arch-independent inmates.

The addition of delay_us justifies the renaming of arm-common/timer.c to
timing.c, also analogously to x86.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/arm-common/Makefile.lib          | 2 +-
 inmates/lib/arm-common/{timer.c => timing.c} | 9 +++++++++
 inmates/lib/include/inmate_common.h          | 2 ++
 inmates/lib/x86/include/inmate.h             | 2 --
 4 files changed, 12 insertions(+), 3 deletions(-)
 rename inmates/lib/arm-common/{timer.c => timing.c} (91%)

diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index 8a4c2237..3d7b335d 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -38,7 +38,7 @@
 
 objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
 objs-y += ../printk.o ../pci.o
-objs-y += printk.o gic.o mem.o pci.o timer.o setup.o uart.o
+objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
 objs-y += uart-pl011.o
 objs-y += gic-v2.o gic-v3.o
diff --git a/inmates/lib/arm-common/timer.c b/inmates/lib/arm-common/timing.c
similarity index 91%
rename from inmates/lib/arm-common/timer.c
rename to inmates/lib/arm-common/timing.c
index 1a2f0c6d..b8e8c04c 100644
--- a/inmates/lib/arm-common/timer.c
+++ b/inmates/lib/arm-common/timing.c
@@ -79,3 +79,12 @@ void timer_start(u64 timeout)
 	arm_write_sysreg(CNTV_TVAL_EL0, timeout);
 	arm_write_sysreg(CNTV_CTL_EL0, 1);
 }
+
+void delay_us(unsigned long microsecs)
+{
+	unsigned long long timeout = timer_get_ticks() +
+		microsecs * (timer_get_frequency() / 1000 / 1000);
+
+	while ((long long)(timeout - timer_get_ticks()) > 0)
+		cpu_relax();
+}
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 7bccd480..6e350081 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -136,6 +136,8 @@ int pci_find_cap(u16 bdf, u16 cap);
 void pci_msi_set_vector(u16 bdf, unsigned int vector);
 void pci_msix_set_vector(u16 bdf, unsigned int vector, u32 index);
 
+void delay_us(unsigned long microsecs);
+
 #define CMDLINE_BUFFER(size) \
 	const char cmdline[size] __attribute__((section(".cmdline")))
 
diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index 6de736e4..60bc91b9 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -219,8 +219,6 @@ unsigned long long pm_timer_read(void);
 unsigned long tsc_read_ns(void);
 unsigned long tsc_init(void);
 
-void delay_us(unsigned long microsecs);
-
 unsigned long apic_timer_init(unsigned int vector);
 void apic_timer_set(unsigned long long timeout_ns);
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7e5652f6cd2d7250fd03a0f89fee39dde80cf506.1578320435.git.jan.kiszka%40siemens.com.
