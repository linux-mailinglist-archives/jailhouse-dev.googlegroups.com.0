Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB7P6PUAKGQEHWA54SA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27C5EBD0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 20:44:24 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id c27sf2286868edn.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 11:44:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562179463; cv=pass;
        d=google.com; s=arc-20160816;
        b=AaCkAg3Xb1V6oXFB6jlld6oQXf8fn2iCqJjFnxw9g5x9wo5MfeY7Td2Yg7YsWJkmao
         Wy3+pL5wq5X+Fd74d7/sbMkfuG8R0aJGdHCfpCIUCWGLf6djxDQDH7ZvHvAvWn3lDkOr
         oM/wK0zflUSsN9a7Mp7AE9i+oUp1kv267W3X9QAjxmEBl9sXc6074aFoRu0looaIfgO0
         fQUCXsrWH0OIMzcxQFzHLZGL8cZaoqAjNB/Bmpix89lDVNeqiChJVPLe/5xGl6Cxh8HP
         V/zxdODhe8zFzYk7fL1H2ayTORtKBTWZemKcthsYfbkseYsUu/GYU0S6OsGbOEIcUkM2
         ZGnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=NyRjCI2AyQVNNP6fJQ4UqNQibVaoSnmlbMCNb6Ejo1A=;
        b=uWlxeiE17vCQyBhrdn6/gxufCqVtnEW7LOMXaTqmy3n1YzZnpdrCuRo3kpBC5+LU3I
         kZUaevL+t30OK5aIMEQTsR7t67ImZsdu5Noa3C38hwpMtFeg3WbhU3eh441x9bX5/MiR
         6OSfr1P5/U7DyVTMcE7didRMSI8WX4Io19SUXkTBcfsVKfbTQMvUJLLLIZGudahPnneH
         8A05FXbsf5BarDNHtQGy0Z/uNgzylN/GheG9ofEZ8f8fkDTF17wGphFNb0SC0TDF2oH1
         vePSCqFIdsTxcvH1NIv7MxsWM5A95foh8GJFPiweFawhgQQjg3rHFSHzzGYFeFZouHxt
         eD8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NyRjCI2AyQVNNP6fJQ4UqNQibVaoSnmlbMCNb6Ejo1A=;
        b=N4Q7MhOhECYLIEBjXixtOP4nuhnI8k5rVZiGQR/W1GvxPJK3kR7EsXZMc67tXz0y5G
         Nn+1mZTuHeCWXvuiFwkNdkxdDLuo3YBcvI1llyfvhuLr+JVuODSarAJG5lFa2GdytGta
         dakj6DeLCNHbeSSbYLgSQ8Q2B/y7H38lf6X/iSVCeOgN0AfWddjQDy+DRwVF8ddKFOpU
         ut2NfsK2JyydHyHOzrM6xplguC5LRtpKQfM4mmtveOrILqFsxkmr4mnMd9mvMr060S6x
         PWYz3nW1g+CLZ6z6VV5oL/vNPPqpgEjlucFiNHVAFCV5K2AuluQxCCWbIXbd175lNhSw
         fiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NyRjCI2AyQVNNP6fJQ4UqNQibVaoSnmlbMCNb6Ejo1A=;
        b=suvVz7+dFzYceiN5J8YdtUfJzu8pViuW6huiC2/lUHumH9YDHlhvmgpPwcvfFnwAK7
         N3BGcdhuEmT5Eath7y8bu65Yu8LCI+Tc8KuHs4xGdcZJyaf86ED8GDBdLzueAMFIr+n+
         G/Pp0l5V4+/zG2IapGhR8LdAbhCnO8HmOLoMZTQIWi9QUGR5cE2bSaZhbpDrXraPtQXE
         Ajdcq2HT9DpXoRGz2B3eatGp+zXrMqVKUg1qlgGstt9J40v21kZdoygpa7KPXdax5lKG
         cNXxEymcZmq/2l2RqrKQSNbfyK0iia2rwQLaQvgFjrd0KQc+YgNV56f8q3KFGcCRf6DK
         bsXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCmM7s1RnWBqXAgAOw/G2Z8eK1W8ow0oTKEaYK0G8F/v0EZyJk
	ib5tdyB481k3IK7jleoWvQo=
