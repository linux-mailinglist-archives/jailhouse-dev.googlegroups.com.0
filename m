Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXV5T6RQMGQEK4M2TGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id C112C70A0ED
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:03 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id ffacd0b85a97d-3093e600770sf2498556f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528863; cv=pass;
        d=google.com; s=arc-20160816;
        b=Up9A4jd0KIR/NkNoj+7hEXn5pIdyHTcDD2nVIcFTnQq7v/LmC32i7J0fQbCfc1pp8j
         m7Vq0zRutv+W0A6Q3IFbhSA6x9E2bs+4VwezdhZoEEh6cZ4On3kn59d4G4QaqfGjm6Fn
         7NPnT8zJCujY63LD+keFgvvd830hfSa2RPlRL6YkTK4qXLMOQcT5eJMESTCaXwyxERSe
         hwAGyoL1T+0uCLcEWqZ9fgZm/j/KELQ331JIsBZ6QXk8IPJUzo3fioYtu/4tynigXFsu
         5BU2ZXTJ7rgy3hpbiwB7ZH7t8/Ccd6LkVSIl2WMl6uC8JU1n4//vzdbnDSKgpe8hzv6w
         p5zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dNx8hGrrnU+bf0mlXqFzLkXi/GSRtdrzgkcegG3CL2Q=;
        b=haUJLaoU1LZ90A6dsXVYLegoJrBpYih6BUhO35V3v5wUYRvDjhpb/fiEypeO2CNyfK
         4rVV2EIlZptYVo4t0LLsmCTzPyirZniOGQxuvVJTMNBS0fq96PH9O8VXxdfTAj3KtVcU
         RxeZse0rqDrjo738gP53Ty3xrJhtVQULjI0IcPZFZzryo5m+Ma2t/pzeDUInKF0/MwEj
         E8E+Ou9Dezef6K1ZXBb8ipG1IHGcDU9nXHcX06U0qp7oHQHigK64GUHrplUp0a4ZKYxz
         ffjzjIH9UJa8UpUKqd43VBtdB45/Kb3WW81VWn5SNzYh+RPI8HC6k48/aHZI+Dde9nR8
         UaQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528863; x=1687120863;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNx8hGrrnU+bf0mlXqFzLkXi/GSRtdrzgkcegG3CL2Q=;
        b=EVHCYfM6iRYjsvc0iEPbSeeckVbw2TpNMjAU5ARtvln0o4ViuKe30pTGuRkorGrVoA
         F6qPwNowB4dkS8meYmv3hRiUSFRXtdqUcs0w3ljP70oR6KeS4UiRIs3KY3Pt2RaKe7a9
         0vAohoiCPCOaoIrZ4vOjvOZXKnoEXQQizoATYOQ5Cx2fXnC5qUSgQEHWW7r45GamNWKs
         AHqkEX7vRVCmTgABRuMWRCgXPlq+kUWA6UJBkVrBFEkS7PNqZdrM1CImHWtEPzHzE91l
         MDOFuCUAKqCP3/tCvvBRnToAs0FUNgsunqdtV7TS9UhyT69ZBVctYsyvVnF+zfTgD1V1
         fHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528863; x=1687120863;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNx8hGrrnU+bf0mlXqFzLkXi/GSRtdrzgkcegG3CL2Q=;
        b=fOTN1ZM/VHIjdZ9F33pS/BK28w6vgmpw92PlbHN9bjQS4azNW345En8qurF7Fo5SLt
         8Pp3iT8fpTt3grm1DPVGJqQB++vuRe7etWeDRaiZAvhSD8UqxrC0/nM343u+w6GhWx7a
         TfqjaehWhKz4emN43BXkSCHTgPXljUF7FU1xdGoZ1T2zOvblfsr3H51k4+g0KN8QXYp0
         U7kBpGIpxxv+eAsSf/PTPcOs1IjMZbhtoybMXPXfch1hRZeb9jV8ndXqxDlpYxU0pOOZ
         iH5ad66sOA7whokjGnd39l+7OZUmn5PdKMYbBtWs92hot6fHGJUqZHGSIAFlkw3EdARu
         jiFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxiAjfo6jyKNGc39QVLvcw9eC8dsHRApKfkWTRMfZd9N48YXtLO
	zrH5ahpSXu3WxnM5AOnw+Tk=
X-Google-Smtp-Source: ACHHUZ6M6fPs5v4fQuveakiqzVGtg1QtK1MMfc7is2wDrN8H0nt+Q4dSzPFM05/xSG8167c+Yf4bLA==
X-Received: by 2002:a5d:5182:0:b0:309:4224:694d with SMTP id k2-20020a5d5182000000b003094224694dmr583367wrv.6.1684528863252;
        Fri, 19 May 2023 13:41:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:ccf:b0:3f1:7ad0:c355 with SMTP id
 fk15-20020a05600c0ccf00b003f17ad0c355ls588972wmb.0.-pod-prod-08-eu; Fri, 19
 May 2023 13:41:01 -0700 (PDT)
