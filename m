Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUGC77WQKGQE5Y4IMAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FACCEDA94
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Nov 2019 09:29:05 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id i23sf6173865wmb.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Nov 2019 00:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1572856145; cv=pass;
        d=google.com; s=arc-20160816;
        b=dIoY6kb7yRAZHIhoeZjWO9DNw5RGV1DAJTP6YCsLSFUhB2QSmpVosiDI9FcYrQ3+uC
         JmxTI8W+aaBLpeeiYBIl/7hQ8ZKDfZFsZ7GuxJVLvQH2B08n7uXQcwQfkXzR1ylAzu1B
         c3YufjJizrtl54Hcq6tOpV++0W3QG7jlZi6svVRoNa+0n7ZgEz25W19PHNOenkfuCWDg
         70Dq6HoDb6vxnPS9Hh6QmE7/D5h+4r0/98is4ee7u4F6DQO0eJq7vE1iytZYOZKhwj5Z
         sRCmwnoVN3r4qGvF2EILAnQSnJXb5Qtd+fhMIL8nq7hmjhT7ESsUTjImRgxwDfXVmQU3
         O6jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=3t31Uz9zyhviv15I2SmpCuLHOkiw8aEvxPqmRgCueuE=;
        b=cgOYb9BaV/jeojKGfYgRsl2FPVkEy2JT1Ilw4qwY/3DVpVVw5/VwakdPLZ6nZ7HsbA
         r+i/uzIdQsbxTOtdm6Y+rWGdURrkxuvQlF+H5mtJkJTnwLVWANve+cL63cAczFfLBBkF
         xeWdgEQQbXsvh7lMH1dUQUD95pvUAw/gm0+xnA5tjAu5EDp1HSv/NAdFvuyZOMW326aF
         mGa/QhmbQgbiyumH1CPFJid2l9esf3mdlOYlXxYSsMrRaWm9l65aduMeIGAVqXB4KoYd
         kGvUUPuCWVIVp+RC01pMP9bgMkhjZOG0PD9Q4GDvHyP/uoHwGJjLWkBlma5PAzP/5Ubd
         he/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3t31Uz9zyhviv15I2SmpCuLHOkiw8aEvxPqmRgCueuE=;
        b=j7G8U0CNFb4YX7heosp6cohqHdgtBcfiS5Aq6QxiMdq7/p9Ty5iqU+kZHcLf2Qu+xL
         9GD2PQ80OgKdyF8vXnHkBInd3hCzucHoey4dFiJ5tEAfh4g63lh4l2YzkgiAWyMzQjvw
         vD71oKVf/m8hs15kxKA67OadKK1/Xovh5iJUMCqeHwcSvRYTZK/x3AL/esxPeiEtFFaA
         knfD4MUOxrB424BCpDSJQlyxMtIh5J7SDhzIhVOzvNSQkshrGpInJVhyZN8hRf8GTy6z
         QjaRxOlh9ReUYPICFMEeyZVW/ooAIe6y+nWtOs9ihvX3Zntf6Qji4fk+QdRkAl3Y7Gc2
         JAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3t31Uz9zyhviv15I2SmpCuLHOkiw8aEvxPqmRgCueuE=;
        b=hitg30UX+v7drTooyFlLVUZAQXrdOI/NVtGigW3eBRjWIvdoHKX5MFLxUQcyX3rd1G
         xWIL+kJYulR8Sr/faa6iNFw4npRlIt6c3czSlclo6AfvgLVoApjdvgYyrQEnTLgpmyLy
         sBz7Hq63QP/rJPCB/o9Vjir1w83EhO497FCXf32oXM7P+VtloSTOYREFsmxziNv/3sxv
         d6BY7F/ygrkucVBxgFjgDELa1SlCE8zPnxCkrokT/XQ524KeB4xCrEc4xAl1gnGKN7PE
         1GdXfigTh66FiLmiML3810dEZTzaJVUypK087WYPY5cExs6bjNVrd+SeFdLpTjauP054
         S6Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU1BeTPdaOcO6Zaj3O7ZWfuBoXvuHJRk2S4hon2EtGGrUeQw4WA
	oWN2YWNVvHWV2vMdpT5U4Zw=
