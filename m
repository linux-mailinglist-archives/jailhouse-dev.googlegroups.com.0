Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBAMR5CKAMGQEWHZ5RWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46F53CA76
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Jun 2022 15:11:32 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id e13-20020a05622a110d00b00304b71fae86sf5859536qty.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Jun 2022 06:11:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654261890; cv=pass;
        d=google.com; s=arc-20160816;
        b=De9Ok0IAR23LVJoAhxgGraumg48EzXEf2Ld5d1f9GmKjEekQAAs02Wx4jva4w8ixoQ
         kAsaslbIBPqrZBNY75TNzQ5Vf1NTbqoay8aUUo7QMuuymndQNMWcT0TJqbHi+7whrAEV
         aGyutHJYl5qYiX3O6Tqv0L5J7u8j+ZTaFjtSbl1l6aibFUfhkrB36YHf8FMhQaP1yoC0
         WVSjBXBmxHBMHu+KEcIbB18KeInPs3xTWoD3PcKu+7zaBriyziVAlJ/KTef+eRzRIy0x
         DBbvRt/PxFFLOr6c0pPoDZ09Ie8tDQDLO90WNpTwHeelGMBfpRz36Ivlt4qfYpHvYdTi
         luuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature:dkim-signature;
        bh=LdicnSON4dM9TbCanvVrY60nIbxZhBA5uHFvfhOa808=;
        b=u+ghJ1Pd75aLOP/AgNGsdoUnZixnfyipLjugzS6kQGXfByRRxK9fIsUd7g5xopC2YW
         M80lVMuzxkuArMx6VHswYa6EHrzIUv+sn/t2UuDJkLg4Tnr2IIMb9wr2eo8orU4h1OuU
         c3nUq2hs/WnyBQQWfAXLImAJfM5q0PDUrBLzXL2O1oV/8HhDOBJQKuJlPScaSgNorxIR
         PMWdmCBwfQjS44xVgJ/UoXvKfmkvnAHS+QOpBE/vMkKJVGiyJCQTDcXq2qwjyP7IX3zn
         455K4XBuLTJg52fKu/kEb6rYZl3CZtjxkG/XPQAc7NZ7Pq0VLPqat2MjWP87XzBrMa5N
         CjtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQsRFgmF;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::543 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LdicnSON4dM9TbCanvVrY60nIbxZhBA5uHFvfhOa808=;
        b=jFGp1FS4rkmCKlXJMVfo8hmUmSrS28AQGk5KROuJhNCdCM5QMRitjUeHbIx1YEp4vm
         i0PLnBBQD4C0eTrzK5ZpFQ5YuKBZg2V0Kbg3xZNxXgjlD6MzjhTYA9zgfz2Fyy0ilAHO
         MGoFGgmG9qQZKU0pt/XR5le3yC8rcGkEe8JZQz8/B0AZ7LZ1g8sHhiNniX3Q+TbkopjK
         d4AlbOoinNH8Z6Yn0UgQzUN/JEhdHU3N3OH5MFTXJRiM3MDfbIx/nQKg7IYc1OQh/6eU
         16HBCRk95kTbgfLshHffMtzXM3rRcfWsGe2jXF4vC+TE+mfn56zr46Wk9nctAwTnS+Ir
         U5DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LdicnSON4dM9TbCanvVrY60nIbxZhBA5uHFvfhOa808=;
        b=Xp7k9ZETIaqNelpOhn7TWqCLLzguLKA6m2e5si8NFuLi4AB/r2RebzFr11MNvsmFFZ
         HB0+Z45QLeadqZj5l6PTpbFAQOAkgQdedKLHA0d622hBRF7b9tjfrvzgx2brXNllTMuv
         NmkpDqQtoF3wc5lTy5/mylsklC2MFmX6Zp/GAvpHCJQ0mRy5eYx2aGIfzL1XHVTlYj81
         GCjEPkg5j++jNr+hEhr5pNx36TAzAE1KkkOsFz7VvbFILPNuRIErlUv+GkjtbnCW74Au
         a6D5iqFEWfOx16p7VQpofrJHGDpHED9Hcrk3JUXVVA7WeyiwzpyTtjwn3FlGmMnnis/q
         NH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LdicnSON4dM9TbCanvVrY60nIbxZhBA5uHFvfhOa808=;
        b=xCRyj7Zj+wIvEhRAN446vZ2psGTFSl/I9eneyNLHPrfSnAO8L/YTW5fcoD/c7kMoAy
         aVs26G1z+z0HwLco7WYAwd4szH7RT3EweKzqzZVAJJs/He0s/tYogDSVPMHF20yMYxED
         WFcr1O4UEdFfgA8zx04x5zLOhULFT3i1DTKSCdQO5H14kg4B2U0hTV4fKQzlZ6ElCZsC
         bjODvpMOEnh8rgBmsDPir44L/DpOb7iaBkzid5IGN7LJB+6sNVdI3CxNXwvzZBVrVhE9
         3uwfj5Tzr7foei4KQSQ1SVHSHMn5dKPNWnFrZaPnO9V1JT/I43oug315qeb9/mq+/wkI
         nbZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335FN3dEHteimsruYXo+YMABVKuylKZd3oPSzA08tvEloLgGYXZ
	SZzqFgGCbeHyy/UZZt4qYM8=
