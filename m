Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB46LZTYAKGQETZFSI5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 5355F1311FE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:04 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id ck15sf30651085edb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313204; cv=pass;
        d=google.com; s=arc-20160816;
        b=vKLOiQthisNzrit7ayyDNAHgIxBLJ7knDBHhJhxUb00crgDgy0m8+Y+Q1TaCHD+y8+
         FpyzNc+fMvCwknqttfjgL70EFbdAIVOCBiN8FSuZ7vRpGMTvguPEzgCOdausAQYeOzjL
         XEPVEngi6Ot8dRpqdDc5NgLoK7vRmeL8VvYBJy959S5xYwZpBkVHdByg7hgzNGIyUGiC
         e9lmEEPmPeJ8ls6DBqt87hNp2WGbHH2YdwsROF2oV2GJa+6vuCGWRSn3aUq/zQS6guwF
         ht7neAg0r1kEfViUPqzCrmTqbHieaoeneCzE1lDa1c4ypMKEolpirvXjfiqPe7psOdjI
         59yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=uTtmeh659jiA/e0akqrfm19Np0/aWfg2aQ2KmdpDeoc=;
        b=m5gw+5H17MulCzJmOQlHuPF+re7iUY1k9duCaYYNgo2WTtpS4lWqI6IHDT8zl+D1sQ
         MVPuLPovONE4vCa6rjzWAzxThEjpKi2QVRYQ8uD8uipDKIn3A8mTzTefy0yOC13ELDn/
         Ep/rnQmWHJ3iro0ympjGmxKSfN9fr2p5Z3UwQjwjDKZN42OBAOzBepwYIm8Lil7yejVu
         n6yqnb0xAeBSaErgsQ7KJ6fMH7/zBWvcjy0oIW35s9TTWyL7pUgEyDR1xWu5DMC73/DW
         SPALfxOGK51xQocSHfPfLeOKr0oMdkdSm/4WeFHtD9DkkcB4SicSbT38j4C+mvQKIuyj
         62ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uTtmeh659jiA/e0akqrfm19Np0/aWfg2aQ2KmdpDeoc=;
        b=kt2UnC1oU62iyTbcZ/+8aLVMrMpXtwr0bBl8lPvSTtbAtxCD/jf1atg6ToL050wF5T
         FS15rriwr+4g0gidQMdkyP0+zNFvJQQ56FDPkkG9UvB8JjX3KJRp4uJhq5468wCJunMj
         u9M5uX4JrZCg3PcMUMxVcitLucJtqPE084jCQC7VHS4jfpO000k9XCkUYOcQHCLSQXUM
         2fJBwMxUGg4pa0Xg/ikRmsLphP70Tid63q7GkRgxbWIfctJZvlj0di7qJAXg/Ul9p1Ty
         DdQnwDOAmBeWTAy5j2/MAzfk1jKlnVRwXk5zSxF7ET3JzvwV4JBSBatz/VG0+vlO48FI
         bgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uTtmeh659jiA/e0akqrfm19Np0/aWfg2aQ2KmdpDeoc=;
        b=VM8tvf1DD+DIw81MHPAcC2w2/SBUabQ5MMJmzE8KmSRb8DSlQUmhwb22NgJG2Wqi/w
         NDh/n/3gZUD1j8+xewwyXQIhkhDEQ9AJY9egtDPwVOkwH6DNvTmmBqJKyEIKt5MwvWts
         tGkjW7rIlCaH4xvQLx3d+/nQbW5D+YgILvYZ0BXjYpvu46x5jSGj+hmmyZxrUyof3y3Z
         Ha2cgX+eAk/3okqPxProP6o5B6mCSTBkBIw2V6hHDel/XoGC0oj6gvGsqLY1TZgikYeX
         837jFBi+18VOlAzp3JCRtPz2aV+IpStxaNmJ1V05f1+7v5q+DHdJdt9mUbVQ4hO0OfjW
         lEcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX442lOsglYlYdYT4INI6RmMMn0PlQYY/T8eCZfo8ySa4v7XwR4
	H724X9Nb3Tzm8yzxCEKzfkQ=
X-Google-Smtp-Source: APXvYqxPY3jWf02UEwMRxzJoOOksS0WPt7A/1BhZfrf3H5YTOweqgH2VcxShYHMsAslRpdFTgUMh6Q==
X-Received: by 2002:a17:906:3786:: with SMTP id n6mr109023706ejc.124.1578313203994;
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8597:: with SMTP id v23ls15483224ejx.6.gmail; Mon,
 06 Jan 2020 04:20:03 -0800 (PST)
