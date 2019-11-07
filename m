Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR5DSHXAKGQEORCNB5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DFF358D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 18:18:00 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id k30sf634892lfj.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 09:18:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573147079; cv=pass;
        d=google.com; s=arc-20160816;
        b=VTjLLIu9kmJvAUq29CNZ+34s/peHkI6xnv7N/6wfZaMamixm5bSOuErfA1ChdFihc8
         cYZ+/xwBejG1uTLRnVEaNc/SG7e1135sB+SjaH7Ypl//lcR6kD19GalliIcM//OciO6z
         1+si4yB00RmpAWDDbo8oWeiJh3jT81sZgDpQ1eAEToLl0yIbxTaFuJvvly4ekd95GT3/
         XMhaGFNDYbS+NAspHaigDzsP8EvTcb6Am83QjYtwkNro9ObAU1eOhcrSJx7E63D3lLKi
         RA6oG2o7M+nra314+GMaR+/f3hLSUi1PAwlHi07AwA2zNdApVMkSdPjvG9WR2yHI6fol
         4wCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=8fH7ffJVplIMipSHNvH57LiZWuA/EBaez+Avp6bTb2A=;
        b=HJYCQ+m+SpyGOMAH+ja7+hlS6jt935ecbv0OsRDhE10hZ+7mQGzkMeSc9wKz77Oy7K
         Z4lr9UE+BPMbFD2habZKibhqVQbQMBUseIQlzv91mydJuv83qi3b7Etq4wWllNHStEz1
         pAMmyQ9UuLurUgdUES3ElySlOwt3trFLDV7CAcGKSIdoXvKN2+/8jVwnRkx/ieedqLFK
         qqEISYp9vi9IhnY32Z72z6zhBwBGA/Su0Gr4lSriWs7tS9EUBusmYXaTrQ7kyu6vn5I8
         e2P3jfk73HPybnOK12/cyHrQ4GMpaz5uaP6y/rw6EKscT5z2uB/YhDlvmlk6cCrwUDR6
         umrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8fH7ffJVplIMipSHNvH57LiZWuA/EBaez+Avp6bTb2A=;
        b=lKPgH/qT94UnsyGgGumKb1Beb74WBk+6eWGJmIGJGpRxC2UR+D+bwVUIn4nKe0+cO1
         zu5jMqLnyKks7WKlereadWbTeG2LMTOt0f6zsjEp1O/TEQ/ILmGkgHkDkEoe9mXIEyBu
         DwftdX9Fbqoy5dli38++tPNq28wBG2Z4LZu5H6SopHXlHbq+0k8XLcJyLVtH2ZZMaB98
         5qTImVY9EXwQQmPIxrJxPrQm1Lbr7B1n9k40rYl2Pa3g0VcrCRoUVYRbPqHQ39lUSSt3
         yOh7fYrVdq1EulxvxMnaZXA9lK92fMhP8l6r0Ux81sBKAroCU2n/TJFnSmXXZ60nTAso
         0RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8fH7ffJVplIMipSHNvH57LiZWuA/EBaez+Avp6bTb2A=;
        b=r5T3FZ2RYEGnCI2Fl/o/diExIUdo37jhL1MYiBINzH76LmwT3kg6M5pO7HV2vooAV5
         h3hm54R49HhMX1mewR4LQz323jVNEuzS5b+dFc58GcGWb25Qtz89sAeNiWbqE6RROuZO
         +/aLGjB5QksEZezZqDfCa96m86hJxU187uPbOu3uTQ6D8B4yBPsUo/XAZMIWIYVU6fG6
         AHuy2/1wuKPjTXbtPRZMHZNq2OT1Y4wnL2kHEqnv66AXU9bw3cXJxyg38UVHBKITTRgU
         NB9SgE4fm9iD+zK4DZdvDD+/mcZZ0w4ZqwfYcruYN2CMlbPyhwwEAXIWQy1xSh5BunYS
         G8nA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWVNKZoHJxox8HIge1liY+HZ3cE4Bpz75zifhwSDHdaL3dEB2Dm
	XS4F52cv56I9v7DXlAmf3T4=
X-Google-Smtp-Source: APXvYqyCCHCDnFdgKI4l3BwlTv4CG/kiwGN9CcUCA2QZavZYvJbmWbk+iAgFe5F630jQ6e5N9flbEw==
X-Received: by 2002:a19:4314:: with SMTP id q20mr3019107lfa.146.1573147079712;
        Thu, 07 Nov 2019 09:17:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:40d7:: with SMTP id n206ls1254471lfa.10.gmail; Thu, 07
 Nov 2019 09:17:58 -0800 (PST)
