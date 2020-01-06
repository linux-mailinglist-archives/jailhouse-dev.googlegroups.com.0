Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3GLZTYAKGQEPYI7MRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3704B1311E9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:57 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id 126sf9002161ljj.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313196; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qz5F0ccYMbCmb8uAV6tC/fO4FkwfSUDd7pu3am83HxMUB9nyYkRa3uzLkjlICRazQu
         wCbnkunPg/VUyJ/Gm16cIWtvFRTDQiacNn8vPBqcAd3yinrMZbSyXGjnWJiuM6OrSFRG
         pfsk6FHLdQL6MGhVsBJFaQlXHFTbxdyM5wRY23/dHA+t5GzvlZrqishyL8IMQOqtHzQg
         gEh0RTSeAWX3/vaGqmJrEeY5gTBeINx/vSCl9kb4Sf8qUFMKWeSoMfBH6eM3TRnCaqJ7
         MySiE+HvYWbi4ULYbkIuUSxFqCVCd+XVwWn8GuJK3kiTS/5s+O2UALf3QCkhWJyWZv5e
         JI9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=hHPoB0FFq0r4dEmRajNKD+POMisBGk6YqQUna3fENe0=;
        b=RUgNCcXxUE0P9xd4aLyJf+jOsHr8aLXDwHWx54Ua3JjikmEkeiQVHAkYdHtYm/1WTf
         ne4UUT8tsQbvGUDKf/qFnSwbwpdNWlOzqJrwnvQDp8G8VeElZkfhjEPMBVmEvUInL/Xx
         3pEi6iiAbyq7y4A6ERNEoQH+gk0QhjVCvYTgOL2AMJBqP7WEjVBCpXXUkezRUonvAThx
         yKCRO7ieBierHrOX1SCL+/uIgtJwB14G42clDbAEoxKGPshCjA6Qj32ihtZ7yLD7Hend
         SW3JYl/L1VpFM5Y3l/WLuP+ZS27/LTG8XOmSsfxIdFd3zqKVePAtezqlEv/dVIvSX2ri
         oA0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hHPoB0FFq0r4dEmRajNKD+POMisBGk6YqQUna3fENe0=;
        b=WeWwe+y8X9d1+EjQvoz+cH4ItFPq1mou5l35JBPAzN5E6xy1f/E+JskiG3cLwQh+jU
         XgmQNSF5/EdPeVM2rLmlZ9xhQcU4lpwaRXySXrkfM1ccqf+vaSGLS3k5Gk4JJCYqG37v
         bb5WtON37aOUXY1/NUnAlw/W0r7WaZRiXBPX31O2KF2y3qxLfO14ki9EBGh7ou7oB/s/
         k+faCpCkEl51OJvpm5wf8nRZjMS55cEpv7CkKS4g4LOYjBAtaZJvszxPNZXcTL6BK7aN
         4zvDvyotS2Ol7DxsRP4lBcQGeRvG/fIoVtd8kxdlHquyCSJTnt888bkCVsnYdzNzACcN
         +O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hHPoB0FFq0r4dEmRajNKD+POMisBGk6YqQUna3fENe0=;
        b=Xl9PSR4uoqIXbYql87hzKloVkKTdfNOSKqwNac/KYLbQBly+a67vJdLqhvNSG9PDhS
         mNEzSk5mqMmHeriVKauTJL+/lCdyc0o2id0ZPDXqtu7F49KM89WhrUc7v7HWES3pZd1J
         qAOcitJhnKsgv3VyFEXCOcnBOvDVLBzvCGeDhxH9rMMjAYGzuwLof4CmTCDhUGMuNcoY
         ugxKuTqxee6Dxg4jPIpSiakpbcphdmY0sjNnKRvDdroQXw1Dy4oKK9YT9yJ2PHpvF6On
         UNI1q+yj/D9Y7cdMFLpZwvYnsCI6DHTy3GfAlFmPvOtJbnyRlS6eJIVEzHEki+Ao1L/c
         rUIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUnMuA/T9af/gtnJkOLTz4+NewDMu5eUgMLo1iHo90ZbRa6IvwF
	9rXj98InHfHYjeYeR6oNZDY=
X-Google-Smtp-Source: APXvYqxRD/rih/jM3lW1lHhzGGck65+sZnkcHPZqwLtxvssVBA44Fd3zU5kZW9Y+cJpJd7heMnllow==
X-Received: by 2002:a19:4b55:: with SMTP id y82mr56137029lfa.171.1578313196811;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:44c8:: with SMTP id d8ls4124299lfm.10.gmail; Mon, 06 Jan
 2020 04:19:56 -0800 (PST)