X-Received: by 2002:a17:906:19d0:: with SMTP id h16mr100767576ejd.70.1578313203180;
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313203; cv=none;
        d=google.com; s=arc-20160816;
        b=L+eZHbhdyU+DmpbYT5HymJiZwlBr8PypJiBGOkbi4M3L+E4nkMzJjz8Gx+5l26g4ll
         WXqV81za13s8JoXWBB9na6pvVE34OLQZfNEmeyQaiyUQv7P9wwynw8F/301Odwm7xZBg
         8s72TmR3cIx1HWZzBfvCghGMHesB1xCxynUIo+3wE8hf9jZAHpb7MFtwsd2N4W7YrUZ9
         ZcjC8/xPjiGdKObDx4utKmKWtgurEzeOklfOz1p9B6sCV82Emx6Iph1nB1BIPeOAhxjF
         ND0mYEybu5r21BqqAIuF2YnBMSuH1OAtTcCdQc9p4OWSsUfp0sGGiaSEvJrCbjI9272o
         36KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=ckRc01YJS/XPW7iSaDZhwMsoEFNx9Y+JJVRVGpis6Yc=;
        b=TDYS9GtZOOxJydnUU1m6i9aoZ/cUEZFCfmcdiBLZlrYqdpm6KxCIeS6WGITwynIPWy
         NVhbqxAblAdCKMhPoZUdJYgS0HARDMrtuLn8ruK8JGlyyXYnGKnA17zDp0K0XVyKeFda
         c7FfeUYwG3/kDVPP5Uqe2o0ZbOYiEdTd0GOdqvUbtS2HOEWBT5mOPCp7nb97+tV6cV/n
         croW8icPwbytfE0VjJBIT+qj4WwpM9M2T/vsh0USNkCC+PArx1RG6A0+UxV6NENxFnF5
         iQ08j+xYzVEEJOiKOZf/CJ8ZMmBRF9neRpocyD2TlB8+1MhHjORMiaHGkwtIn+RDbKzR
         kcgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d29si2534792edj.0.2020.01.06.04.20.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK2IS025121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:02 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF1029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 27/38] core: ivshmem: Re-add target ID to doorbell register
Date: Mon,  6 Jan 2020 13:18:08 +0100
Message-Id: <2083bb0e8d32a9e6f51f1bcf2838558268013bf1.1578313099.git.jan.kiszka@siemens.com>
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

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index bcc20ed2..72699437 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -79,26 +79,22 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 1,
 };
 
-static void ivshmem_remote_interrupt(struct ivshmem_endpoint *ive)
+static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 {
-	struct ivshmem_endpoint *remote = ive->remote;
-
-	if (!remote)
-		return;
-
 	/*
 	 * Hold the IRQ lock while sending the interrupt so that ivshmem_exit
 	 * can synchronize on the completion of the delivery.
 	 */
-	spin_lock(&remote->irq_lock);
-	arch_ivshmem_trigger_interrupt(remote);
-	spin_unlock(&remote->irq_lock);
+	spin_lock(&ive->irq_lock);
+	arch_ivshmem_trigger_interrupt(ive);
+	spin_unlock(&ive->irq_lock);
 }
 
 static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 {
 	const struct jailhouse_pci_device *dev_info = ive->device->info;
 	u32 *state_table = (u32 *)TEMPORARY_MAPPING_BASE;
+	struct ivshmem_endpoint *target_ive;
 
 	/*
 	 * Cannot fail: upper levels of page table were already created by
@@ -116,7 +112,8 @@ static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 	if (ive->state != new_state) {
 		ive->state = new_state;
 
-		ivshmem_remote_interrupt(ive);
+		target_ive = &ive->link->eps[dev_info->shmem_dev_id ^ 1];
+		ivshmem_trigger_interrupt(target_ive);
 	}
 }
 
@@ -149,7 +146,8 @@ static void ivshmem_update_intx(struct ivshmem_endpoint *ive)
 static enum mmio_result ivshmem_register_mmio(void *arg,
 					      struct mmio_access *mmio)
 {
-	struct ivshmem_endpoint *ive = arg;
+	struct ivshmem_endpoint *target_ive, *ive = arg;
+	unsigned int target;
 
 	switch (mmio->address) {
 	case IVSHMEM_REG_ID:
@@ -169,10 +167,17 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		}
 		break;
 	case IVSHMEM_REG_DOORBELL:
-		if (mmio->is_write)
-			ivshmem_remote_interrupt(ive);
-		else
+		if (mmio->is_write) {
+			target = GET_FIELD(mmio->value, 31, 16);
+			if (target >= IVSHMEM_MAX_PEERS)
+				break;
+
+			target_ive = &ive->link->eps[target];
+
+			ivshmem_trigger_interrupt(target_ive);
+		} else {
 			mmio->value = 0;
+		}
 		break;
 	case IVSHMEM_REG_STATE:
 		if (mmio->is_write)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2083bb0e8d32a9e6f51f1bcf2838558268013bf1.1578313099.git.jan.kiszka%40siemens.com.
