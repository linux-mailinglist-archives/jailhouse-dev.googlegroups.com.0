Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBW4GRGPQMGQEZTZOIZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC068D672
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:04 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id n7-20020a05600c3b8700b003dc55dcb298sf8069852wms.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772764; cv=pass;
        d=google.com; s=arc-20160816;
        b=k5UYCGb74MN42DHcxocj3UO/rGl/QVhadhO0alIyjUfkDReKKJiLl71HdL/asz+Z1Y
         U7DA6RLiT+53NkTRHF7E/W0LgNOGTMB5stBmjK7MMQA2E+TQ5ByegjpQx6EDr97L7Px8
         JdFruPCGy4viOJ5WiYCvYByPqwnQ712j7NMfuQ4P7/znFxEXvK8Ntg0KL5VfUrLzEtcf
         xWO4hWQZtM2+YrkQgUH1pBUBMqJcdu7goNCcIxTtBlzfCj/WgkyqR9l3D4sbVIBjQ2Oy
         qdjQGsW22S4g4BfThWqJ2EJPX5qWzDFJ485mHghiaXy68ITZhKyAYZyUeF5mmFnaVXXA
         v0RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=IcSTdMJ42RNljlVMuNVtyWUjyBDE2KcNjAe1uyC9W/Q=;
        b=zI+RwOnOyO19uTmibhdfxXyJlO03e0ZKy+2RogXibFPToRgQuYxKgtcXxhHNYSEtgG
         dXrxAqCDq7AWaiCkgrInL/D72Zi9cNBL3AWjLZtUUH6vXZkgmQAlESb7RMRFfuVLYXJz
         IByLmjrPu6D4hk+xq2d4IBUjbQGI2yeaPsQySr+NPd/ZgbcGv9C7qixjl/NZLenZI3wS
         9SbcujCpIEtdsOUeyyngdS2w/TWDQ6LNzSAIcJ1SGQ9qu5QXF/1QX186xqthNfGFnQTz
         ZywCqMorFkoHDXizsk0dJZw8vxJxMDRkM18CaEvZC0NR4xWusXxVGK1Wg3Lp4Yu7zzCg
         GoTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcSTdMJ42RNljlVMuNVtyWUjyBDE2KcNjAe1uyC9W/Q=;
        b=qb0cJYrNQ6b4+zQWVFhfK4mMTsJeNW1zYxZwVxcQX0f3yjKJ0TOnIe+l76QWQ34+fj
         KsZJhqcyBpngTJOLb53Xbu74V+uJxLL+Ite9BrgrTjXeWSLu2c91v6kFOPjQCI8g3HKe
         MWInbzBBJJ8q8So2eh1IRDBqR2X3UJWcJpvEH3KHmIUzZvNFFJMNCHLVuL5zJcj4wC0+
         fnBrvzvHKIGEBtANpayw1CM4A9hPDte21voqf9Xhj65pfBmf8oniHVWAVtEMckEY6rcz
         SjPfD8WW8kvwU67entVk+jeXyWyQt005hH2WBpUdvCDTKAeheeplfGV6CrGtycluzKno
         RJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcSTdMJ42RNljlVMuNVtyWUjyBDE2KcNjAe1uyC9W/Q=;
        b=haZDnLtv9RY8bAU5TtRXE3SpTBb7/ObFOukLj1mZUX6fZuIGoUvSp9yCeaogzSUTOo
         ip3rHrybkCDzjgxeeBy8cUuRY42ajHsrgGB3QfVkxlk2XhsAa0w84VYK92LerLjr64Au
         nRJG3uHSmKe/9bCTPtOD+HXujvQy0CY1QpBVuGFpugMUzlNmx3NYIdjN9rVMQEEP9Xce
         YkScbvfPFIOI9FUqyV9jcyZTCq4JmkyGxP/GNQHU6cQYxmpzS5HUfzrC9vLCwpm1FZn0
         D132mQyeuVhJtbLG4GwTSYG1s9Stj1qlwjI+FBp9x5BBPXuyIV+g3eZ98PuA2pgodAas
         nUxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVjVB0DLztL1WuoTBpXakFUmhrX2L0ZSFia2dXLhFbHmpqBJ4JA
	l4uzD2WNs3N5Hb+irr8UvOg=