X-Received: by 2002:a1c:4c0e:0:b0:3f3:2b37:dd30 with SMTP id z14-20020a1c4c0e000000b003f32b37dd30mr2289659wmf.22.1684528861616;
        Fri, 19 May 2023 13:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528861; cv=none;
        d=google.com; s=arc-20160816;
        b=NLzyIMiNszgtw/RqXlcWqfxfVJqz2y4JePHrUkFmRcMYnIoPWuhya0j5IlsIPjjKjg
         mRpsxR3idyAABQc+HEvBe6/AKHnJMEehGO2YucFocIan8oFiu+5GcrlPiVeJNxzJMBb1
         Whq7gV1Bdl0mKNaeT9/pAmO5IiAWOQAWUokJuu5ZvR5WxmFIO7p6/Pe39GSz/NUcA8OT
         OG6h1QFbWOihuhEI7PaiqNJGJS1MgUUSziQzgZ8LQClb+sM7Fe7+h5MStAEW11HQen6z
         nckYw3IlZJFl0m0ybP8AQNWUTlhqY0elwyob1L3KMqNdD4DwMVxZx4qq49kn6pWNs38G
         pcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7ytJNFM8W8IKAppY6gyUKUIrvIEKKA0XKlidxukqbPg=;
        b=v1tPDGeKfOwUYGnEDp6SboTbFk4kOsLu00kqMJycoMsnx69p46O96sxODMOiX4F9T+
         xhXgsubuPSsUTfApvED4yY1udS90O5n/kGiLD5XCP8ypEV0TBXQ7DXsCDLCoXPUbWy/l
         z0GscVl9tUtyagSgZxUFDcmdEylrIWv5Uvv/jAbXlUajipPmY1nSrKo/q87ORPvUvs3i
         rTrDwbhvVy7cEJc4FFD8ACHBqWJWWPNvc1ukBz2M6xk4awdVcLMpT81+Zo3Fa/+s2PDS
         W4ELNg6n1q6DbQTZ+NlJCnsyqerYXQbYpM1UdgOO2aXIYvJccSyoPX5YINXAXQMB79nN
         iWNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p31-20020a05600c1d9f00b003f16ecd5e6esi612913wms.4.2023.05.19.13.41.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdm3cwTzy9r;
	Fri, 19 May 2023 22:41:00 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 59/73] core: riscv: add SSTC support
Date: Fri, 19 May 2023 22:40:19 +0200
Message-Id: <20230519204033.643200-60-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, CLOUD_WEB_HOSTS 0, CTE_8BIT 0, ECARD_KNOWN_DOMAINS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
 __TO_NO_NAME 0, __URI_CLOUD_GOOGLE 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0, __WEBINAR_PHRASE 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

SSTC (Supervisor-level timecmp) is an extension to bypass SBI calls to
control the platform's timer. If SSTC is available, the supervisor can
directly write the next timeout into the stimecmp CSR, instead of
conducting a SBI call. Furthermore, platform timer IRQs will directly
arrive at S-Mode resp. VS-Mode w/o M-Mode reinjection, which saves time
up on timer arrivals.

SSTC supports virtualisation: VS-Mode's stimecmp is shadowed by
vstimecmp. This means, if SSTC is available, we can save up to two
context switches for arming timers.

So we have drastically fewer exits with SSTC.

Linux (since v6.0) will discover and enable SSTC during the
initialisation of the platform timer, and from then on use the stimecmp
CSR for arming the timer instead of calling SBI. Actually pretty easy.

Some important notes from the specification [1]:

  - Discovery of SSTC is done via misa CSR, or via device tree. From the
    hypervisor perspective, we can also discover it via the HENVCFG CSR
    register, as the STCE Enable bit is a WARL bit. That makes discovery
    easy.

  - Spec says that the S-Mode hypervisor should write to vstimecmp if
    the VS_Mode guest decides to csr_write(stimecmp), as this saves a
    detour through SBI.

  - However, SBI calls are of course still supported

All we have to do is to discover the availability of SSTC, and the
migrate stimecmp to vstimecmp, and disable stimecmp. When disabling
jailhouse, we simply migrate vstimecmp back to stimecmp.

[1] https://drive.google.com/file/d/1f4DyxZMzl3yH7KGKXJFZ_iUY_AU9az_K/view

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[since RFC v2: If we have STCE, no need to forward the SBI call to
firmware. Simply 'inject' the timer to our guest via stimecmp. Add QEMU
workaround.]
---
 hypervisor/arch/riscv/include/asm/csr64.h     |  4 +++
 hypervisor/arch/riscv/include/asm/processor.h |  5 ++++
 hypervisor/arch/riscv/include/asm/setup.h     |  2 ++
 hypervisor/arch/riscv/setup.c                 | 26 +++++++++++++++++++
 hypervisor/arch/riscv/traps.c                 | 15 +++++++++++
 5 files changed, 52 insertions(+)

diff --git a/hypervisor/arch/riscv/include/asm/csr64.h b/hypervisor/arch/riscv/include/asm/csr64.h
index d0f39e8a..a12f3ffb 100644
--- a/hypervisor/arch/riscv/include/asm/csr64.h
+++ b/hypervisor/arch/riscv/include/asm/csr64.h
@@ -15,6 +15,8 @@
 #define _AT(T,X)	((T)(X))
 #endif
 
