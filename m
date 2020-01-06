Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5OLZTYAKGQECQBCM6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id C06CC131204
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:05 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id o9sf6663187ljc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313205; cv=pass;
        d=google.com; s=arc-20160816;
        b=SWc5Qy0Go2IaNIWtbvOkD/J9wSxyKTuCD2lofyZSYDxFx1wekuxfSwJx+272tM38O8
         ZkLecHF3Ofr86lkE8bDAv+HoXc4J4YcmKPx1/e2lEzWZ+pJvvfNJc5fC7NbeeVamUuDX
         2pflkuVV3ABeiZ7ydsD2DsZsmXUAUxTQ+1F3Gq05LoWNMdYzTJm14hFwkmf0AU8pf3a4
         oymyItqSry8VTJH3gTGVa46s+IYRGhTKKgaYtIuxj3uQ6dqtjskxRMALkhaL9pbIsQ1f
         EXQPTKNLPxoHVscsHOzgXdfC6wcNDsXkJDqJ1iXtw/K5HTj9GBHNAPwC0lzujsQqUdB9
         3BNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=7xhandMh/FYVwNLaV1kRLmozAWhN+JEbVLDsR+UAs+8=;
        b=yfDex+FeurUm4E88M2DG7buOZSKxcl9p/1E8gXOfZK9tmNzK/YGPdeOOojuOAEHBYf
         Vaz50m6nYaThHVYLsAjysyJRNoN3c6KD7f06flb6OhkXPzRq8qVAZf2xf7ax8kIfPBfj
         A9G4u53TXt5ru1+64Q/HJsguCz8F+xCwu1U7s0lfDe9A4ta5izE/fPD+o3r/ZE2TMVr7
         vcoX99hHptFPtFtRGZZ74lTKuweqmZhaj+GnpHsL1LHL8vyyFGNUmep7Z4CvK7bQO/js
         G+7mCeV+MJ1Ult1jseUMvbslq/o8WxYjvD0wTvB+OoPeaahOhtOmApcU7p0jXwuASqhg
         KObw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7xhandMh/FYVwNLaV1kRLmozAWhN+JEbVLDsR+UAs+8=;
        b=Qt3a7Gm78gQFjsMJUHl7ci8g90oNE74WaNwbMyiJc46mytfGqQYgVu7XJzhTYjpHpF
         sVPSTbwmlF9Ikh7ipNZfBsJjAlcj8Rsj6LCnFzZcxpG0lB811ADu+nwzzpziT2cShKuQ
         T/TQ/mBGYm5w/DSdYXfJCDgKr7ef9E3jgMDvgT/Lt31mhKZsdvmhoQRqWC6HOoJ+ywMS
         cffebMLW+C9FyBWdqRvVxMPZmWW6vvziOm08CVM71o/HhKyjoBgKe+o5UsDTDCckzjUu
         fxSSYKxKqja7Z1m/zfqRPtz93u+KZkuLFxYVma/48No9/yeEFaqNQsCxSwEMSC85vhu9
         9aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7xhandMh/FYVwNLaV1kRLmozAWhN+JEbVLDsR+UAs+8=;
        b=TPiVv2geacAo4ttY0FsFSB1+0tWi/Q8xzjSvNMUvF4bMJi1qdBCN2RcKQFpEhU1OgN
         N7t1TWNrAhZgF6Wk5L5yt9xh/pHIl+soMSMRS7MdVVD0tAVhrkvdDUXxuTYJ2oEcHwa9
         dW41oFtIJeOZY3RcC1HkKfvs1gvBoRgInM/FixuiVzDg6s0FKhNzVkmjZRjZRvQIDl2d
         m44ofe6p8M8eHVFlhPpYXFLbE7PtDe6NVoOtLer2Euw++oK4SGe3YpRECQVb4AL8SCTR
         sbYpy5gQOtdshQBi4FHWsz1euaW52S15xiPKWqzGDeZLkpia+2829l2W42gEDFf5xtN9
         8mew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX3MOO5Slawam81KQq4Jj8nrqfg66L1e02GdQaHMVn6YbWfGD1b
	hjtVLsETq0wmOGN38rbS8/k=
X-Google-Smtp-Source: APXvYqx2cSsShMXhlLDKlau9sK4+YP/gl229uRCVoNVXWzx0XXRF4twIf1DvdgRL3xoUBWfKqPztaw==
X-Received: by 2002:a19:710a:: with SMTP id m10mr55560653lfc.58.1578313205364;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:51c:: with SMTP id o28ls4120325lfb.4.gmail; Mon, 06
 Jan 2020 04:20:04 -0800 (PST)
X-Received: by 2002:ac2:5147:: with SMTP id q7mr56545300lfd.87.1578313204542;
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313204; cv=none;
        d=google.com; s=arc-20160816;
        b=mF+mYRBrOflRfQ5kshLROOXRXpnBxNcIdQK1UXw5GAWafXa4ex2kUYg6D9Nds1ezw/
         XbiK3zZ8SIawg6tGcQsKB/UbJWvcDowFAxx4SySs8C1XCghgy9d3qFCFtigDVGp5ybKQ
         sX3mrjOyDcJ6L5+svGZt+g4dhfiq8BMJMax1Vvw4AcORuCfqS6fpnOPqWE9qOL+YkjsX
         1Ru1iqWIpKgsecFyDedJZIx1TUksp51rnIM3ANWy6T58N/h4ZWDAAHlOFG3FF6nXOm/U
         hbecIv+IRhFm8Mjg5AGqel4gJ/dtomzDnhM8GMsgx9CErPSj0KzyfucbhYRle7rM7yZN
         tBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=y4Xk7EK+ILfYBL2WRxg+z0g4kYyFyK9qJBMzFHKTd1M=;
        b=ZfhdRuEEW8yEPCrwiy4zwxnbN1GsMMasBFJMW3/0FsVDcbgisT0JjCNgfHRey590FW
         FYste9JabCAOzXwlVv6GiNaeujFo2y2es2Ds5i2F6Pkn9/enrsf11WshShCpc5pCjezN
         Lh59R2yN71YHO5SXFIuiRXQWlEqN1Hx5R8ZmXTvjxxGhHrZ1lqEIHdiTly/GXUBtLE/b
         wOXtj+FeAxqfxCAHeJed+YRFBsSGbqO2WjKiLnYM7Z90aCTRpc4DfPC0nA3oE77fd1Bq
         /hxjw4g2C5PH2MKXJ/qjze6g8UWgAaIFj53EZhMFn2artrpUbVk9s9UK81ETZLyKOk79
         sfdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a4si2157370lfg.1.2020.01.06.04.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK3dD021224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF5029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 31/38] core: ivshmem: Expand interrupt control to device level
