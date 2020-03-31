Return-Path: <jailhouse-dev+bncBAABBOUJR32AKGQE2XG4VUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D304199D51
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 19:58:19 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id f9sf998377wme.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 10:58:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585677499; cv=pass;
        d=google.com; s=arc-20160816;
        b=lHGTnfPKlwYJtNKLjctuKedHeSEEWmbBGnDR+zSY9Zm1ZQg7Q3VlVqKo9ylJiXOemF
         GDapDqf0NEdJO57t4XuVjfO/daA6epgM7/GvyJYoYu2h6EuLB4EKW3kHJy0/s5TkVB4B
         nadDzjqC5dWUThSDEF82JIt9a/o7kbiSgVO5bEZZSQS4fi2usegGz5g0+rv1R5trBlA6
         ssjmZwn3t5/iV1GOSARb1YaPmi7/6YbVjtrW3DOGXK8uVgII4r+vIfm/p3O99r4xgjkj
         +ox1z3HAzDAWD8AD5EU8pDcE00NG0yACOtWkAbpQo1ZJY39n0wlnvgwPqJR/LcwdK/Kd
         1pzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:sender
         :dkim-signature;
        bh=IjccD+nRNsrTNSeWvs+G0ytS4gvI76beWK5UbWR4NnM=;
        b=cBbFkbVehPjWYZgY/XPyPHt2y8FQZ1fMscwmxPZzt1UdSgdVScxkwUbOvgMyqFE7ZX
         DNIbss5LZkVRHbfpuXdfO6OAilSvU3dqhCTbnmPeErtkT+9VfbguBiL6WbFZj6+MrSZP
         +inTfrcJBMmwkDuII2uJni0fCGov1DcqAK8NUENr4SeLJZtTL9mlxCsvll0R7ejXi5da
         nZCVO1hkZuOcF8lOCM+M6h8JpevMjzPIwyVziTmLFOQxfymlybPbd6iAWc1Ysh0ORWyW
         QzlLjbj66rIMBSgOA8p72FSzR/T8Zd290RBN1qVyN0fryenonq57lzu5wGXo2/4b2nSc
         eO7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=YiYm6kAc;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.168 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IjccD+nRNsrTNSeWvs+G0ytS4gvI76beWK5UbWR4NnM=;
        b=Ps43BHRFyqobu+Zp1bEMfqnrXH3CItfSpC9fztzAgaAewHY+x0l8ApaEgP5pZWWXMK
         Ik6g0jWiV1nYm+A5ay5vledylFjaj77KqRXRWcJjSCwCNK7iUKXDnkqCzEiQi8oKArPS
         cp0hgLFpPOC1PKsdsoCLu1gcP1J7lwwd5nLPm+eCMg9JO6+htugzn6riZ03y6nE+sXta
         SRl8WqdetuJcr1N0WjcvCNgH8nmwfExhaQvLjigHsDtzEMSHuDqUD9Pjcp5jGpDU8qbF
         gOdw9yPpDs38gxiFx+Q8a616YFJ+PIQ6LpjX7hM9vIbwyW+xYd1dvc9Kc8kxY/0S9F0o
         zetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:from:to:cc:subject:date
         :message-id:in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IjccD+nRNsrTNSeWvs+G0ytS4gvI76beWK5UbWR4NnM=;
        b=LPsf6kCBri4yniAF89vwifwHF9NNjNWv0LyLAlYdnmNh88aXRI4Zo/LrNhA96R7Jqq
         ToRMX56B9M3ITM9g/UJYD1aSkGdb49lPYoTaNduF1vlb0+OzHAAfEBaUFGqzkhhuue87
         n+bkBKzahgtx8mXyQQ7nvQALx8LK0zxFB23pEszvDEG8U+gRawEMlLjuvPMrltuQWs3r
         xeo9ek9GYWMhe+w8rwfmOHmnHAM63TvZy287mmnTyuPLhI5IWxAblmvW0r3CK43YdmRx
         ctYzN0nZ6pTSBN4wzJSLXNZw1ySyDCNtqUXn0iJ4+6qZvKi/ZIsbeIGgJQJaKAXFGn8a
         mnrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubLQ3tQyc5Cz6tFXxUYIbed/REYL8yZxbXZ3k1+6ANHJJPBhtZ0
	0Q1WimdL8EK/qWQsorwLstI=
X-Google-Smtp-Source: APiQypJnqmrGpQk80QNtphRmxfYhjEOeMD2ROpBvXXfQusTML8teCVfeztya6T9F0hDKQ5gQtyHF2w==
X-Received: by 2002:a1c:96d1:: with SMTP id y200mr66743wmd.114.1585677499126;
        Tue, 31 Mar 2020 10:58:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd03:: with SMTP id e3ls2188161wrr.0.gmail; Tue, 31 Mar
 2020 10:58:18 -0700 (PDT)
