Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBE4K7P2AKGQEMLTP6UY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 293291B238B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:04 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id n17sf352007wmi.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463444; cv=pass;
        d=google.com; s=arc-20160816;
        b=qJyYirSdlLPLIL+GoUd4Qu8LnWQGuAt7JHo5yCejlkSngOk+VhgqpTQ72zTbVIL9fj
         I+3ON7nQ5rcgjtHCBhbaIF9IRYLAk6pjLPmto+TJ19+9Sm+ODqlnfOQlDF6ZAKAXHuGT
         jtj7Rks9S90Hv00XYLfbyFaukbxb3BZgmpHAwrB2OuXlLC47k6MHLj1PVCqyA1GChU8F
         hkLA2QTasj/IKqdQADrFAKW7mLX0pNdbbCd0bvUkMK/cakYuyAzatD1+KYfPR27OyLQ3
         CYeKb2qo8r8WCaR0JNk01fhCKwXWpc01IdviSqZtQm6H8iiwh+4D2szp3Mmh4xKt5hKx
         1wLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/VsQ0LMro/BJkthliGJ17FYj3+irkXVAulGSBWoM+is=;
        b=b+v+NjLSQnWUZg7fXXxuCnawsWeTks8MWpAMUg9lVtonA5Y+xBn4q6ZbrnczMsw4KQ
         TXVE6JCrxW5pITzK1ccUM0rgrTPLYPFEhOTOSrp2P5RYJdc+5a7GZ5KyL7ARZW5AlTiU
         fydcw4/R9i2Uvzg2Snym76YBqeV53nCMKh25+lygg/hZAGr4JyzcbZ7RhXapSxDdoZGO
         SPnyolnCYhYAe1Vs3x6is9dn8kTWjPkTbF11sbKdK0Bjdu3eyNh/qA6dvHj20c1HluWb
         moP66j0ky+P+k7y2X7jyaiy75XX1KDBAHvVUsRBX77XAJUJtY2ydqLxirt4DlemALadp
         qrdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=H7CIe9QK;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/VsQ0LMro/BJkthliGJ17FYj3+irkXVAulGSBWoM+is=;
        b=IIxKzLhjDyBeCargo2V6Vju3sZFHdAkuWNlxuVRnbywmlr3rO7y1FVO0nWfjPQ9DL7
         ecW6BTiTnAkK/oND7hdQZw1PoJua69a/bsGKc6tpwTnV/rF5VtqlAcuwcxn40cK0qFqs
         l7RW6Yqdw6gcSwZ3Aj8JmZZay4EkgsslepOAAxElsQ9I3vCfJmVPiXIBiXZkUt2RtDil
         HHGMcsXIbCbcZkxd+FiCybT0IuczECYf13HwqbuTGxrOzlAf3UJh1L/a16DyIuMc6Axx
         gH/x5ULUWWRzNwjxeLoaAMg+xXEAUyRH75ksKgYPouIx5pJ99BClWNUulvZgKDMNLsz0
         PRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/VsQ0LMro/BJkthliGJ17FYj3+irkXVAulGSBWoM+is=;
        b=ugiw5diaQcEmL/10vX5Rc0vUJBxyPEka5LtYcJx6U7GGM+oLrAwxHPUtlp/aMNZux2
         zkqipeYfpoSrZuyCAg+I7M97+Q+OIJdVHBESCYhKAG/XHTyLZJST8ypnCQCOE9JJ9VfO
         1pK6qnkdtnVb/l85bp2MM1U9A3N2FswT1hG8rc58Un9ZEFOlsYF5AZbPpUsY5xKInfXN
         vUEiIf9VXEtjQ8R2FK6nJaXpKOfad4UmDspCxXGw99d81LkJzGw3mZHKUMNE7lsxz8AD
         D7qrFO9UrI+2WbVbfM0g+xu7c+ID6eoTt7K3lWXGpsGS3X0YAG7EVSacVTqwFgJUGZ+V
         KQfA==
X-Gm-Message-State: AGi0PuZKfra3sctZHkKOmg2a/XA1ckHLc1y9r2+FS3Wxk5JKykV4N/9h
	yY1mghsRuDATXRPplA6sMzs=
X-Google-Smtp-Source: APiQypI1I4uqU4JgEV0mMC5RDpt5y17KufEN1dAmU1M7or/ob75CCJK4QwywxQtfDqAYKfdkkRB+Gw==
X-Received: by 2002:a1c:c2d6:: with SMTP id s205mr4344083wmf.90.1587463443817;
        Tue, 21 Apr 2020 03:04:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e44e:: with SMTP id t14ls15557790wrm.1.gmail; Tue, 21
 Apr 2020 03:04:03 -0700 (PDT)