X-Received: by 2002:ac2:5967:: with SMTP id h7mr3020486lfp.119.1573147078768;
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573147078; cv=none;
        d=google.com; s=arc-20160816;
        b=Rwd4XXaJbFKCaAV3mdhRkIFOjJCwCLW2Z1dtOg0ilHdA26y4vLj+xOI6CaBRePljUD
         ZkRYmHILA9Cs6oks8lSk/FhJpkRcYYuqvIguaSrsImPWakVnRLRPSkOzJGNXRThMEfk3
         XWxh2t6R6AxL+4RtIqrqoSBiKvwlYs8Z2dYv89N0lBxbAk3CCCMcCe4Kn/g3tynMFX1/
         7MwFMsOI2bTZdh9w8BH2gZcdzqEp+b/1QuDAoWMv26Q7GmimZfCaTDAzwbxeXdSmlu/L
         OHDZs1anMgh/sVkvceoblxeHwpuZX5rxEZYpXMhAsupV6kVrmPvVmarqvcfNmRFj3KFj
         rbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=ygyy25xJV4A0zKubjm6qWN7n2ibr6xbcengNjKXVdTw=;
        b=zjApPEr6b66MmAJC1fXvcuNX5F56LPq9CUQoHkm+y/hzCe5uAHwdp8aUuWB53+LbaO
         zPIz+oRWvrVfFDZG381BimijoZTfyRgBwGUqvBkdCRWPTt6o+mJxUch0KOq2ehBnlqpM
         8etVyeQXaeHfwTfIuuxrRZSKZJJ7ekVaUbud2QO9AbUogde4vF9QYLzAuZG5MhMPhsks
         mUP8csouQyC5GCND+KhW9fE1AoZSQWwLCueD02JpttlfVPHZt7OKMhlxI7sS8pT1cpwX
         fdmtC9zzvfom6xopSkDqMU1BdUogrYLJkc7JsBVoqJYFYnYaJcKQmEPBuZGJS0+Uz7jk
         jUWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h21si225499lja.5.2019.11.07.09.17.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xA7HHwtU017955
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA7HHvr1012202
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/4] jailhouse: Back-port fixes to 0.11
Date: Thu,  7 Nov 2019 18:17:55 +0100
Message-Id: <810bdfe01d2325e45c471f72af12636f12806043.1573147076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
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

These are needed on x86 to run with upcoming start-qemu.sh changes and
to fix issues with PREEMPT-RT.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...1-x86-Permit-root-cell-to-enable-CR4.UMIP.patch |  28 +++++
 ...ic-Rework-and-fix-redir-entry-programming.patch | 115 +++++++++++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |   4 +-
 3 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch

