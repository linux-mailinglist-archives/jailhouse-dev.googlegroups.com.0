Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2UGRGPQMGQEW4XNNJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE968D697
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:18 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id en20-20020a056402529400b004a26ef05c34sf9881207edb.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772778; cv=pass;
        d=google.com; s=arc-20160816;
        b=YNNn9xPvLDVsa407ZALS5xCCIxizHclhyd2VCmzehWPKugIFgiOwlLaFcXpmjMv57P
         NVRpL/Kkp48/5wpfbqab609blu235n5tp+T0RAodX6yDguwnJe/krtmc9KSLmpoxTB/r
         uk387zj7uvypitwF5JzKtwWKrRKtPzzJHQd3GaIqNsmzi3s7nItYR2/YG31r6vxrOtYB
         3ktG7ZFEZpGYm/35AdsX6aEbmBcibNDfXhxTVAFhCYsjZ3DVWHOSB5KrjFx/j4zztIvp
         BjhNmqhzZ51FrJK1/MEZiOIpUujORKlmigl5Shb2EgEK+agaI8rAzHpv/Ulkh+aD19L1
         14XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=RfdReV4CMGuVD6i3g6M3U2Jw9eacETaJKjIgh40hAzU=;
        b=S4zC5FKNf4je/mqKabqafqfc1xKWTlYkdz3AEdsAPaIT8SGTZqQdFtmGMgpuhAWAFd
         kgY+p8DgBQfsWZyJ8cEYH5B0GGIq8PoQ6bVU503Vku6QoXeNjmaVZJNr42DCE1/LKK0K
         PP0RjChDOqDjFiODtbgt8vezYwJ9sHXaZnC1S1eN5CAY1UglkpCN9oPdwjZsc33JnYBA
         eeEfSWaG6tLetSTGYaGwxY+YgmXoDcho4sn8vjmPf6jfUSD1yvK8j897Kl3tIgn3kf6I
         Tq+xBjSdHtxCsuFNoaGzKeWK1BXETlFoKIpTWbsvD2p5TAMU25xnd4qHwsEuhEFsq0WD
         0jHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfdReV4CMGuVD6i3g6M3U2Jw9eacETaJKjIgh40hAzU=;
        b=a925Iv0vIQRRJi1k/rGPh4CKLESdVpzxNoIKudEcHeHCSBW/O8EpwiVKCvLVYnos/w
         1LkExRFAYimxgG29r/E9kVNAA0fyUuA0e0DSXjusnxSWBmiZQoCzY/L8UOXQroUeQSf5
         doHohEypMcXlSEym3DNLNgtiLmw4J5xXKoMLaUVsHiMXMXNCh0cZ3tWpm3HOMteYPoTX
         ofTmv57L4DqUQEaP0xIN32uj81LV/5iTE6u9V3OtRvV2UBAUKUxfcu6PyKjfVPcQsv3w
         29i1HsW+Zpt6OU/P2ehKugPG45AO5rCV1MkH7gH1QdL3koX+n2jj7cqISswVEWEuwrp0
         34tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfdReV4CMGuVD6i3g6M3U2Jw9eacETaJKjIgh40hAzU=;
        b=iAb2Yeq4mv+MFJ5387XOlL77z2n/lTrjP6Sja6L9KhW5Vh7kdiwCg8hWa4GvSFDkZe
         QwoW0rQDq5QW3hAQimqDc9YdZiyXueEb7ItA5ltJoGQP76TF75zUVcjf0iZjSsJq70Cu
         u0uIZzxTeQ+sLC0UF6TZtghb6jYobepJWR2apkiWWlPdIXpL7fS03rx9uuBoSWx+ECu8
         D4I0h0Nhcnf7L+/siRrC/pvOCPmk5LfOGotiKdh1AbV/osCL+UpSFIeoSIRnDXb9+Z+L
         Ppby3fei/o7mm8NTzPuOKSdJEiV+UPU+A99+Mrya6HzOa/ZGscUFNmMRCTR8/nu+Ugaz
         pSow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUvl3oloeXqUunpr35NVQrb7p5mj2DUF33Yj74TmUKbKfw0C4Ij
	wMSRafNwldRtidgtWjC8sWI=