X-Google-Smtp-Source: APXvYqwMDKtv5GZU8x6q5x08oI0BsBPkSOslKsmDyiO4qzX889roCZcSPpoxm3XrXQcqrEPW5uZI+A==
X-Received: by 2002:a50:9153:: with SMTP id f19mr45091266eda.70.1562179463845;
        Wed, 03 Jul 2019 11:44:23 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:978a:: with SMTP id e10ls1016723edb.6.gmail; Wed, 03 Jul
 2019 11:44:23 -0700 (PDT)
X-Received: by 2002:a50:b66f:: with SMTP id c44mr44346262ede.171.1562179463263;
        Wed, 03 Jul 2019 11:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562179463; cv=none;
        d=google.com; s=arc-20160816;
        b=S1GVcZ4m1ReFp6aNykHMaDBr0bEpKKaztrMhGDrLJyTXfNSMHzx/ZtTleJvaRbHJ4y
         fmfSys4jcZI4QVUS4BYr47nf9vZEPhXjKb32bkHtL/6+dpOFq3aiemyG8JdGQNAUuzG3
         Mdcxwt4cRSYCCbMBduUj8JEYFkQGJ7UJ6VtGc5gTvgndEYRNcbYIz6lUNcu/F1WCGe3L
         qx6JkXLaZAxWjCX3WVJ17V3CC6g1al5J+qb6C6Rj8/2TKx1iOyJHjLU4g0RRVYfhnko2
         2FajTROL1V6VUmAm7k+ITrkw46jraTdoIzrSdUDmiynA4CGioW4ayBl4iKzUg9jolHrB
         i1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=jxeaxgzrVvTXcDUjMbl1l0+SP4+FvFypH7zJ2XZ3cr4=;
        b=JHZQd9XobPyYWSfp/FuYIMD1uqDWmhLgZpbT3uVI1xGRWZMjhao0n8MDzMtyKDIClw
         x2nTn0Dgg7xb6jDZdcjlIKCofgmfCTmweobdeq+Wgx+ANgovL9ncIYvTCEZswEc2dMcy
         8vqQWRDBFdU/32KyrBEdr1g43PnxnLdiAZodMItrfa+fnerPVQrrdycSNs5uxzitHn1J
         DaAnSk3GIURGdARDSLBIFpJuEptI42Jjrpx1ptkCtSEvBvSc7MWOY/k9aGXGN+kp9DgY
         9EzZYquPfhM2JQ8sbr2gdkY3Rj4XaeBCeWPkl5izuMlZhcaEyWdHbsaIvfFUr97S6urk
         8hVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w57si169488edc.4.2019.07.03.11.44.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 11:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x63IiMx3021286
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:22 +0200
Received: from md1f2u6c.ad001.siemens.net (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63IiHFB023455
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/4] configs: qemu-arm64: Add PCI ECAM region
Date: Wed,  3 Jul 2019 20:44:16 +0200
Message-Id: <a17c46ce809e256ff674fc981b0dcc26eb971b5b.1562179456.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Available at least in recent QEMU versions by default. Not allowing
access breaks lspci, even without devices attached.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/qemu-arm64.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 6eff7403..79e7cda6 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[4];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -88,6 +88,13 @@ struct {
 			.size = 0x100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
+		/* "physical" PCI ECAM */ {
+			.phys_start = 0x4010000000,
+			.virt_start = 0x4010000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 	},
 
 	.irqchips = {
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a17c46ce809e256ff674fc981b0dcc26eb971b5b.1562179456.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