X-Google-Smtp-Source: AK7set/Fgi4MBXlpVA25uNDnOhvFt1Z8tvT/MpixfdU7JkI8uMH4rcfhEnNikxd1OACcmY9Gb3I08Q==
X-Received: by 2002:adf:de11:0:b0:2c3:f4f2:4a03 with SMTP id b17-20020adfde11000000b002c3f4f24a03mr93532wrm.345.1675772764268;
        Tue, 07 Feb 2023 04:26:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:18c3:b0:298:bd4a:4dd9 with SMTP id
 w3-20020a05600018c300b00298bd4a4dd9ls21076772wrq.1.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:02 -0800 (PST)
X-Received: by 2002:a05:6000:110e:b0:2bf:95fb:e5b3 with SMTP id z14-20020a056000110e00b002bf95fbe5b3mr2423718wrw.33.1675772762438;
        Tue, 07 Feb 2023 04:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772762; cv=none;
        d=google.com; s=arc-20160816;
        b=e+F7HMCKwCYugFhL97+noRDuISjKgy5TnNNQrWuN27zxoSuXot+EFURKbjNiNN3ZaO
         eu5ijj3MJCIy//MPtRRUUtLQg/51J/4oLVRXGTIGrgBa0REA0ZYew4CyevTKkKp2QD3g
         JPJzfwluXsoKBgFgshl2O22Zjr9MfSIoZU56+OoRzSXFeOBhFKold7zO8reRbjAOrdQi
         1Oyt/TxmNUUSwNtGyzAwRwkGi6FThoS3GrWfxN87slPHLQsz6Qpl87yxUWHY5nfIDWXK
         9ZdyQI4/axoVIWyAKqST4QXvqhfLhLBTtNQH2XCBXa+QsMUZ8ShKaNObSFZasqphnfbM
         X+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=f/JWOu5utajG+F84MHjY0gZVHAqmrgSKU2OtdE+zyiM=;
        b=yx6Evwmx0ULb5a5a6y7BvWEW7FwyMN8ZmdwRgfyXrvs2DKLOtcV2G1IXBDv2Kv2ryl
         H5UNpZNOcF9MEjotxj8waAnCMFl7+q8nqLOeLZbYlwE08otbZY4RgSlFs7K4+Ys8cUg5
         fj1Cahfo5srafuK2DFhWYtJhFf1PfUVJEDhvUMXBEUzj13xcZWQptjEGTkGZqB22zF37
         KAMK/4uedFO3t4tjqqww0zMcQfHRfFzxuqo5eYtyX7TyKzJwD/pE/vmE03mGVnFnF42+
         M26zLNNN1rVZzyzXZbMZ+/IKJXRImyRh5PlMKyOyUX6b5FHJ8NCuC3xRKcgUPh39/StH
         /JeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id r15-20020adff10f000000b002c3df588e35si489862wro.7.2023.02.07.04.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RF6vrjzy8J;
	Tue,  7 Feb 2023 13:26:01 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 03/47] driver: sysfs: prepare for exit accounting on RISC-V
Date: Tue,  7 Feb 2023 13:24:59 +0100
Message-Id: <20230207122543.1128638-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, TRANSACTIONAL 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_SUBJECT 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __SUBJ_TRANSACTIONAL 0, __SUBJ_TR_GEN 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Besides generic traps, we will have a bunch of RISC-V specific traps:

Platform handling:
 - VMEXITS_SBI: Calls from the guest (VS-Mode) to the SBI firmware

IRQ handling:
 - VMEXITS_TIMER: Timers will arrive in S-Mode
 - VMEXITS_IPI: IPIs arrive in S-Mode
 - VMEXITS_VIRQ: external IRQs arrive in S-Mode