diff --git a/recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch b/recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
new file mode 100644
index 0000000..faa3ff6
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
@@ -0,0 +1,28 @@
+From 6820b515e9a71f5490a36d2a5041e21ab4ea1e4b Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 3 Nov 2019 11:44:24 +0100
+Subject: [PATCH] x86: Permit root cell to enable CR4.UMIP
+
+This is safe from hypervisor perspective.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ hypervisor/arch/x86/include/asm/processor.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
+index d8111690..d22a60d7 100644
+--- a/hypervisor/arch/x86/include/asm/processor.h
++++ b/hypervisor/arch/x86/include/asm/processor.h
+@@ -66,7 +66,7 @@
+ #define X86_CR4_VMXE					(1UL << 13)
+ #define X86_CR4_OSXSAVE					(1UL << 18)
+ #define X86_CR4_RESERVED				\
+-	(BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))
++	(BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | (1UL << 12))
+ 
+ #define X86_XCR0_FP					0x00000001
+ 
+-- 
+2.16.4
+
diff --git a/recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch b/recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
new file mode 100644
index 0000000..e286e0b
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
@@ -0,0 +1,115 @@
+From bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Mon, 4 Nov 2019 09:10:13 +0100
+Subject: [PATCH] x86: ioapic: Rework and fix redir entry programming
+
+Currently, EOI of level-triggered IOAPIC interrupts may not work while
+the related entry is masked - at least with QEMU as machine and
+PREEMPT-RT as root cell. This is because we always overwrite trigger
+mode and vector information when masking an entry.
+
+Let's use that issue to rethink the programming pattern. The new one
+works by still avoiding to map while masked but writing the entry with
+an invalid remapping index. Furthermore, a redirection entry is only
+updated in the IOAPIC on writes to the lower 32 bits. This is to ensure
+its consistency. Writing higher bits happens first, either out of masked
+state or with the identical value.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ hypervisor/arch/x86/ioapic.c | 69 +++++++++++++++++++++++---------------------
+ 1 file changed, 36 insertions(+), 33 deletions(-)
+
+diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
+index ee3b77f3..7b243097 100644
+--- a/hypervisor/arch/x86/ioapic.c
++++ b/hypervisor/arch/x86/ioapic.c
+@@ -114,49 +114,52 @@ static int ioapic_virt_redir_write(struct cell_ioapic *ioapic,
+ 	struct phys_ioapic *phys_ioapic = ioapic->phys_ioapic;
+ 	struct apic_irq_message irq_msg;
+ 	union ioapic_redir_entry entry;
+-	int result;
++	int result = 0xffff;
+ 
+ 	entry = phys_ioapic->shadow_redir_table[pin];
+ 	entry.raw[reg & 1] = value;
+ 	phys_ioapic->shadow_redir_table[pin] = entry;
+ 
+-	/* Do not map the interrupt while masked. */
+-	if (entry.native.mask) {
+-		/*
+-		 * The mask is part of the lower 32 bits. Apply it when that
+-		 * register half is written.
+-		 */
+-		if ((reg & 1) == 0)
+-			ioapic_reg_write(phys_ioapic, reg, IOAPIC_REDIR_MASK);
+-		return 0;
+-	}
+-
+-	irq_msg = ioapic_translate_redir_entry(ioapic, pin, entry);
+-
+-	result = iommu_map_interrupt(ioapic->cell, (u16)ioapic->info->id, pin,
+-				     irq_msg);
+-	// HACK for QEMU
+-	if (result == -ENOSYS) {
+-		/* see regular update below, lazy version */
+-		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
+-		ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
+-		return 0;
++	/*
++	 * Do not map the interrupt while masked. It may contain invalid state.
++	 * Rather write the invalid index 0xffff. That will not be used anyway
++	 * while the mask is set.
++	 */
++	if (!entry.native.mask) {
++		irq_msg = ioapic_translate_redir_entry(ioapic, pin, entry);
++
++		result = iommu_map_interrupt(ioapic->cell,
++					     (u16)ioapic->info->id, pin,
++					     irq_msg);
++		// HACK for QEMU
++		if (result == -ENOSYS) {
++			/* see regular update below, lazy version */
++			ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
++			ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
++			return 0;
++		}
++		if (result < 0)
++			return result;
+ 	}
+-	if (result < 0)
+-		return result;
+-
+-	entry.remap.zero = 0;
+-	entry.remap.int_index15 = result >> 15;
+-	entry.remap.remapped = 1;
+-	entry.remap.int_index = result;
+ 
+ 	/*
+-	 * Upper 32 bits weren't written physically if the entry was masked so
+-	 * far. Write them unconditionally when setting the lower bits.
++	 * Write all 64 bits on updates of the lower 32 bits to ensure the
++	 * consistency of an entry.
++	 *
++	 * The index information in the higher bits does not change when the
++	 * guest programs an entry, but they need to be initialized when taking
++	 * their ownership (always out of masked state, see
++	 * ioapic_prepare_handover).
+ 	 */
+-	if ((reg & 1) == 0)
++	if ((reg & 1) == 0) {
++		entry.remap.zero = 0;
++		entry.remap.int_index15 = result >> 15;
++		entry.remap.remapped = 1;
++		entry.remap.int_index = result;
++
+ 		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
+-	ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
++		ioapic_reg_write(phys_ioapic, reg, entry.raw[0]);
++	}
+ 
+ 	return 0;
+ }
+-- 
+2.16.4
+
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
index 5df3597..999ede7 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
@@ -14,7 +14,9 @@ require jailhouse.inc
 SRC_URI += " \
     file://nuc6cay_0.11.c \
     file://linux-nuc6cay-demo_0.11.c \
-    file://0001-arm-Fix-build-with-gcc-8.patch"
+    file://0001-arm-Fix-build-with-gcc-8.patch \
+    file://0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch \
+    file://0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch"
 
 SRCREV = "58052a7a9d1f5904d72b1637282c877172ee69f6"
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/810bdfe01d2325e45c471f72af12636f12806043.1573147076.git.jan.kiszka%40siemens.com.
