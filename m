Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZ55T6RQMGQEBYKMLWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id B34DE70A0F8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:11 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 5b1f17b1804b1-3f4fa463282sf24089165e9.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528871; cv=pass;
        d=google.com; s=arc-20160816;
        b=CkfGDbJ+1SWmPSVbqmMB/6xxs3GWx7XmvUYCNlGduz0+x+9xmP/r2SwAcC+CwepFNf
         P744Z1vx12d87OSt7eY90r5kKa2oXzZ7xr3NS1Zoi7qVx8C7FILuGDCm1OrrLH0IktAU
         Exh0uxY7QZKlDIsmUsCMHFzkqxKA3g2GV729eq6kphs6m9fwNI3H8UgvAtPhKoG3oDCe
         RfKWKJCtRkC11jOEi1MviA63vyJJuf0I3TBAC1RBJgDV5RQU4nAsEGcbOYPwNtpE4k55
         eOqDC+7NLbg4ijD9PZQagZh9R53fBpaoF2tfhNYvvOQfUXk2P8pnsM+ZRq1jvhhwBrTj
         3NNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=B9Ep1qSWAh+tdqMGacPRTpQqjiqGk+Tud7aTnVQOZao=;
        b=nfhmsCG6UpS5sQKDnJW03j5SZT1W7p0T77+2JXTHTVdp0C6mx8fin8qYxV5jcFUvMe
         iqN4b4ksP5KtPLcOzueInuNtPKuY3+v1M7dF4p9bjQH1Oc+upjtuodwL9IUGNh4tszov
         ipQh7t40tKkcWDDsEKpIz1LgPqQcpMipumPJ6/fREJWBkAZEpaK1KY0oYeSnMPhXApQy
         UZ7RMOEOtlbzWLoRAIHvSGpX7XOhnP/T6+L3GepY4DprjNrgUveZu5TpHuIJCWJECRDr
         Uw87BHCM7drBq73ZqUQi2s1BxPnwdVd4o+I7OHzYhrfasUN++wQvJKwPsiKVme1idg+0
         MOiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528871; x=1687120871;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9Ep1qSWAh+tdqMGacPRTpQqjiqGk+Tud7aTnVQOZao=;
        b=eHJ/8OoziuDNDYAz41lQjFgK/A88HvNieVqkM0ixv6Wkp5nsgAUPmt0U0c7VYHY5ov
         9Y+LHcWzsT+fW6xUtdOxRHdJqKVFJlVEkGqUnAlItqNFFBJZFxfIGbxWEQsy9g9vrJlo
         bIkycevka2t8x8TUYfHIFhyM92yZf9F5BMf9bthokQbieHtc8osmYQ9gsSgxhWykzoCZ
         InBVm8iwsID4KJyEk1HfOi+vODS+L9gT8g4AuYC6HZhpiDMgrVzTdR/GqtG2h58wEICJ
         pZ0+7Q5fgzDkZnnUO13PnLnKbWz/D1IWtemVe1O6AybyZFwXBfq3TqtTFRf4doP7K+fo
         Y8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528871; x=1687120871;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9Ep1qSWAh+tdqMGacPRTpQqjiqGk+Tud7aTnVQOZao=;
        b=IAWW1I0MLon5BQeydeRq3F/11LyS8YjNx6IIM0C16tm0YgwR/DxRttYmCJHHfB3W9K
         xwSlVBtIN0ikZ9f6UjLUgnuKEq9eM5X77gTlRIWd1PoRyzbP0dhHCQJlrYEXmjmhDFyg
         /Y/la0drIQ3o6oXblAHXHMJu2xZv++rq/TgPnN6TSYeKs1KK7qUc/CAbO2eKUapx70y6
         0hZAtTDzlJSYCocxeRbUGYlk0T4AutFycFggy3Kl78uiB5zhd+UE6MHVFQ3nWQKBcL6A
         wjYTqAgMX5JoBEGBSZIozNcJbu9k2QaAggj9c46/Iy06Eqp4ankqHP9Lxzounqmr50gF
         EzNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz74Z4OYAdxO9fghVz6XFt1QV5fFucdU0oRJ8dTZlwm9udIB6JB
	TDr/gY6+OVJV2n76BQdkQT8=
X-Google-Smtp-Source: ACHHUZ6S95F6PSHQGzDphOuiPKkPjnuSfp7e2f0aIYJ/tquqJhyT4i1IGgS9eIHdbaXi/e1jCa9yUQ==
X-Received: by 2002:a1c:f614:0:b0:3f4:2374:3513 with SMTP id w20-20020a1cf614000000b003f423743513mr531490wmc.1.1684528871518;
        Fri, 19 May 2023 13:41:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:602:b0:306:3b67:c22c with SMTP id
 bn2-20020a056000060200b003063b67c22cls522005wrb.1.-pod-prod-08-eu; Fri, 19
 May 2023 13:41:09 -0700 (PDT)