Date: Mon,  6 Jan 2020 13:18:12 +0100
Message-Id: <e5d2e732d94b7cdb9695f32049d9b6fb65026a93.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h |  8 ++++----
 hypervisor/ivshmem.c                   | 29 +++++++++++++++++++++--------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index aa5472ac..544432d0 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -23,7 +23,7 @@
 
 #define IVSHMEM_CFG_SIZE	0x80
 
-#define IVSHMEM_INTX_ENABLE	0x1
+#define IVSHMEM_INT_ENABLE	0x1
 
 /**
  * @defgroup IVSHMEM ivshmem
@@ -34,9 +34,10 @@ struct ivshmem_link;
 
 struct ivshmem_endpoint {
 	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
-	/** Lock protecting accesses to irq_cache, also synchronizing
-	 * interrupt submissions with device shutdown. */
+	/** Lock protecting accesses to irq_cache and int_ctrl_reg, also
+	 * synchronizing interrupt submissions with device shutdown. */
 	spinlock_t irq_lock;
+	u32 int_ctrl_reg;
 	struct arch_ivshmem_irq_cache irq_cache;
 	u32 state;
 	u32 ioregion[2];
@@ -44,7 +45,6 @@ struct ivshmem_endpoint {
 	struct ivshmem_link *link;
 	const struct jailhouse_memory *shmem;
 	struct ivshmem_endpoint *remote;
-	u32 intx_ctrl_reg;
 };
 
 int ivshmem_init(struct cell *cell, struct pci_device *device);
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 46a18d0d..a7c8aeae 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -51,7 +51,7 @@
 
 #define IVSHMEM_REG_ID			0x00
 #define IVSHMEM_REG_MAX_PEERS		0x04
-#define IVSHMEM_REG_INTX_CTRL		0x08
+#define IVSHMEM_REG_INT_CTRL		0x08
 #define IVSHMEM_REG_DOORBELL		0x0c
 #define IVSHMEM_REG_STATE		0x10
 
@@ -81,10 +81,14 @@ static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 {
 	/*
 	 * Hold the IRQ lock while sending the interrupt so that ivshmem_exit
-	 * can synchronize on the completion of the delivery.
+	 * and ivshmem_register_mmio can synchronize on the completion of the
+	 * delivery.
 	 */
 	spin_lock(&ive->irq_lock);
-	arch_ivshmem_trigger_interrupt(ive, vector);
+
+	if (ive->int_ctrl_reg & IVSHMEM_INT_ENABLE)
+		arch_ivshmem_trigger_interrupt(ive, vector);
+
 	spin_unlock(&ive->irq_lock);
 }
 
@@ -142,11 +146,10 @@ int ivshmem_update_msix(struct pci_device *device)
 
 static void ivshmem_update_intx(struct ivshmem_endpoint *ive)
 {
-	bool enabled = ive->intx_ctrl_reg & IVSHMEM_INTX_ENABLE;
 	bool masked = ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_INTX_OFF;
 
 	if (ive->device->info->num_msix_vectors == 0)
-		arch_ivshmem_update_intx(ive, enabled && !masked);
+		arch_ivshmem_update_intx(ive, !masked);
 }
 
 static enum mmio_result ivshmem_register_mmio(void *arg,
@@ -164,12 +167,21 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		/* read-only number of peers */
 		mmio->value = IVSHMEM_MAX_PEERS;
 		break;
-	case IVSHMEM_REG_INTX_CTRL:
+	case IVSHMEM_REG_INT_CTRL:
 		if (mmio->is_write) {
-			ive->intx_ctrl_reg = mmio->value & IVSHMEM_INTX_ENABLE;
+			/*
+			 * The spinlock acts as barrier, ensuring that
+			 * interrupts are disabled on return.
+			 */
+			spin_lock(&ive->irq_lock);
+			ive->int_ctrl_reg = mmio->value & IVSHMEM_INT_ENABLE;
+			spin_unlock(&ive->irq_lock);
+
 			ivshmem_update_intx(ive);
+			if (ivshmem_update_msix(ive->device))
+				return MMIO_ERROR;
 		} else {
-			mmio->value = ive->intx_ctrl_reg;
+			mmio->value = ive->int_ctrl_reg;
 		}
 		break;
 	case IVSHMEM_REG_DOORBELL:
@@ -432,6 +444,7 @@ void ivshmem_reset(struct pci_device *device)
 	 * any in-flight interrupt from remote sides.
 	 */
 	spin_lock(&ive->irq_lock);
+	ive->int_ctrl_reg = 0;
 	memset(&ive->irq_cache, 0, sizeof(ive->irq_cache));
 	spin_unlock(&ive->irq_lock);
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e5d2e732d94b7cdb9695f32049d9b6fb65026a93.1578313099.git.jan.kiszka%40siemens.com.