X-Received: by 2002:adf:fc45:: with SMTP id e5mr23402802wrs.56.1585677498626;
        Tue, 31 Mar 2020 10:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585677498; cv=none;
        d=google.com; s=arc-20160816;
        b=yBWLXZAqoWaz+pwwOSLTDl/N140XCA3mBiqv4v3+UoansCuoWGDURF53a7u8p/q8pX
         RwyGkZ9kSokYHpFD9MgarRIhpPli+J1ohzZ9vxNTTU5kwg7mPPQOzxZnBjU2/IvhJWJQ
         Mx5f/33I7a8FXUPsBYN3lL8KeamIxoJeQtsuDR5sFIJ5+NA5DJ2LABIAIjZkg58W2S5Z
         V9h3qfIVZeHQFwOZDLAioZOAaXiR4RFtzCDS0AntGHmDToj4JoB+N3HUtmzGPCwbNrSK
         1h/j9iLYDjFoCN01ucVuyrxLuQFs4QGpOyYUvBnikkyhtew4/lGYcXzVD7gPQYoYIMDh
         M4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:ironport-sdr:dkim-signature;
        bh=dlcUsy9JKePsJqW4va5VqvoJsGkg1RXyPXM/0Bw3uEo=;
        b=u5QWgwZQfegrMt+HNt9PDWeB5+OYJueShrfqsVTuZK3CMvTKgtfMxkxNuK5JGMVNe2
         DD9iLle5spn2CcKYzWOf689erjopWHELSfmtywBnsbjNZfu98/i/LfBOxHZXBYe7IEg6
         VmmIxTpAzcEKSaILp6y6s5d36+4DkeX1zU39wiw8PfB0U/C7hbVBm31ryXwJRQpgCNEA
         fyAOynG4uFpMbgd/Q+pZPESz3BZEMyrHSoIwf17PtPld96PqzY5fWDXYzBHQLSZGtVJV
         oJDUB0v3+f2xrryr/K0v9fJPZKLWfID8bV4ZWf2bNCdR3uKc8wGCKWW6ousFwitFv15g
         z3WQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=YiYm6kAc;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.168 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com. [216.71.155.168])
        by gmr-mx.google.com with ESMTPS id q2si863166wrc.2.2020.03.31.10.58.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Mar 2020 10:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.168 as permitted sender) client-ip=216.71.155.168;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: RGw3vXfJvPLWGYll59FYuAuA6EAKCWzeIq5Fl0HkNa2ni94sQboesVM0BU188NTLSn7DbvQ+3O
 w46cW+o3PzyEWAR2tzKHSx9Rrpw65z+eMqTsCeu8F6QUGeLl6CVQG7LOiyLupPZhDHYJ+pkDxT
 ak1rYwwMa2PcclAmNWf/yPHxQb8lCtg8VO4Lyf/vw1rCjmZ5WzBrKlpNlbhz7cTY0s8UBSt9ad
 8Z8a7WnGrB4qkWsqDl+uOgikBbugwxAU8TeT0t3/yB7Bb6d2wYeQq/a2O3/gnbTK239PS51e6/
 oag=
X-SBRS: 2.7
X-MesageID: 15275649
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; 
   d="scan'208";a="15275649"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: LKML <linux-kernel@vger.kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, <x86@kernel.org>, "Jan
 Kiszka" <jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, "David
 Howells" <dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh
 Boyer <jwboyer@redhat.com>, Steve Wahl <steve.wahl@hpe.com>, Mike Travis
	<mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Kees Cook
	<keescook@chromium.org>, Martin Molnar <martin.molnar.programming@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>, <jailhouse-dev@googlegroups.com>
Subject: [PATCH v2] x86/smpboot: Remove 486-isms from the modern AP boot path
Date: Tue, 31 Mar 2020 18:58:10 +0100
Message-ID: <20200331175810.30204-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200325101431.12341-1-andrew.cooper3@citrix.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b=YiYm6kAc;       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.168 as
 permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=citrix.com
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

Linux has an implementation of the Universal Start-up Algorithm (MP spec,
Appendix B.4, Application Processor Startup), which includes unconditionally
writing to the Bios Data Area and CMOS registers.

The warm reset vector is only necessary in the non-integrated Local APIC case.
UV and Jailhouse already have an opt-out for this behaviour, but blindly using
the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.

We could make this conditional on the integrated-ness of the Local APIC, but
486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
list and header files as appropriate.

CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: x86@kernel.org
CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: James Morris <jmorris@namei.org>
CC: David Howells <dhowells@redhat.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Matthew Garrett <mjg59@google.com>
CC: Josh Boyer <jwboyer@redhat.com>
CC: Steve Wahl <steve.wahl@hpe.com>
CC: Mike Travis <mike.travis@hpe.com>
CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Giovanni Gherdovich <ggherdovich@suse.cz>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
CC: Len Brown <len.brown@intel.com>
CC: Kees Cook <keescook@chromium.org>
CC: Martin Molnar <martin.molnar.programming@gmail.com>
CC: Pingfan Liu <kernelfans@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: jailhouse-dev@googlegroups.com
Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2:
 * Drop logic entirely, rather than retaining support in 32bit builds.
---
 arch/x86/include/asm/apic.h        |  6 -----
 arch/x86/include/asm/x86_init.h    |  1 -
 arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
 arch/x86/kernel/jailhouse.c        |  1 -
 arch/x86/kernel/platform-quirks.c  |  1 -
 arch/x86/kernel/smpboot.c          | 50 --------------------------------------
 6 files changed, 60 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 19e94af9cc5d..5c33f9374b28 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned long x)
 		return (x >> 24) & 0x0F;
 }
 
-/*
- * Warm reset vector position:
- */
-#define TRAMPOLINE_PHYS_LOW		0x467
-#define TRAMPOLINE_PHYS_HIGH		0x469
-
 extern void generic_bigsmp_probe(void);
 
 #ifdef CONFIG_X86_LOCAL_APIC
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 96d9cd208610..006a5d7fd7eb 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
 struct x86_legacy_features {
 	enum x86_legacy_i8042_state i8042;
 	int rtc;
-	int warm_reset;
 	int no_vga;
 	int reserve_bios_regions;
 	struct x86_legacy_devices devices;
diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
index ad53b2abc859..5afcfd193592 100644
--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
 	} else if (!strcmp(oem_table_id, "UVH")) {
 		/* Only UV1 systems: */
 		uv_system_type = UV_NON_UNIQUE_APIC;
-		x86_platform.legacy.warm_reset = 0;
 		__this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
 		uv_set_apicid_hibit();
 		uv_apic = 1;
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 6eb8b50ea07e..d628fe92d6af 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
 	x86_platform.calibrate_tsc	= jailhouse_get_tsc;
 	x86_platform.get_wallclock	= jailhouse_get_wallclock;
 	x86_platform.legacy.rtc		= 0;
-	x86_platform.legacy.warm_reset	= 0;
 	x86_platform.legacy.i8042	= X86_LEGACY_I8042_PLATFORM_ABSENT;
 
 	legacy_pic			= &null_legacy_pic;
diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
index b348a672f71d..d922c5e0c678 100644
--- a/arch/x86/kernel/platform-quirks.c
+++ b/arch/x86/kernel/platform-quirks.c
@@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
 {
 	x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
 	x86_platform.legacy.rtc = 1;
-	x86_platform.legacy.warm_reset = 1;
 	x86_platform.legacy.reserve_bios_regions = 0;
 	x86_platform.legacy.devices.pnpbios = 1;
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index fe3ab9632f3b..a9f5b511d0b4 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -72,7 +72,6 @@
 #include <asm/fpu/internal.h>
 #include <asm/setup.h>
 #include <asm/uv/uv.h>
-#include <linux/mc146818rtc.h>
 #include <asm/i8259.h>
 #include <asm/misc.h>
 #include <asm/qspinlock.h>
@@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
 	return retval;
 }
 
-static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-	CMOS_WRITE(0xa, 0xf);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-	*((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH)) =
-							start_eip >> 4;
-	*((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
-							start_eip & 0xf;
-}
-
-static inline void smpboot_restore_warm_reset_vector(void)
-{
-	unsigned long flags;
-
-	/*
-	 * Paranoid:  Set warm reset code and vector here back
-	 * to default values.
-	 */
-	spin_lock_irqsave(&rtc_lock, flags);
-	CMOS_WRITE(0, 0xf);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-
-	*((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) = 0;
-}
-
 static void init_freq_invariance(void);
 
 /*
@@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
 	 * the targeted processor.
 	 */
 
-	if (x86_platform.legacy.warm_reset) {
-
-		pr_debug("Setting warm reset code and vector.\n");
-
-		smpboot_setup_warm_reset_vector(start_ip);
-		/*
-		 * Be paranoid about clearing APIC errors.
-		*/
-		if (APIC_INTEGRATED(boot_cpu_apic_version)) {
-			apic_write(APIC_ESR, 0);
-			apic_read(APIC_ESR);
-		}
-	}
-
 	/*
 	 * AP might wait on cpu_callout_mask in cpu_init() with
 	 * cpu_initialized_mask set if previous attempt to online
@@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
 		}
 	}
 
-	if (x86_platform.legacy.warm_reset) {
-		/*
-		 * Cleanup possible dangling ends...
-		 */
-		smpboot_restore_warm_reset_vector();
-	}
-
 	return boot_error;
 }
 
-- 
2.11.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200331175810.30204-1-andrew.cooper3%40citrix.com.