X-Google-Smtp-Source: APXvYqwDwVcqy56X5IWGnVLvEZYYKgDBqwHDTFL4TnNE+3Ts17dVIHlj9HhW2MZcES491Xf/EFDPIQ==
X-Received: by 2002:a5d:66c1:: with SMTP id k1mr20294036wrw.73.1572856145153;
        Mon, 04 Nov 2019 00:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9c90:: with SMTP id d16ls13930905wre.14.gmail; Mon, 04
 Nov 2019 00:29:04 -0800 (PST)
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr23278798wrs.227.1572856144342;
        Mon, 04 Nov 2019 00:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572856144; cv=none;
        d=google.com; s=arc-20160816;
        b=DND0gQgqYLY7y59S4mMBCphYzGwGjJj71bJEkJIcWzmlKMJIn1dakSjtzxscDvtTYA
         xYsS7JYvKuw4qD08lX3efmko159o7KNcauBw2UhGdqH28CeIKU8hHn8bVlBTPIZzyMGd
         kim0VoLuWlB+MdfFiIrUxJgn6dQjSbUvCArmASL548dGf8vc4IWmiaKQguHornoFF79J
         yMw90q3BVLT8RocllWCA7fWHM6fro3yyPCoQIDQMezzQ1cTqm0iH/uqhICcYyeHjyaR1
         au1aUxQ2KKLfbYhnAyL+H7+Au9PMbfG9lIaWo+J5TkFqajpbJVSsAciBmqZ8D5S9WlFX
         +f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=oKW5g5ZKl2ZV+8vfqXkoGYJgxugrtwcBfpcl6RTpuUc=;
        b=g39Oq1CgiTMgRjkY9f843ZxTGvYHlSRngJOqqGxmPcvGfC1gka6UWRTiFjDbNk02Q6
         HZbGBPLM4X5Pgie6K61gCmDaEPCPTAml//PVDe98C8MiB1UdC7D8AdhCVCsN96X4Xb54
         u/0Ia9K4iOWLTa3zKsAMNiAIyvPFQ5djVD1hehePFlFwpSSwnCv9i5uIKq9eJ+cdZTZs
         cQMc/xsYWqt2PyNKLp3tizU4lbiRmt0o1x3TC25Jmb4dvqjdX1W8WReKQDTdcZg6GLRW
         75WPd2tGc+zTJVv/E7xSpKTff+TGoZ3QDdERK2Y40A7Dz5sM+GTnAl4kh4DVHfrPshe5
         7ZRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q73si1064761wme.1.2019.11.04.00.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 00:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xA48T4Nb009309
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 4 Nov 2019 09:29:04 +0100
Received: from [139.22.47.232] ([139.22.47.232])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xA48T3BA010219
	for <jailhouse-dev@googlegroups.com>; Mon, 4 Nov 2019 09:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] x86: ioapic: Rework and fix redir entry programming
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <19451234-14ed-4cc1-4ec3-bdfe80a6eaa7@siemens.com>
Date: Mon, 4 Nov 2019 09:29:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Currently, EOI of level-triggered IOAPIC interrupts may not work while
the related entry is masked - at least with QEMU as machine and
PREEMPT-RT as root cell. This is because we always overwrite trigger
mode and vector information when masking an entry.

Let's use that issue to rethink the programming pattern. The new one
works by still avoiding to map while masked but writing the entry with
an invalid remapping index. Furthermore, a redirection entry is only
updated in the IOAPIC on writes to the lower 32 bits. This is to ensure
its consistency. Writing higher bits happens first, either out of masked
state or with the identical value.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/ioapic.c | 69 +++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
index ee3b77f3..7b243097 100644
--- a/hypervisor/arch/x86/ioapic.c
+++ b/hypervisor/arch/x86/ioapic.c
@@ -114,49 +114,52 @@ static int ioapic_virt_redir_write(struct cell_ioapic *ioapic,
 	struct phys_ioapic *phys_ioapic = ioapic->phys_ioapic;
 	struct apic_irq_message irq_msg;
 	union ioapic_redir_entry entry;
-	int result;
+	int result = 0xffff;
 
 	entry = phys_ioapic->shadow_redir_table[pin];
 	entry.raw[reg & 1] = value;
 	phys_ioapic->shadow_redir_table[pin] = entry;
 
-	/* Do not map the interrupt while masked. */
-	if (entry.native.mask) {
-		/*
-		 * The mask is part of the lower 32 bits. Apply it when that
-		 * register half is written.
-		 */
-		if ((reg & 1) == 0)
-			ioapic_reg_write(phys_ioapic, reg, IOAPIC_REDIR_MASK);
-		return 0;
-	}
-
-	irq_msg = ioapic_translate_redir_entry(ioapic, pin, entry);
-
-	result = iommu_map_interrupt(ioapic->cell, (u16)ioapic->info->id, pin,
-				     irq_msg);
-	// HACK for QEMU
-	if (result == -ENOSYS) {
-		/* see regular update below, lazy version */
-		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
-		ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
-		return 0;
+	/*
+	 * Do not map the interrupt while masked. It may contain invalid state.
+	 * Rather write the invalid index 0xffff. That will not be used anyway
+	 * while the mask is set.
+	 */
+	if (!entry.native.mask) {
+		irq_msg = ioapic_translate_redir_entry(ioapic, pin, entry);
+
+		result = iommu_map_interrupt(ioapic->cell,
+					     (u16)ioapic->info->id, pin,
+					     irq_msg);
+		// HACK for QEMU
+		if (result == -ENOSYS) {
+			/* see regular update below, lazy version */
+			ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
+			ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
+			return 0;
+		}
+		if (result < 0)
+			return result;
 	}
-	if (result < 0)
-		return result;
-
-	entry.remap.zero = 0;
-	entry.remap.int_index15 = result >> 15;
-	entry.remap.remapped = 1;
-	entry.remap.int_index = result;
 
 	/*
-	 * Upper 32 bits weren't written physically if the entry was masked so
-	 * far. Write them unconditionally when setting the lower bits.
+	 * Write all 64 bits on updates of the lower 32 bits to ensure the
+	 * consistency of an entry.
+	 *
+	 * The index information in the higher bits does not change when the
+	 * guest programs an entry, but they need to be initialized when taking
+	 * their ownership (always out of masked state, see
+	 * ioapic_prepare_handover).
 	 */
-	if ((reg & 1) == 0)
+	if ((reg & 1) == 0) {
+		entry.remap.zero = 0;
+		entry.remap.int_index15 = result >> 15;
+		entry.remap.remapped = 1;
+		entry.remap.int_index = result;
+
 		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
-	ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
+		ioapic_reg_write(phys_ioapic, reg, entry.raw[0]);
+	}
 
 	return 0;
 }
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/19451234-14ed-4cc1-4ec3-bdfe80a6eaa7%40siemens.com.