X-Google-Smtp-Source: ABdhPJx5GPErpnDw5J2w1DXB5HYzSq7LPlJTuTK7rZxIugm8CFwWmnx/fllaRJyG/M1Uiv43cFpgYA==
X-Received: by 2002:ac8:5fd6:0:b0:2f3:cf81:9821 with SMTP id k22-20020ac85fd6000000b002f3cf819821mr7210192qta.359.1654261889890;
        Fri, 03 Jun 2022 06:11:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4408:b0:6a5:96a4:9106 with SMTP id
 v8-20020a05620a440800b006a596a49106ls1181372qkp.5.gmail; Fri, 03 Jun 2022
 06:11:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a9a:b0:69c:4a99:ea50 with SMTP id bl26-20020a05620a1a9a00b0069c4a99ea50mr6282910qkb.632.1654261889160;
        Fri, 03 Jun 2022 06:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654261889; cv=none;
        d=google.com; s=arc-20160816;
        b=gwF2t3aucfsHcZz4C+tu6g3hd/ZPVVhkjHEvDyfjkqy5St5l1mHEnj1TzsTigbEGkE
         93CtKy56tNetptA7JmuaBogH87NdI2Qnd+L+lTutL7jZTBfuh5DUCFFZ30eixeuCc3SI
         GSAkSIEE7y8WwH2k1wQLJyeN7NHFaUtA/6wZCy689QKr9GIV0j+ain5wI/AAOkPnonoP
         +zV/I3FojNOMt6gct6DBftFwuoMG3h2VW/G4jSWIMuiq6Jef9G9YR+rswBuW0C4QjUne
         1fdd7GAXoriVFyRp2Z5cqdp6HkB7fWb3DD6+rR0kn3dKDgPClUGY8Iigd6eiFTDvtL7N
         WCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CaAlxoydFwcVD0avXcCnlpmzHlSjYt3KCxqaDAs2Ihc=;
        b=CJyhYIKHoHpxqPsl2fr6gamBtvSsnYO4hEIoZHWEU2XjxYK8Z1v0ZUkL4bIgP6ECk+
         2kxNHAiRGzOXL6sjjvE4t8+v98C2X32u/WEQiRt8prGQTusRKOAeXqYjH2DNEL850w7c
         JWd6LDt+yOKBWYkNTGxbnzAuHbE7LxKHJAka5kSILIZA0FI/okqNFEjo21mxoNX0vokj
         fFwDiZXU5j8SKNw15vQhJBWM9B36VsLC0QvngtUviAkM6fupW7kWDYcM2GG5ndTGvrSD
         /MBqfFBxz2JOLRo9xBuJnmE9aN7FjW7azYmcSSck1QBAmLhJgOjfORkPLx5CVxbXFqCJ
         JEyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQsRFgmF;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::543 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com. [2607:f8b0:4864:20::543])
        by gmr-mx.google.com with ESMTPS id 190-20020a3703c7000000b006a661401583si263385qkd.6.2022.06.03.06.11.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 06:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::543 as permitted sender) client-ip=2607:f8b0:4864:20::543;
Received: by mail-pg1-x543.google.com with SMTP id g184so7210005pgc.1
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Jun 2022 06:11:29 -0700 (PDT)
X-Received: by 2002:a63:844a:0:b0:3fc:e1a0:b80d with SMTP id k71-20020a63844a000000b003fce1a0b80dmr7107740pgd.616.1654261888502;
        Fri, 03 Jun 2022 06:11:28 -0700 (PDT)