+#define CSR_STIMECMP	0x14D
+#define CSR_VSTIMECMP	0x24D
 #define CSR_SATP	0x180
 #define CSR_VSSTATUS	0x200
 #define CSR_VSIE	0x204
@@ -31,6 +33,8 @@
 #define CSR_HTIMEDELTA	0x605
 #define CSR_HCOUNTEREN	0x606
 #define CSR_HGEIE	0x607
+#define CSR_HENVCFG	0x60a
+#define ENVCFG_STCE	(_AC(1, ULL) << 63)
 #define CSR_HTVAL	0x643
 #define CSR_HIP		0x644
 #define CSR_HVIP	0x645
diff --git a/hypervisor/arch/riscv/include/asm/processor.h b/hypervisor/arch/riscv/include/asm/processor.h
index ed0d9a36..77ada05a 100644
--- a/hypervisor/arch/riscv/include/asm/processor.h
+++ b/hypervisor/arch/riscv/include/asm/processor.h
@@ -87,6 +87,11 @@ static inline void guest_clear_ext(void)
 	csr_clear(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
 }
 
+static inline void timer_disable(void)
+{
+	csr_clear(sie, IE_TIE);
+}
+
 static inline void ext_disable(void)
 {
 	csr_clear(sie, IE_EIE);
diff --git a/hypervisor/arch/riscv/include/asm/setup.h b/hypervisor/arch/riscv/include/asm/setup.h
index d8ba88db..8a0e6c98 100644
--- a/hypervisor/arch/riscv/include/asm/setup.h
+++ b/hypervisor/arch/riscv/include/asm/setup.h
@@ -10,5 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
+extern bool has_sstc;
+
 void __attribute__((noreturn))
 riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall);
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index f3cdfc06..b1b93d11 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -24,6 +24,8 @@ void riscv_park_loop(void);
 void __attribute((noreturn))
 __riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall);
 
+bool has_sstc;
+
 int arch_init_early(void)
 {
 	int err;
@@ -98,6 +100,22 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 	tmp = csr_read(sip);
 	csr_write(CSR_HVIP, tmp << VSIP_TO_HVIP_SHIFT); /* reinject pending */
 
+	/* try to enable SSTC extension, if available */
+	csr_write(CSR_HENVCFG, ENVCFG_STCE);
+	/* STCE is WARL, check its presence */
+	has_sstc = !!(csr_read(CSR_HENVCFG) & ENVCFG_STCE);
+	/*
+	 * If we discovered SSTC, then disable the S-Mode Timer and migrate it
+	 * to VS-Mode. Even if the guest doesn't use SSTC this is okay, as the
+	 * Timer will arrive regularly.
+	 */
+	if (has_sstc) {
+		tmp = csr_read(CSR_STIMECMP);
+		csr_write(CSR_VSTIMECMP, tmp);
+		csr_write(CSR_STIMECMP, -1);
+		timer_disable();
+	}
+
 	riscv_paging_vcpu_init(&this_cell()->arch.mm);
 
 	/* Return value */
@@ -123,6 +141,7 @@ riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 	void __attribute__((noreturn))
 		(*deactivate_vmm)(union registers *, int, bool);
 	unsigned long linux_tables_offset, bootstrap_table_phys;
+	u64 timecmp;
 	u8 atp_mode;
 
 
@@ -132,6 +151,13 @@ riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 	/* Do not return to VS-mode, rather return to S-Mode */
 	csr_clear(CSR_HSTATUS, HSTATUS_SPV);
 
+	/* Migrate the timer back to S-Mode */
+	if (has_sstc) {
+		timecmp = csr_read(CSR_VSTIMECMP);
+		csr_write(CSR_VSTIMECMP, -1);
+		csr_write(CSR_STIMECMP, timecmp);
+	}
+
 	/*
 	 * We don't know which page table is currently active. So in any case,
 	 * just jump back to the bootstrap tables, as they contain the old
diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
index b3bbe413..cccc47c7 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -105,6 +105,15 @@ static void dump_regs(union registers *r)
 static inline int handle_timer(void)
 {
 	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_TIMER]++;
+
+	/*
+	 * This routine must not be called, if SSTC is available: Either the
+	 * guest uses STCE on its own, or we catch the sbi_set_timer() call,
+	 * and set the guest's vstimecmp register.
+	 */
+	if (has_sstc)
+		return trace_error(-EINVAL);
+
 	sbi_set_timer(-1);
 
 	/* inject timer to VS */
@@ -204,6 +213,12 @@ static inline int sbi_ext_time(struct sbiret *ret, unsigned int fid, u64 stime)
 	if (fid != SBI_EXT_TIME_SET_TIMER)
 		return -ENOSYS;
 
+	if (has_sstc) {
+		ret->error = SBI_SUCCESS;
+		csr_write(CSR_VSTIMECMP, stime);
+		return 0;
+	}
+
 	/* Clear pending IRQs */
 	csr_clear(CSR_HVIP, VIE_TIE);
 
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-60-ralf.ramsauer%40oth-regensburg.de.