X-Received: by 2002:ac2:53bb:: with SMTP id j27mr46846083lfh.39.1578313196039;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313196; cv=none;
        d=google.com; s=arc-20160816;
        b=fu9HwtQXzAHmM3TOZtg2xuTiT3Z4QlvObbnMp1nP0c9Q5NJczRR0W9BzF0R0B6+r32
         y2ImY33q7PZ7v8XAD0NbL9geX8AjzYt6WPfLqSydi3DPoYuBAOLBwjly2F5k/pKr7+cJ
         RzUXc+PAwWClLJkiMtN1n98h0xU6iOJzsogF7Jv7OTmhbyvWYPreylBFifxK/ttYChlX
         wgXZm/d9TVMZ2xEMhoHYM2SGRkzz9sKU0X9RaJ/mOWWcWbR3/AzlsrkBdKqgafVEJaap
         H7onx9j3aeaB9OmeassCDbEdy9TDgh7gJB4SwN3pl0pw3sgwXwW2ww+0mAh3E6ybkHv6
         O0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=gVSBff7Y18mns1cZfy6q/TepxnkpyK4fCiiQqRbb0Qg=;
        b=JSd31QeN5vZdQzUorm7EhxHuhCFeHEBrFbglnzZLcKsIL7kXyJwQl1PQEDu8VdaWPJ
         Q6OD0x9J2rHRmICVXYpVoskvPNaaLcwafDL/EbyveYDeaaugsDJVp/Hdyxz4E0Z++e0n
         Rh27wgRh30dxJ7l0PwaRz/X5peuAaFj/LRviwKMhMr48y6F4Q6VL6QwsehxoeQFzZHg6
         /hZPZ9lCINx4gu9z85Z8ieL2zVT2w6vi0C9R5RQtfWsR5YA6kIhH5W2l6DNisP/pUBab
         k1HU2pnRJZOrMmADLR3orP8euC8On/bczSWGw3I9ISXjB9TeafkqwMhQJNyaGwUnxm/B
         4s9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 68si2404107lfi.3.2020.01.06.04.19.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJtoL024685
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEc029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/38] core: ivshmem: Enable unprivileged MMIO register access
Date: Mon,  6 Jan 2020 13:17:45 +0100
Message-Id: <2aa7465e260b04d1f133aaa88e1c66af9a97f977.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index f4b698e0..0310cb47 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -90,50 +90,45 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 {
 	struct ivshmem_endpoint *ive = arg;
 
-	if (mmio->address == IVSHMEM_REG_INTX_CTRL) {
+	switch (mmio->address) {
+	case IVSHMEM_REG_INTX_CTRL:
 		if (mmio->is_write) {
 			ive->intx_ctrl_reg = mmio->value & IVSHMEM_INTX_ENABLE;
 			arch_ivshmem_update_intx(ive);
 		} else {
 			mmio->value = ive->intx_ctrl_reg;
 		}
-		return MMIO_HANDLED;
-	}
-
-	/* read-only IVPosition */
-	if (mmio->address == IVSHMEM_REG_IVPOS && !mmio->is_write) {
+		break;
+	case IVSHMEM_REG_IVPOS:
+		/* read-only IVPosition */
 		mmio->value = ive->ivpos;
-		return MMIO_HANDLED;
-	}
-
-	if (mmio->address == IVSHMEM_REG_DBELL) {
+		break;
+	case IVSHMEM_REG_DBELL:
 		if (mmio->is_write)
 			ivshmem_remote_interrupt(ive);
 		else
 			mmio->value = 0;
-		return MMIO_HANDLED;
-	}
-
-	if (mmio->address == IVSHMEM_REG_LSTATE) {
+		break;
+	case IVSHMEM_REG_LSTATE:
 		if (mmio->is_write) {
 			ive->state = mmio->value;
 			ivshmem_remote_interrupt(ive);
 		} else {
 			mmio->value = ive->state;
 		}
-		return MMIO_HANDLED;
-	}
-
-	if (mmio->address == IVSHMEM_REG_RSTATE && !mmio->is_write) {
+		break;
+	case IVSHMEM_REG_RSTATE:
+		/* read-only remote state */
 		spin_lock(&ive->remote_lock);
 		mmio->value = ive->remote ? ive->remote->state : 0;
 		spin_unlock(&ive->remote_lock);
-		return MMIO_HANDLED;
+		break;
+	default:
+		/* ignore any other access */
+		mmio->value = 0;
+		break;
 	}
-
-	panic_printk("FATAL: Invalid ivshmem register %s, number %02lx\n",
-		     mmio->is_write ? "write" : "read", mmio->address);
-	return MMIO_ERROR;
+	return MMIO_HANDLED;
 }
 
 /**
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2aa7465e260b04d1f133aaa88e1c66af9a97f977.1578313099.git.jan.kiszka%40siemens.com.