X-Received: by 2002:a5d:5589:0:b0:306:2c01:4f08 with SMTP id i9-20020a5d5589000000b003062c014f08mr2571767wrv.21.1684528869876;
        Fri, 19 May 2023 13:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528869; cv=none;
        d=google.com; s=arc-20160816;
        b=w2oOFV6y/dwtbNwkz8CrxvXOooD/LcTFEjFJgH383LS/w6MzYS7ptYtz6QqNke0q4W
         ZhzEFTmZPadit6UPb+GWx5ooKZrM4zmxC3oGXto7DfSviwxniPTATSsXrxk5X7fRl8FY
         DkK0GHQafzIMibYOvV/Fn509X6+tZIQpMOEPONcTVjoYa3ujWH9DJSrlLvecZlXvn+1S
         VyqmsbGf/MlUIBcNBtOlQy1vNZ2YAnWrnaaG1x5LVxJonLb58Np3UMI5Bp9tavlJ95GQ
         LjSp1c8pdPgxXqREt8zny7HXwFu/LqAPvJClTpEsjFTnKLnbk508KdtrpuJPrSKMBl/S
         bSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=maJaHAl90LkMuCIc5hwhv7tArBS33+Skxa/AvEtx9Us=;
        b=Y8m35UWaaLv0ODvYGb/uIx0uu9aEe7oSJ+jjIA94bdLuS2tZGOTXoI1VnqQA+xufGM
         ZFVXp8hvLShcI47WT+vuKKTI/kH4KqW9bp05ViEiKt8xyxUkNKIR+CQvt4Kjlr26CblH
         97bAQ1NYOL9c4N+ObPkS99dKzGEFe/pmzP4WxSDkqIw8OzljHPUyVccI9YWe6yMbIOto
         LX22SDzvpTkKhJxWQ+dosnu5wJ2otupnkaIP4YPHg2nzspykOOq2aZ831ptu2WxtWSuT
         smNmBxjaW4/cwK2qx2ak9US9xk/WH6rnMQBCo6c7fd7DrJXUjJp6KQO5ZOlWceNgthh5
         /Kgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id az1-20020a05600c600100b003f4226e1b16si586290wmb.1.2023.05.19.13.41.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdx18JwzyNw;
	Fri, 19 May 2023 22:41:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 70/73] core: riscv: pci: Implement MSI-handling logic
Date: Fri, 19 May 2023 22:40:30 +0200
Message-Id: <20230519204033.643200-71-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Similar to ARM systems.

Idea is as follows: If the MSI(-X) is masked, then allow any write to
the underlying register. If a MSI(-X) is unmasked, then check its target
address and add the offset of the vs-file.

The original value is stored in the shadow register, and will be
restored when jailhouse is disabled.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/pci.c | 86 ++++++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/riscv/pci.c b/hypervisor/arch/riscv/pci.c
index 067a7651..39e1e4cb 100644
--- a/hypervisor/arch/riscv/pci.c
+++ b/hypervisor/arch/riscv/pci.c
@@ -1,16 +1,20 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2023
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *  Stefan Huber <stefan.huber@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/entry.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/percpu.h>
+#include <jailhouse/control.h>
+#include <jailhouse/mmio.h>
 #include <jailhouse/pci.h>
 
 u32 arch_pci_read_config(u16 bdf, u16 address, unsigned int size)
@@ -24,7 +28,7 @@ void arch_pci_write_config(u16 bdf, u16 address, u32 value, unsigned int size)
 
 int arch_pci_add_physical_device(struct cell *cell, struct pci_device *device)
 {
-	return -ENOSYS;
+	return 0;
 }
 
 void arch_pci_remove_physical_device(struct pci_device *device)
@@ -40,10 +44,80 @@ void arch_pci_set_suppress_msi(struct pci_device *device,
 int arch_pci_update_msi(struct pci_device *device,
 			const struct jailhouse_pci_capability *cap)
 {
-	return -ENOSYS;
+	const struct jailhouse_pci_device *info = device->info;
+	union pci_msi_registers target;
+	struct public_per_cpu *ppc;
+	unsigned short vs_file;
+	unsigned int cpu;
+	unsigned int n;
+
+	/* If the MSI is masked, allow to write any address */
+	target = device->msi_registers;
+	if (!device->msi_registers.msg32.enable)
+		goto passthru;
+
+	/* Only allow non-masked access, if vs-file is set */
+	vs_file = this_cell()->arch.vs_file;
+	if (!vs_file)
+		return -EINVAL;
+
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		ppc = public_per_cpu(cpu);
+		/*
+		 * If the MSI is unmasked, only allow if the address is
+		 * on the S-Mode file and calculate the VS-mode offset.
+		 */
+		if (ppc->imsic_base == device->msi_registers.msg64.address) {
+			target.msg64.address += vs_file * 0x1000;
+			goto passthru;
+		}
+	}
+
+	return -EINVAL;
+
+passthru:
+	for (n = 1; n < (info->msi_64bits ? 4 : 3); n++)
+		pci_write_config(info->bdf, cap->start + n * 4,
+				 target.raw[n], 4);
+
+	return 0;
 }
 
 int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
 {
-	return -ENOSYS;
+	struct public_per_cpu *ppc;
+	unsigned short vs_file;
+	unsigned int cpu;
+	u64 vs_offset = 0;
+
+	vs_file = this_cell()->arch.vs_file;
+
+	/* If the MSI is masked, allow to write any address */
+	if (device->msix_vectors[index].masked)
+		goto passthru;
+
+	/* Only allow non-masked access, if vs-file is set */
+	if (!vs_file)
+		return -EINVAL;
+
+	/*
+	 * If the MSI is unmasked, only allow if the address is on the S-Mode
+	 * file and calculate the VS-mode offset.
+	 */
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		ppc = public_per_cpu(cpu);
+		if (ppc->imsic_base == device->msix_vectors[index].address) {
+			vs_offset = vs_file * 0x1000;
+			goto passthru;
+		}
+	}
+
+	return -EINVAL;
+
+passthru:
+	mmio_write64_split(&device->msix_table[index].address,
+			   device->msix_vectors[index].address + vs_offset);
+	mmio_write32(&device->msix_table[index].data,
+		     device->msix_vectors[index].data);
+	return 0;
 }
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-71-ralf.ramsauer%40oth-regensburg.de.