Generally, using a simple PLIC, all IRQs will arrive in S-Mode.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[RFC v2: implement fine-granular SBI accounting]
---
 driver/sysfs.c                               | 24 ++++++++++++++++++++
 include/arch/riscv/asm/jailhouse_hypercall.h | 10 +++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index 61b851cc..54152859 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -163,6 +163,14 @@ JAILHOUSE_CPU_STATS_ATTR(vmexits_smccc, JAILHOUSE_CPU_STAT_VMEXITS_SMCCC);
 #ifdef CONFIG_ARM
 JAILHOUSE_CPU_STATS_ATTR(vmexits_cp15, JAILHOUSE_CPU_STAT_VMEXITS_CP15);
 #endif
+#elif CONFIG_RISCV
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_ipi, JAILHOUSE_CPU_STAT_VMEXITS_SBI_IPI);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_rfence, JAILHOUSE_CPU_STAT_VMEXITS_SBI_RFENCE);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_time, JAILHOUSE_CPU_STAT_VMEXITS_SBI_TIME);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_other, JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_timer, JAILHOUSE_CPU_STAT_VMEXITS_TIMER);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_ipi, JAILHOUSE_CPU_STAT_VMEXITS_IPI);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_virq, JAILHOUSE_CPU_STAT_VMEXITS_VIRQ);
 #endif
 
 static struct attribute *cell_stats_attrs[] = {
@@ -188,6 +196,14 @@ static struct attribute *cell_stats_attrs[] = {
 #ifdef CONFIG_ARM
 	&vmexits_cp15_cell_attr.kattr.attr,
 #endif
+#elif CONFIG_RISCV
+	&vmexits_sbi_ipi_cell_attr.kattr.attr,
+	&vmexits_sbi_rfence_cell_attr.kattr.attr,
+	&vmexits_sbi_time_cell_attr.kattr.attr,
+	&vmexits_sbi_other_cell_attr.kattr.attr,
+	&vmexits_timer_cell_attr.kattr.attr,
+	&vmexits_ipi_cell_attr.kattr.attr,
+	&vmexits_virq_cell_attr.kattr.attr,
 #endif
 	NULL
 };
@@ -221,6 +237,14 @@ static struct attribute *cpu_stats_attrs[] = {
 #ifdef CONFIG_ARM
 	&vmexits_cp15_cpu_attr.kattr.attr,
 #endif
+#elif CONFIG_RISCV
+	&vmexits_sbi_ipi_cpu_attr.kattr.attr,
+	&vmexits_sbi_rfence_cpu_attr.kattr.attr,
+	&vmexits_sbi_time_cpu_attr.kattr.attr,
+	&vmexits_sbi_other_cpu_attr.kattr.attr,
+	&vmexits_timer_cpu_attr.kattr.attr,
+	&vmexits_ipi_cpu_attr.kattr.attr,
+	&vmexits_virq_cpu_attr.kattr.attr,
 #endif
 	NULL
 };
diff --git a/include/arch/riscv/asm/jailhouse_hypercall.h b/include/arch/riscv/asm/jailhouse_hypercall.h
index 7d54047c..107d25e5 100644
--- a/include/arch/riscv/asm/jailhouse_hypercall.h
+++ b/include/arch/riscv/asm/jailhouse_hypercall.h
@@ -36,7 +36,15 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS
+/* CPU statistics, RISC-V-specific part */
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_IPI	JAILHOUSE_GENERIC_CPU_STATS
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_RFENCE	JAILHOUSE_GENERIC_CPU_STATS + 1
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_TIME	JAILHOUSE_GENERIC_CPU_STATS + 2
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER	JAILHOUSE_GENERIC_CPU_STATS + 3
+#define JAILHOUSE_CPU_STAT_VMEXITS_TIMER	JAILHOUSE_GENERIC_CPU_STATS + 4
+#define JAILHOUSE_CPU_STAT_VMEXITS_IPI		JAILHOUSE_GENERIC_CPU_STATS + 5
+#define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 6
+#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 7
 
 #ifndef __ASSEMBLY__
 
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-4-ralf.ramsauer%40oth-regensburg.de.