Received: from ubuntu.hz.ali.com ([47.89.83.13])
        by smtp.gmail.com with ESMTPSA id g69-20020a636b48000000b003fbfe88be17sm5171495pgc.24.2022.06.03.06.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 06:11:27 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jan.kiszka@siemens.com,
	jailhouse-dev@googlegroups.com
Cc: gengdongjiu1@gmail.com
Subject: [PATCH v2] arm64: check whether HPFAR is valid before getting IPA
Date: Fri,  3 Jun 2022 21:11:24 +0800
Message-Id: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=LQsRFgmF;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::543
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

The HPFAR can be invalid if the stage 2 fault did not happen during a
stage 1 page table walk (the ESR_EL2.S1PTW bit is clear) and one of the
two following cases are true:
  1). The fault was due to a permission fault
  2). The processor carries errata 834220

Therefore, for all non S1PTW faults where we either have a permission
fault or the errata workaround is enabled, we resolve the IPA using the
AT instruction.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 hypervisor/arch/arm64/include/asm/paging.h  |  8 ++
 hypervisor/arch/arm64/include/asm/sysregs.h |  8 ++
 hypervisor/arch/arm64/include/asm/traps.h   |  2 +
 hypervisor/arch/arm64/mmio.c                |  7 +-
 hypervisor/arch/arm64/traps.c               | 89 +++++++++++++++++++--
 5 files changed, 105 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index e600cf58..4f0cb81c 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -198,6 +198,14 @@ unsigned int get_cpu_parange(void);
 				| (cpu_parange_encoded << TCR_PS_SHIFT)	\
 				| VTCR_RES1)
 
+/* Flags for get fault ipa from gva */
+#define GV2M_READ		(0u<<0)
+#define GV2M_WRITE		(1u<<0)
+
+/* Indicates address translation aborted */
+#define PAR_F			(1UL)
+#define PADDR_MASK		((1UL << 48) - 1UL)
+
 int arm_paging_cell_init(struct cell *cell);
 void arm_paging_cell_destroy(struct cell *cell);
 
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 868ef887..2c683832 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -117,6 +117,14 @@
 #define ESR_IL(esr)		GET_FIELD((esr), 25, 25)
 /* Instruction specific syndrome */
 #define ESR_ISS(esr)		GET_FIELD((esr), 24, 0)
+
+/* Fault status code of instruction specific syndrome */
+#define ESR_ISS_FSC(esr)	GET_FIELD((esr), 5, 0)
+
+/* Shared ISS fault status code(IFSC/DFSC) for Data/Instruction aborts */
+#define ESR_ISS_FSC_TYPE	(0x3C)
+#define ESR_ISS_FSC_PERM	(0x0C)
+
 /* Exception classes values */
 #define ESR_EC_UNKNOWN		0x00
 #define ESR_EC_WFx		0x01
diff --git a/hypervisor/arch/arm64/include/asm/traps.h b/hypervisor/arch/arm64/include/asm/traps.h
index a7c07624..0efedef1 100644
--- a/hypervisor/arch/arm64/include/asm/traps.h
+++ b/hypervisor/arch/arm64/include/asm/traps.h
@@ -25,6 +25,8 @@ struct trap_context {
 
 void arch_handle_trap(union registers *guest_regs);
 void arch_el2_abt(union registers *regs);
+bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa,
+				 unsigned int flag);
 
 /* now include from arm-common */
 #include_next <asm/traps.h>
diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
index 7fbfef75..70301ab3 100644
--- a/hypervisor/arch/arm64/mmio.c
+++ b/hypervisor/arch/arm64/mmio.c
@@ -43,7 +43,6 @@ enum trap_return arch_handle_dabt(struct trap_context *ctx)
 {
 	enum mmio_result mmio_result;
 	struct mmio_access mmio;
-	unsigned long hpfar;
 	unsigned long hdfar;
 	/* Decode the syndrome fields */
 	u32 iss		= ESR_ISS(ctx->esr);
@@ -57,10 +56,10 @@ enum trap_return arch_handle_dabt(struct trap_context *ctx)
 	u32 is_write	= iss >> 6 & 0x1;
 	u32 size	= 1 << sas;
 
-	arm_read_sysreg(HPFAR_EL2, hpfar);
 	arm_read_sysreg(FAR_EL2, hdfar);
-	mmio.address = hpfar << 8;
-	mmio.address |= hdfar & 0xfff;
+
+	if (!arch_get_fault_ipa(ctx, &mmio.address, GV2M_READ))
+		return TRAP_HANDLED; /* Try again */
 
 	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
 
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index 488dd7f8..10441b4b 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -33,6 +33,85 @@ void arch_skip_instruction(struct trap_context *ctx)
 	arm_write_sysreg(ELR_EL2, pc);
 }
 
