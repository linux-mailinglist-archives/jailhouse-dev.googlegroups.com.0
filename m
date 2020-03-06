Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUTRLZQKGQE54LD3ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19F17C481
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:02 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id a32sf2086538edf.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516042; cv=pass;
        d=google.com; s=arc-20160816;
        b=tTM2yZOKvZmfCV7C58BeP5aarqcQxu1Sck0AQaTRUEPg33DwxS9QUa6k/kXChBLPdA
         mRmXLaSOgxe+CG/7pp+OFtJ+8W37A1JwhANW4b5kgkR+EFYl2SjHg51Qzgw9OHHMLexf
         lQ3Xc04rtsFnYgweY8Zm+7dASCmFV/QwgfEDH0+9iv1lhozVTRNqolREBVKqnKjHQT2T
         VAjjNCgMNePOx4YCvFa1cSw2bH6jXrJDz66Nmxxkww+EJ2MCv1Tz3WrbK2q/2KZ3D2cz
         nrYixTSuEONnCWEZJXigIFYsvIqFFVT5s/LRDC0e8+dpU9iqjDnynB9xFIhKVddrspRc
         nmOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=KGcoIsKoRHTwZtMchrgW6vdhUERbfCvt0YWoIGy3gdA=;
        b=hrLqE29lG1RJQP0pkBoaIs1rpqdpIR6BJIXIc0stb7vQH+3rK+GNcJvB3NB6GAT7L1
         oCtmQsvtveCA1LY5VJlX1OMJRfrjA3NR8l6wVv/PWAT2Y0MRiGabvXaCJsf0LguVEAKY
         h4HwqS9gRoBgXsHsbiO2Gtl8EOq+dC3kMWIp5zzN5g4jNLJP/RCJHwzzb29D8G3FjMJO
         AgsO7oL2FR6LbFYKSJSXptIVzcAgvcHTpQVpdIxgjI7rN0/G3W0T/93iav1RHjMsFlPR
         Eec/FxEsvd483ZF1aJYFFwz7V2GuJQQJFV8CUpBXO806mKxxrSOw4IatHS9zEdRCfdj3
         DRMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KGcoIsKoRHTwZtMchrgW6vdhUERbfCvt0YWoIGy3gdA=;
        b=XC/R80lD6fuT87l6/wfUe+b7wLSOHh0WsJK2OggUr3T7BTvktwwrLtW2299d0GIkEW
         0NjnCcmKYelIzp9qIXMnt3d/qfqZv/tJXET3lzWLQDLLHUDQndt6VZVM1cMwkMCwQ4nI
         fgTpiAMC1lLh3bJCMJ83gg/K8bJmT4NIQE5B+tRLPePxB6owg91zj8z1YMqTp/45kZpL
         jDIFcDW8xs9X0VZmQDeFmVqeGwMdX9u1sxI2IHyiTmsWU6gKdInLXpfvyR0QQvSTN1HQ
         0b9F93ktTVvM1uzLhEx29XeviMn9XmgNA77HHhxT46W5XniWCZPJWutvAr9eaL0+1RHB
         mOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KGcoIsKoRHTwZtMchrgW6vdhUERbfCvt0YWoIGy3gdA=;
        b=XPGyZ/NqW/XWg0U38wdsyNl7MZ+uCqD4th6gJ7c47YOeiErl3NEllmCoiT5mm6l7JM
         7npeIan/nIhLLAH1cIK6AIpM2WxKW2cOIY0n7rlU3dWxIKl6MdLt2RQsaVYRPM6nmL/7
         yBheff992MmEaprq3UacZrYM1c3Y+5/FWACd3XzWsgNubeJDXhdSFxirrxTnDstOX+0o
         3KQzhv3GiT51Oo8eUbiR95qdz2ihijSeByuDAMwVWH67/UBEk2SmJkNyqAEC47kroEtM
         zO0OOyhbDrBkOZc61i6aEi9mLu6vypfcuZRFGrueRZJdVqKr79f0QOX7IAFarWepc3Qi
         TWNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1G5OAERS/GCrfE7uzbCk7IUW9o5dZiE+cuzwOxqm5FXjWWxpWC
	UtTxoxu6mHu4SegHWfKmWNk=
X-Google-Smtp-Source: ADFU+vuIyuLhiDs0Sym5NChzrC/L570jgPbvh9suFHlEsiYkN2OwXoNV/xfuWRcazSr9sggLY99+NQ==
X-Received: by 2002:aa7:c751:: with SMTP id c17mr4460901eds.293.1583516042263;
        Fri, 06 Mar 2020 09:34:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f14a:: with SMTP id z10ls1749932edl.1.gmail; Fri, 06 Mar
 2020 09:34:01 -0800 (PST)
