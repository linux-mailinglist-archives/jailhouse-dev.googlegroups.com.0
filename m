Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDW5UH5QKGQE7G4TY5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD2271EA3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 11:12:47 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id 6sf3936364lju.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 02:12:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600679567; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bwnaoinu5TtjEg60xoaHcZhiJv+7PQufZ4RH1g3bnCryRuOwsYFlnYKZbp92rlm9JS
         /LWXMD1T1Ex7quUeT00uUmN8BVkULnfMU1XAxTaFWhbbTE6y6oVmn2x7rLXE2+ouL8Mt
         j6pXiWMw1W4cTlxQNk2xgJ5Atn3Q+Z6sFbSyu4WsP5071WwbdoVevDVE9UrxQ44EPsaO
         xCPr5uLVS7PC404pSdEowUZ/Swq18e3OXyNnt506+zvP6AwBFrqQn40oukqkaEFNcYnX
         1WqOO+2qoA8VCMzlWvRreTQjdSIoZbNS2Xvrsj8QQ0pWpm30E8/wi4IGkoSSRKxaubhT
         TRQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=Sbw9K6YMwIFLNpD6q9NKaQRubu7gYdbn7GRyJQ8CGG0=;
        b=qiNACx6G8eYpqDj3rGgXPWQbaxaJ/UlqV9Lb0HsU4YnnK+9N8DklQ9ZkrzCOAEEgLC
         HTq49eRcHg4hXGxk6Q+NJrJd9hmpni68CWk2lHzou4QE9g85oI/r1ugJ1Q/Lraiz6NiA
         Z4OxjT1be6TCKdvovomFV6+IiVGUvrCA2fOdvgqi23Oh625lR9NY/SQT8R/MbzKeoj8g
         n4pK5wYvr59QlM+UC3sFxaM5tWj2lc4J58M3KPtbj8+uC1uYIK4ieHz+FbeUGS+j7V+V
         wo7OBtV7caP07sy9WpWUGD5pcTb7XwUpyMH8kkn7AMpsRLsxtvlwO5ZAc41TsgJNH9+G
         NgsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Sbw9K6YMwIFLNpD6q9NKaQRubu7gYdbn7GRyJQ8CGG0=;
        b=dFFkw2EytbhctqVFNVUiU+OJN/37zBFQ5Mh7an2N3nthL73R6GKqohVQ0JOKvdFyM7
         upRfKZ1zUW6kDE7aAk/VUjAgNmhzm84ZKuAO1CIh/zYhESwGuKb1A7+qXolNSgPtxJCn
         /zArDRRKKnFQsr09T8PDskgc0i3FFPPq1eYOQnpvSvQj/O6eTUN+GWFdf8ijxsH7UXun
         uguETsZczDUHrhSiZWKTByLANC2qeg2kr2xKysK7fFU4MnLgx7u7eLSFwQW5GD3pNf6H
         pN3Tq4llpMkIr3F2LzGyhXhyP8EbY0QcZfYnIt0vlsNbJcyp0ywb6j/Jk1RhIPbU/u5l
         zAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Sbw9K6YMwIFLNpD6q9NKaQRubu7gYdbn7GRyJQ8CGG0=;
        b=MTUCPw7/d077Mv6BipMwBI9XNiBrac/hdFaHF9Xt57N+yGHbAWn0pf49sj7o2n9uSD
         oCfX4v6UI2+PII7gHN3LZvlTPDVK89t+77/bABAGm1Vbt+VKtBcBAN+LdbqBK8FChl+Z
         pH7IMFhL9N9rfHEdjdpzzNykq16G9L/eHrGfaU0Ivpma91luDisDOkmOYXFAtLdR8Z3p
         YlIEMKVp9EUTHNKoA0KCY+NcOXYU1wn/1XfNB9cD2ssmvLMGjA4ogsNe91LfkOTrxbon
         XwApCoVAmU+p7nY4ocLBoF/0iVNfe4m2THCw3BPa0DM0ralLewjN0dUiBQlae3lC3qMv
         b+lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/2UvRUKTJgEuf5wvBDgGBO+UMiRmMe/vHDIm3gm7snJqKKhHi
	i++hVh1JMYzfffRPWe8MNG0=
X-Google-Smtp-Source: ABdhPJxIzWXJovjB91hBmyHfouLZGwH+xKmbaVJ8Ft9ltDRD1MEM18UVLlvCB2x+WcY0Es3GyyTF7w==
X-Received: by 2002:ac2:4a73:: with SMTP id q19mr14402988lfp.532.1600679567038;
        Mon, 21 Sep 2020 02:12:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls1557555ljh.11.gmail; Mon, 21 Sep
 2020 02:12:45 -0700 (PDT)