+static bool check_workaround_834220(void)
+{
+        unsigned long midr;
+	unsigned int variant, revision, part;
+
+	arm_read_sysreg(MIDR_EL1, midr);
+
+	variant = (midr >> 20) & 0xf;
+	revision = midr & 0xf;
+	part = (midr >> 4) & 0xfff;
+
+	/* Cortex-A57 r0p0 - r1p2 */
+	if (part == 0xD07 && variant <= 1 && revision <= 2)
+		return true;
+
+	return false;
+}
+
+static bool hpfar_is_not_valid(bool s1ptw, u8 fsc)
+{
+	/*
+	 * The HPFAR can be invalid if the stage 2 fault did not
+	 * happen during a stage 1 page table walk (the ESR_EL2.S1PTW
+	 * bit is clear) and one of the two following cases are true:
+	 *   1. The fault was due to a permission fault
+	 *   2. The processor carries errata 834220
+	 *
+	 */
+	return (s1ptw == 0U) && (((fsc & ESR_ISS_FSC_TYPE) == ESR_ISS_FSC_PERM) || check_workaround_834220());
+}
+
+bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa, unsigned int flags)
+{
+	unsigned long hpfar, hdfar, par, tmp;
+
+	u32 s1ptw = ESR_ISS(ctx->esr) >> 7 & 0x1;
+	u8 fsc = ESR_ISS_FSC(ctx->esr);
+
+	arm_read_sysreg(FAR_EL2, hdfar);
+
+	if (hpfar_is_not_valid(s1ptw, fsc)) {
+
+		/* Save current PAR_EL1 */
+		arm_read_sysreg(PAR_EL1, tmp);
+
+		/*
+		 *  Performs stage 1 address translation, with permissions as if
+		 *  writing to or reading from the given virtual address from EL1
+		 */
+                if ( (flags & GV2M_WRITE) == GV2M_WRITE ) {
+                        asm volatile ("at s1e1w, %0;" : : "r" (hdfar));
+                } else {
+                        asm volatile ("at s1e1r, %0;" : : "r" (hdfar));
+                }
+
+		isb();
+
+		/* The resulting address can be read from the PAR_EL1 */
+		arm_read_sysreg(PAR_EL1, par);
+
+		/* Recover current PAR_EL1 */
+		arm_write_sysreg(PAR_EL1, tmp);
+
+		/* If PAR_EL1.F = 1, address translation aborted */
+		if ((par & PAR_F) == PAR_F) {
+			printk("Failed to ipa!\n");
+			return false;
+		} else {
+			*ipa = (par & PADDR_MASK & PAGE_MASK) | (hdfar & (~PAGE_MASK));
+		}
+	} else {
+		arm_read_sysreg(HPFAR_EL2, hpfar);
+		*ipa = hpfar << 8;
+		*ipa |= hdfar & 0xfff;
+	}
+
+	return true;
+}
+
 static enum trap_return handle_hvc(struct trap_context *ctx)
 {
 	unsigned long *regs = ctx->regs;
@@ -71,7 +150,7 @@ static enum trap_return handle_sysreg(struct trap_context *ctx)
 
 static enum trap_return handle_iabt(struct trap_context *ctx)
 {
-	unsigned long hpfar, hdfar;
+	unsigned long hpfar;
 
 	if (this_cpu_data()->sdei_event) {
 		this_cpu_data()->sdei_event = false;
@@ -83,11 +162,11 @@ static enum trap_return handle_iabt(struct trap_context *ctx)
 		return TRAP_HANDLED;
 	}
 
-	arm_read_sysreg(HPFAR_EL2, hpfar);
-	arm_read_sysreg(FAR_EL2, hdfar);
+	if (arch_get_fault_ipa(ctx, &hpfar, GV2M_READ))
+		panic_printk("FATAL: instruction abort at 0x%lx\n", hpfar);
+	else
+		panic_printk("FATAL: instruction abort and can not get ipa\n");
 
-	panic_printk("FATAL: instruction abort at 0x%lx\n",
-		     (hpfar << 8) | (hdfar & 0xfff));
 	return TRAP_FORBIDDEN;
 }
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220603131124.2007946-1-gengdongjiu1%40gmail.com.