X-Received: by 2002:a5d:5230:: with SMTP id i16mr25108806wra.71.1587463443216;
        Tue, 21 Apr 2020 03:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463443; cv=none;
        d=google.com; s=arc-20160816;
        b=MG3WQ5UX4IF8FdGwMRkLH5xiZOwTLFgIMKrLQMxEw0bkrvNlVuK1KRxr6JrnsOrJFs
         4qqsJwuPnT9jeyZUkJfcV+/DXZTScFoC2SdndUbMJsmVnK8Loa07jD2QPNKUdVgrIByt
         /m5o3jvh5yW/BlD/DmzwHAbBr1+4KXRN+l/YQJsq1uRObhD0HLfnFWwRel/hsCyhCou4
         wx7Eab/vqW47ydfGfOFd3Ih9gKkKiAZjVJHJECvAPbqxb3YojxQdEbUk3m0vTyK9vHJc
         dhs65BvGumNVt58LLEet5PEt0aZPUifWAMzgKdbCTnGho89fFlD4BGLm/ma2AG5vIXwN
         6/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XcAp8Rf+pw6hZG5mCVFmZzNvfyAABt7el7E1K4b1YHw=;
        b=r1nRKGP6yz2+xcEx4P1muBN1M9TTVy8L7Kb9CVq48QMLyJgCDd2uL7p5Y1xYA13Wad
         wBUa6mqLEfyr2FUkP84aF4Ny9sqsxgfZi+TLEhtT2kgKsY/ReqHYjjyjJjOGlAOTavJD
         tWEfU3DFOuNneu4kp9efj8NnvJ8ix8xBqqYJiWMlc34nxT8y1Rc4pkiz6afxr46Ehpgc
         ePX7rSBnQ3YJu7VYry1fJJrWP6+HpGPR2ZrvZawbvsenvVZ5o/4SzbjfwWOuvUtcKKEj
         9BgOq+bcubN/EyDrlSn5Dtf8CtTB3qr11gXdcw9PhX0BzcVBh/XuWtVYr5cB8OyIJp/Y
         ocHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=H7CIe9QK;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id 71si183364wmb.1.2020.04.21.03.04.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl4-0005Ba-Gs; Tue, 21 Apr 2020 12:04:02 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>,
	Angelo Ruocco <angelo.ruocco.90@gmail.com>
Subject: [PATCH v2 3/9] driver: introduce col_load_address for colored binaries loading
Date: Tue, 21 Apr 2020 12:03:45 +0200
Message-Id: <20200421100351.292395-4-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=H7CIe9QK;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
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

From: Luca Miccio <lucmiccio@gmail.com>

Currently Jailhouse loads inmate's binaries by mapping its memory region
to the root cell. When coloring is enabled this operation becomes
not trivial. To avoid logic duplication in the driver module,
use a special memory space when loading to colored regions. This
convenient memory space starts from a fixed address defined by
`col_loads_address` and will be mapped by the hypervisor using the same
size and coloring configuration as the inmate.
Since there could be platforms with different memory space layouts, the
choice of `col_loads_address` has to be done accordingly.
Allow the user to set this value in the root-cell configuration and set
the default to 16 GiB. The latter has been empirically choosen as default
value.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
Acked-by: Angelo Ruocco <angelo.ruocco.90@gmail.com>
---
 driver/Makefile                 |  4 ++++
 driver/cell.h                   |  3 +++
 driver/main.c                   | 15 +++++++++++++++
 include/jailhouse/cell-config.h |  6 ++++++
 4 files changed, 28 insertions(+)

diff --git a/driver/Makefile b/driver/Makefile
index 8dded848..c69d1991 100644
--- a/driver/Makefile
+++ b/driver/Makefile
@@ -18,6 +18,10 @@ ccflags-y := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
 	     -I$(src)/../include/arch/$(SRCARCH) \
 	     -I$(src)/../include
 
+ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
+KBUILD_CFLAGS += -include $(src)/../include/jailhouse/config.h
+endif
+
 jailhouse-y := cell.o main.o sysfs.o
 jailhouse-$(CONFIG_PCI) += pci.o
 jailhouse-$(CONFIG_OF) += vpci_template.dtb.o
diff --git a/driver/cell.h b/driver/cell.h
index 92afbff8..0207e189 100644
--- a/driver/cell.h
+++ b/driver/cell.h
@@ -36,6 +36,9 @@ struct cell {
 	u32 num_pci_devices;
 	struct jailhouse_pci_device *pci_devices;
 #endif /* CONFIG_PCI */
+#ifdef CONFIG_COLORING
+	u64 col_load_address;
+#endif /* CONFIG_COLORING */
 };
 
 extern struct cell *root_cell;
diff --git a/driver/main.c b/driver/main.c
index 01e9c049..25bdc15c 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -118,6 +118,9 @@ static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 static typeof(__hyp_stub_vectors) *__hyp_stub_vectors_sym;
 #endif
+#ifdef CONFIG_COLORING
+#define DEFAULT_JAILHOUSE_CELL_LOAD_VADDR	0x400000000
+#endif
 
 /* last_console contains three members:
  *   - valid: indicates if content in the page member is present
@@ -566,6 +569,18 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
+#ifdef CONFIG_COLORING
+	/**
+	 * Be sure that col_load_address is set if coloring is enabled.
+	 */
+	if (!config->platform_info.col_load_address) {
+		pr_notice("No coloring load address defined, using default\n");
+		config->platform_info.col_load_address =
+			DEFAULT_JAILHOUSE_CELL_LOAD_VADDR;
+	}
+
+	root_cell->col_load_address = config->platform_info.col_load_address;
+#endif
 	error_code = 0;
 
 	preempt_disable();
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 8985f8a3..25f6860d 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -314,6 +314,12 @@ struct jailhouse_system {
 		 * the platform in use.
 		 */
 		__u64 llc_way_size;
+		/**
+		 * Start address used when loading binaries into colored memory
+		 * regions. This value should be set so that it does not overlap
+		 * with platform memory mappings.
+		 */
+		__u64 col_load_address;
 		union {
 			struct {
 				__u16 pm_timer_address;
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-4-ms%40xt3.it.