X-Received: by 2002:a05:651c:386:: with SMTP id e6mr17127687ljp.424.1600679565698;
        Mon, 21 Sep 2020 02:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600679565; cv=none;
        d=google.com; s=arc-20160816;
        b=D34D92h7M/Ojvp2INWok4fDoi1efKg70YQycu2G/I3/hIoISArlaRfxv4l4muI7hvN
         oC63PnHLhY13d4np6JeLTb54NwSzV+UFG9Zv/eEPf4YS7JdcyHulcq8FzS+NgHjFvBwo
         oiNkIj8Cpci3ReABWbz/K5zbHCzbwpslnSDZTu1qS3yLvD7CiarJwyprh84WzmFOPEZe
         t0tl87kVsZhTlDjwvqMWUrBrvbBJn717pbN103xBMBIi5EFDn1zNDxSB9qvgNzaDvbiT
         pYXL1HO9le9vOQ6+zvP2ICfmtMf8kQ1+4jx+/Tyd6v4HQaZt4O0qX+Bw/Mh1Nh9p0tt2
         UMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=ZHTFUF9ULN6WqQy8wvPieN21ttWpH92wVaY+aDz8H48=;
        b=D/KmGTw2mojuVAMRlEqzdGH+sav2as0fN7yYCdlAjY0DUx2ARm7rciL9UrMOC/GJcU
         3lIeKZsZ4Gz9sLItpbyZtl2CkKva7zOh0ixNre+qwSn+vqlaQSwjj74j9DvHB4E9IxXA
         XymgEJcVu9sLBYuLg0133PAulP5YpWJHB9eFpV5cbDYKFYfrY9w+c63Rt9HiOuqTjcS6
         +KQm+hqvB90OxxPl8JrezUvVgu3+4+SZSNoExXXHzET3VmYpqqSE6fg3KlcTLy4Kbo38
         DFTBMfQ7DGahujBoQlRBWukDX/Vhrg6wJPE95hylEzisnxYSui3zw0PcP7Ny3usuNcu8
         hebg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 21si209195ljq.5.2020.09.21.02.12.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08L9Ci3E009952
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 11:12:45 +0200
Received: from [167.87.4.147] ([167.87.4.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08L9Chql015414
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 11:12:44 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] hypervisor, inmates: Make spacing consistent in assembly
 constraints
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <73386d74-0b76-1e5f-11c0-ee35c72ca8eb@siemens.com>
Date: Mon, 21 Sep 2020 11:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/sysregs.h   |  8 ++++----
 hypervisor/arch/arm64/include/asm/sysregs.h |  5 +++--
 inmates/lib/arm/include/asm/sysregs.h       |  6 +++---
 inmates/lib/arm64/include/asm/sysregs.h     |  5 +++--
 inmates/tests/x86/sse-demo.c                | 10 +++++-----
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/sysregs.h b/hypervisor/arch/arm/include/asm/sysregs.h
index b7eaccf6..308278c4 100644
--- a/hypervisor/arch/arm/include/asm/sysregs.h
+++ b/hypervisor/arch/arm/include/asm/sysregs.h
@@ -288,17 +288,17 @@ asm(".arch_extension virt\n");
 
 #define arm_write_sysreg_32(op1, crn, crm, op2, val) \
 	asm volatile ("mcr	p15, "#op1", %0, "#crn", "#crm", "#op2"\n" \
-			: : "r"((u32)(val)))
+			: : "r" ((u32)(val)))
 #define arm_write_sysreg_64(op1, crm, val) \
 	asm volatile ("mcrr	p15, "#op1", %Q0, %R0, "#crm"\n" \
-			: : "r"((u64)(val)))
+			: : "r" ((u64)(val)))
 
 #define arm_read_sysreg_32(op1, crn, crm, op2, val) \
 	asm volatile ("mrc	p15, "#op1", %0, "#crn", "#crm", "#op2"\n" \
-			: "=r"((u32)(val)))
+			: "=r" ((u32)(val)))
 #define arm_read_sysreg_64(op1, crm, val) \
 	asm volatile ("mrrc	p15, "#op1", %Q0, %R0, "#crm"\n" \
-			: "=r"((u64)(val)))
+			: "=r" ((u64)(val)))
 
 #define arm_read_banked_reg(reg, val) \
 	asm volatile ("mrs %0, " #reg "\n" : "=r" (val))
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 5acd6d12..868ef887 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -175,10 +175,11 @@
 #define SYSREG_64(op1, crn, crm, op2)	SYSREG_32(op1, crn, crm, op2)
 
 #define arm_write_sysreg(sysreg, val) \
-	asm volatile ("msr	"__stringify(sysreg)", %0\n" : : "r"((u64)(val)))
+	asm volatile ("msr	"__stringify(sysreg)", %0\n" \
+			: : "r" ((u64)(val)))
 
 #define arm_read_sysreg(sysreg, val) \
-	asm volatile ("mrs	%0,  "__stringify(sysreg)"\n" : "=r"((val)))
+	asm volatile ("mrs	%0,  "__stringify(sysreg)"\n" : "=r" ((val)))
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/inmates/lib/arm/include/asm/sysregs.h b/inmates/lib/arm/include/asm/sysregs.h
index c0b137c7..ae61155d 100644
--- a/inmates/lib/arm/include/asm/sysregs.h
+++ b/inmates/lib/arm/include/asm/sysregs.h
@@ -102,14 +102,14 @@ asm(".arch_extension virt\n");
 
 #define arm_write_sysreg_32(op1, crn, crm, op2, val) \
 	asm volatile ("mcr	p15, "#op1", %0, "#crn", "#crm", "#op2"\n" \
-			: : "r"((u32)(val)))
+			: : "r" ((u32)(val)))
 
 #define arm_read_sysreg_32(op1, crn, crm, op2, val) \
 	asm volatile ("mrc	p15, "#op1", %0, "#crn", "#crm", "#op2"\n" \
-			: "=r"((u32)(val)))
+			: "=r" ((u32)(val)))
 #define arm_read_sysreg_64(op1, crm, val) \
 	asm volatile ("mrrc	p15, "#op1", %Q0, %R0, "#crm"\n" \
-			: "=r"((u64)(val)))
+			: "=r" ((u64)(val)))
 
 #else /* __ASSEMBLY__ */
 