X-Google-Smtp-Source: AK7set+X808BaVvRKyIdSoP+IfnLvg+B7AmRke9QO0s94InQOk+XSiuGYxbZFRxJbaSur7H32cdHkw==
X-Received: by 2002:a17:906:4903:b0:88d:5c5d:6a6f with SMTP id b3-20020a170906490300b0088d5c5d6a6fmr801912ejq.236.1675772778544;
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c58f:0:b0:4aa:a13a:e7f5 with SMTP id g15-20020aa7c58f000000b004aaa13ae7f5ls8176006edq.2.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:17 -0800 (PST)
X-Received: by 2002:a50:9eca:0:b0:4a2:2e8a:14cc with SMTP id a68-20020a509eca000000b004a22e8a14ccmr3662327edf.1.1675772776973;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772776; cv=none;
        d=google.com; s=arc-20160816;
        b=evdVHHuCRf1AlTqXP6uVP87h+hIDJfHtxMamgII4FmnBbo53MoLMdOSULNdO89rgzK
         oqyEa9VxZCWKaZotMLCMkZzqyACVZ4Yv7q6N+pD/ax1e+WfnCDx91ymHYJ9uZIMCWCkk
         BKGNFS21Hny2dU+WZjrrEv7VdIuaCZWgvKNkWxPZRNQ6wqZfw9TJnVflpJkgTDn1I1j3
         ss7vlIVje+r5bxtZFjze3CM/RGovsMUfrH5mft89BFD+pOae6EkuDDZ40U0IDm0jzAod
         hOjIk1qhOHo7vWFm1/mxlU24K0b6jGJSCeF7g9xLInrCVnlI2iPDH59+f9sId7+1GaoN
         +I4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=L/tiZvCx52SeRbKlmdPaAAnKNSzQ8koklPzbUsvqLAQ=;
        b=k59j66d6qllT6uH7fFmIjADo6QQYPwKXSOXWbB5Vl7BSYhkmbMvPQ86+fTKK3mxCkn
         ebahR/UyHnI9nmL8rb16/e89UFrK+rtrWd+gpuB7B4/l0HVCM0TI9Akw40UuIINq6jmD
         7ddPwWlq4g4TYCL/a5ZS7p6Du4Sa1z5j5Wk2/73xAFok6zDmIvbLsGk09nqG+4/QjFFa
         mx0N/f3uemmmWDySIqnXIP56Bz2nYVzLy6RP1rKcBrAjIYgddWhl1fSnCaWjhYbjx+KG
         N42hBmUdY0h9PyR79RZiW7BLJnWJJql7Zr1acX4CSq3xMpoYJxmZ/D+psjC3zjF8gdtK
         JLxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id er9-20020a056402448900b0047014e8771fsi598508edb.3.2023.02.07.04.26.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RX2zM4zy8J;
	Tue,  7 Feb 2023 13:26:16 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 40/47] core: riscv: add SSTC support
Date: Tue,  7 Feb 2023 13:25:36 +0100
Message-Id: <20230207122543.1128638-41-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CLOUD_WEB_HOSTS 0, CTE_8BIT 0, ECARD_KNOWN_DOMAINS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0,
 __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_CLOUD_GOOGLE 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0, __WEBINAR_PHRASE 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
---
 hypervisor/arch/riscv/include/asm/csr64.h |  4 ++++
 hypervisor/arch/riscv/setup.c             | 25 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

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
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index eb925bcd..9f328456 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -25,6 +25,8 @@ void riscv_park_loop(void);
 void __attribute((noreturn))
 __riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall);
 
+static bool has_stce;
+
 int arch_init_early(void)
 {
 	int err;
@@ -94,6 +96,21 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 	csr_write(CSR_HCOUNTEREN, SCOUNTEREN_CY | SCOUNTEREN_TM);
 	csr_write(CSR_HTIMEDELTA, 0);
 
+	/* try to enable SSTC extension, if available */
+	csr_write(CSR_HENVCFG, ENVCFG_STCE);
+	/* STCE is WARL, check its presence */
+	has_stce = !!(csr_read(CSR_HENVCFG) & ENVCFG_STCE);
+	/*
+	 * If we discovered STCE, then disable the S-Mode Timer and migrate it
+	 * to VS-Mode. Even if the guest doesn't use STCE this is okay, as the
+	 * Timer will arrive regularly.
+	 */
+	if (has_stce) {
+		tmp = csr_read(CSR_STIMECMP);
+		csr_write(CSR_VSTIMECMP, tmp);
+		csr_write(CSR_STIMECMP, -1);
+	}
+
 	tmp = csr_read(sip);
 	csr_write(sip, tmp); /* clear pending */
 	csr_write(CSR_HVIP, tmp); /* reinject pending */
@@ -123,6 +140,7 @@ riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 	void __attribute__((noreturn))
 		(*deactivate_vmm)(union registers *regs, int errcode, bool from_ecall);
 	unsigned long linux_tables_offset, bootstrap_table_phys;
+	u64 timecmp;
 	u8 atp_mode;
 
 
@@ -131,6 +149,13 @@ riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 	/* Do not return to VS-mode, rather return to S-Mode */
 	csr_clear(CSR_HSTATUS, HSTATUS_SPV);
 
+	/* Migrate the timer back to S-Mode */
+	if (has_stce) {
+		timecmp = csr_read(CSR_VSTIMECMP);
+		csr_write(CSR_VSTIMECMP, -1);
+		csr_write(CSR_STIMECMP, timecmp);
+	}
+
 	/*
 	 * We don't know which page table is currently active. So in any case,
 	 * just jump back to the bootstrap tables, as they contain the old
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-41-ralf.ramsauer%40oth-regensburg.de.