X-Received: by 2002:a50:8fe2:: with SMTP id y89mr4468668edy.204.1583516041450;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516041; cv=none;
        d=google.com; s=arc-20160816;
        b=GbmGw2nGz9T8HDRJnj5rMtrG/WYilzcZZvyMj78ke9o2rYEMtRg9ePA/UP00prWoDB
         owrGP2ZtutQUraYSr5d+Wl1prAZ7KiaKANPjAjD/UPAUB8OH0hWkKRq3vgAui1hhPZJk
         3+Q9dvbM2OXBvenZ4nqebmzod7LauSANrXhRtgfQqvTIl8vBTI6Zzq8wwTGjpTM3OZUK
         XPuDheQMYYeQufFSgbI11ECZpwnBid1ofyoL+yFJXh9Czy9HwYMCb4q9Y4I0VKPuXY/W
         C49MiarRaS8dOSaitnP9YAKoRyRkRHXkDOjnZAYS/VdNcDbdcTIR8o5jhWOxlIRvQC+/
         36AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=VtKdbyxkp+zDbCW2r5n+839QDEwg0lT6e8trxouenoI=;
        b=CaTksio1RO9rUL64+KG42oC8ee9azHJDVbjFR0ugOru7rcTbDv1P0BLhpS+2O6vBdc
         UpxrmwJVcEUqZiOI94IeI0cwxqD5BzxkGox+jw7zlQBJbbzduRwN0TVKJOuW00WG345t
         uYQVRV80Z8FDvoHpf8cAxLUP4jB0KsOZz8fZdzxi8/8vIPOCOGDH5AtHMTK2aLxkg/eT
         zxtemsyK+MlsWF4Qdo1aL37uAwxaW4QdPhZtsr4J7U2mrYSOZAACBrxPKIHEepjMzEeP
         V+8SsM8rCPhWPMpBheqdtK9hR0eqZohUkDh2Kw/fDZsyt9jY7bgctlq4qb5AoHuPYUv1
         fshw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id g12si127606eje.1.2020.03.06.09.34.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 026HY0lK001000
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:01 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0aB016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 5/6] arm-common: Factor out irqchip_trigger_external_irq
Date: Fri,  6 Mar 2020 18:33:58 +0100
Message-Id: <d2becb4a22a7dc85cb237014796862a50f4cfc6d.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
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

This replaces the non-intuitive special case of
irqchip_set_pending(NULL, ...) with an explicit one.
The only case where irqchip_set_pending() was called like this was
arch_ivshmem_trigger_interrupt(). All others already passed in a
cpu_public pointer guaranteed to be non-NULL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/irqchip.h |  2 ++
 hypervisor/arch/arm-common/irqchip.c             | 14 +++++++-------
 hypervisor/arch/arm-common/ivshmem.c             |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/irqchip.h b/hypervisor/arch/arm-common/include/asm/irqchip.h
index 9ac33465..b3fa6d3c 100644
--- a/hypervisor/arch/arm-common/include/asm/irqchip.h
+++ b/hypervisor/arch/arm-common/include/asm/irqchip.h
@@ -97,6 +97,8 @@ bool irqchip_has_pending_irqs(void);
 void irqchip_inject_pending(void);
 void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id);
 
+void irqchip_trigger_external_irq(u16 irq_id);
+
 bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq_id);
 
 #endif /* __ASSEMBLY__ */
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 6b6f7332..847758ae 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -228,13 +228,6 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	unsigned int new_tail;
 	struct sgi sgi;
 
-	if (!cpu_public) {
-		/* Injection via GICD */
-		mmio_write32(gicd_base + GICD_ISPENDR + (irq_id / 32) * 4,
-			     1 << (irq_id % 32));
-		return;
-	}
-
 	if (local_injection && irqchip.inject_irq(irq_id, sender) != -EBUSY)
 		return;
 
@@ -311,6 +304,13 @@ void irqchip_inject_pending(void)
 	irqchip.enable_maint_irq(false);
 }
 
+void irqchip_trigger_external_irq(u16 irq_id)
+{
+	/* Injection via GICD */
+	mmio_write32(gicd_base + GICD_ISPENDR + (irq_id / 32) * 4,
+		     1 << (irq_id % 32));
+}
+
 int irqchip_send_sgi(struct sgi *sgi)
 {
 	return irqchip.send_sgi(sgi);
diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index 14e31da4..9f0a11dc 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -25,7 +25,7 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 		 */
 		memory_barrier();
 
-		irqchip_set_pending(NULL, irq_id);
+		irqchip_trigger_external_irq(irq_id);
 	}
 }
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d2becb4a22a7dc85cb237014796862a50f4cfc6d.1583516039.git.jan.kiszka%40siemens.com.