diff --git a/inmates/lib/arm64/include/asm/sysregs.h b/inmates/lib/arm64/include/asm/sysregs.h
index 6d94a59f..fe6cb45b 100644
--- a/inmates/lib/arm64/include/asm/sysregs.h
+++ b/inmates/lib/arm64/include/asm/sysregs.h
@@ -90,10 +90,11 @@
 #define SYSREG_32(op1, crn, crm, op2)	s3_##op1 ##_##crn ##_##crm ##_##op2
 
 #define arm_write_sysreg(sysreg, val) \
-	asm volatile ("msr	"__stringify(sysreg)", %0\n" : : "r"((u64)(val)))
+	asm volatile ("msr	"__stringify(sysreg)", %0\n" \
+			: : "r" ((u64)(val)))
 
 #define arm_read_sysreg(sysreg, val) \
-	asm volatile ("mrs	%0,  "__stringify(sysreg)"\n" : "=r"((val)))
+	asm volatile ("mrs	%0,  "__stringify(sysreg)"\n" : "=r" ((val)))
 
 #include <asm/sysregs_common.h>
 
diff --git a/inmates/tests/x86/sse-demo.c b/inmates/tests/x86/sse-demo.c
index 237202d4..6b0801ca 100644
--- a/inmates/tests/x86/sse-demo.c
+++ b/inmates/tests/x86/sse-demo.c
@@ -39,7 +39,7 @@ void inmate_main(void)
 
 		printk("Testing SSE...\n");
 		asm volatile("addps %1, %0\t\n"
-			     : "+x"(f_result) : "x"(f_addend));
+			     : "+x" (f_result) : "x" (f_addend));
 		/* Test raw result */
 		EXPECT_EQUAL(*(u32*)&f_result, 0x4426c000);
 	}
@@ -52,7 +52,7 @@ void inmate_main(void)
 		printk("Testing SSE2...\n");
 		d_result = d_b;
 		asm volatile("addsd %1, %0\t\n"
-			     : "+x"(d_result) : "m"(d_a));
+			     : "+x" (d_result) : "m" (d_a));
 		EXPECT_EQUAL(d_result, 667);
 	}
 
@@ -60,7 +60,7 @@ void inmate_main(void)
 		d_result = 0;
 		printk("Testing AVX...\n");
 		asm volatile("vaddsd %2, %1, %0\t\n"
-			     : "=x"(d_result) : "x"(d_a), "m"(d_b));
+			     : "=x" (d_result) : "x" (d_a), "m" (d_b));
 		EXPECT_EQUAL(d_result, 667);
 	}
 
@@ -72,7 +72,7 @@ void inmate_main(void)
 	if (x86_cpu_features.pclmulqdq && x86_cpu_features.avx) {
 		printk("Testing AVX PCLMULQDQ...\n");
 		asm volatile("vpclmulqdq %3, %2, %1, %0\t\n"
-			     : "=x"(x_result) : "x"(x_a), "x"(x_b), "i"(0));
+			     : "=x" (x_result) : "x" (x_a), "x" (x_b), "i" (0));
 
 		EXPECT_EQUAL(x_result[0], 0x5ff61cc8b1043fa2);
 		EXPECT_EQUAL(x_result[1], 0x00009602d147dc12);
@@ -81,7 +81,7 @@ void inmate_main(void)
 	if (x86_cpu_features.pclmulqdq) {
 		printk("Testing PCLMULQDQ...\n");
 		asm volatile("pclmulqdq %2, %1, %0\t\n"
-			     : "+x"(x_a) : "x"(x_b), "i"(0));
+			     : "+x" (x_a) : "x" (x_b), "i" (0));
 
 		EXPECT_EQUAL(x_a[0], 0x5ff61cc8b1043fa2);
 		EXPECT_EQUAL(x_a[1], 0x00009602d147dc12);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/73386d74-0b76-1e5f-11c0-ee35c72ca8eb%40siemens.com.
