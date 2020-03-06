Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMTRLZQKGQEHQVEUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470017C480
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:02 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id x14sf1291932wrv.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516042; cv=pass;
        d=google.com; s=arc-20160816;
        b=sVXk59a/J0xG0bjtQEQ022xbp7wYJQ58sU4qhEpREZYZ7wANQL8jDcCWn1IVFiVQ2t
         3szHrCcu+QRKOmXct7lqvNk4D8NDh064c6sXotBsWft05Sxm092i/K2eW75kP595BtCl
         zqZla7rwGSyu+pQHWsT3cw8I717ALxoqujzWtb8j0EJeDmPF588w+XWVrgC4Y3NcvQzv
         bw5XNEuqiDgpTabVTaYnAkFxT6t3hrdgw8GO0mZcwWqWmqsW5G7uFrOvqwDCdgV14saE
         FJSHDJLnyK+VzGbjLzbMtvzn0sWJy1Ew9dkrCL5+kj1SchkKxrAFkrI0cQWmhiNmKLiJ
         eShA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AiazJXpSj8Ryl6LWsJTO2AkfiNGcjRbO065iDS2tElc=;
        b=YhqoBe7f5R4sodYbLsuiSll1Vjo8eLpBpG2DpNP49CkPz7o4RDZ4L554+Q+O0+hMwh
         HL0rDv9p/iPKlCrKZrE119i0CbrA5W5ECwgKb3a5OP/WvbrkkUn8d+Eipzrui019a1k7
         OxQ8ySA/mfkxGSl9G97qKgu+xmcfJaLjPceYMG7ZmcpJrkxi5IwgAHZpHo6i9CBnKxnW
         fVzi1Yx+GxaATeMujeLMv89eIsZmTygnD0SXEPa7ltHMToNCIhZ3N90trhl87D4m9N7Z
         9QBjH+xwM8/wiEQUQT6qDUuG7hs7+zl05Kk8ICDfZxxnhi9hSPYZ7f0uejxV8ak/abz6
         1wZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AiazJXpSj8Ryl6LWsJTO2AkfiNGcjRbO065iDS2tElc=;
        b=Ok1dXKg+oUzwRkzTRX9IvbHfxWAIDzqAnG1Jt8d7uWaJWpAGdD4GmbPc7m2ULIcXdu
         N4YOvZh382fSgrqEo4k9tAOB0jGtILFFSrihaLLlxQ8U5uAFEAATw9Nsvw0qsCaVoHPp
         i1yp/fYnUW0b+eypJCLdHR5rWix7W/2NBM+WS60LrNOOiQw2UXzfPX4JZVl+P6/xUxLq
         Ri6YuWluZnutMH7kwP3ZxmvjBocfOKt6hDyOU6+qRyb+uHNIJ8fmcG0bv4XSGSBQW0oP
         8bHL9ey3QMjIruQru3/Dg8CqgA2x1thmNhNYJK0VN6z6hYxQQSzDJcR8BQZ3H4UQRRuY
         /6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AiazJXpSj8Ryl6LWsJTO2AkfiNGcjRbO065iDS2tElc=;
        b=s1VRndhCLy482/A1OZBu2inCxntpbsUjT5IGieWpzBI9j+XvyF2G9VTPNw1K+rfs9F
         1TUnK4GCteFhmzwbPgY8iDc/pgSnef76O6IxJXh2EigLmtAO1p4PK5nbwuWsMvWIbTbf
         T34qqro+1UaeC1QCCxjxgltm6In32Hzak+I1HFA09bSGxTYmetfM4JIeEOKjTfsBoZPR
         paSo4iJBh3oW3cidHe0RCw0xGwjZTW7fsLegugRZ/Ji1AR/DBIGVxiEftxpkGwbS4uPp
         omkCFik5cs2lHc6gEgGcCpUIxTkc1KCVgLCjdzFagYIECNC8vr5utsMuEpxjjV21aAUZ
         ZF6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0qyDGoT6AQTOet7I+3nQRlumVUOLM1IjV5+1SJY2xlIrD3agSq
	ufJJMR1drSPfhxhr3stv62o=
X-Google-Smtp-Source: ADFU+vs445hQR6ECH7oId//8YcbepV1f7xm2ZIhgrCn0uLYP4rhEAn5KyRVs3VvBBHA4w8KEvljAng==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr5336749wma.177.1583516042005;
        Fri, 06 Mar 2020 09:34:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4c6:: with SMTP id g6ls2017773wmk.0.canary-gmail; Fri,
 06 Mar 2020 09:34:01 -0800 (PST)
X-Received: by 2002:a1c:2358:: with SMTP id j85mr5382982wmj.137.1583516041191;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516041; cv=none;
        d=google.com; s=arc-20160816;
        b=wHwThJFo2Q03RkgriXNSTHllDQZkIpBBaa6Zd2FbeAYn3SMf4/nU6JAj2Higxn2WSe
         L/A7E1piZLfyXOmWjkwiSgZccvrO5GEkJ0CzQ6Xa5I6axSnmhw3teNn7hZp3d7MnmfmW
         UMf6J6owEMa3v8c/kORDv2W32Ul//bvCh/SNShUJP0TVW7JJH/Ug1/xAPsII4bH+tpk6
         ugFMQKWBKlVaF7w0R8Y4tYxba5ci6kpgva68dbGHHhk/WEUkfAr4jqPunDUrIyKmx6PL
         HUTbhSmn3iCtRdngzjFjvoIu8F50Fbc+Lra2myF5MxjSZ4g0HwZSwSThPdFc5hPZJN47
         GhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=txdI1GE3li8atG2xUays5D9acdzoEf2+6ivY7wIOqm0=;
        b=o4x0ggyn9iNhAz64HcJ5EZ5BLYXRo4NHyC3/a1YiLmw5jVrc1varOxEpka3Fz5TzyA
         vpnv2kwuYiimFzYboi9OnIe9l5ayKlJLRLZRR2Cl7C/5IFJ4Nnf+SESNrw2GxA/L/71j
         rXcLIzLMfJT6HZndo6TBBCxeVyeuhz0/HPYdWOIo+WhyqxM06DDQytLf3vZwmv8mF3yp
         z9S0ZP6dRlgzq3kRZu0tGx9wd68srl+gPiW5gglZNt7bYq3rx4vA2uk/0aTJ/unDY61Q
         SCbZvrJ7kozGCTOX9LDz5w9HgkeGOsqXFHkGIQl0+PuMRehHSEdTYCq2qK/3mDpqb+i2
         iLsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q9si114488wrx.0.2020.03.06.09.34.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 026HY0Sw013261
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0aA016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/6] core, arm-common: Clarify role of spin_unlock before event submission
Date: Fri,  6 Mar 2020 18:33:57 +0100
Message-Id: <19cf7a61caaa793bb533d38b531519e703cccf49.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
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

On ARM, the spin_unlock is sufficient to provide a memory barrier before
calling arch_send_event. On other archs, the implementation of
arch_send_event has to take care of this. Clarify this at the respective
call sites and the function documentation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/psci.c      | 5 +++++
 hypervisor/control.c                   | 4 ++++
 hypervisor/include/jailhouse/control.h | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
index 65155710..6a9abf60 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -46,6 +46,11 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
 		result = PSCI_ALREADY_ON;
 	}
 
+	/*
+	 * The unlock has memory barrier semantic on ARM v7 and v8. Therefore
+	 * the changes to target_data will be visible when sending the kick
+	 * below.
+	 */
 	spin_unlock(&target_data->control_lock);
 
 	if (kick_cpu)
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 016f97cc..b38ac2e9 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -102,6 +102,10 @@ static void suspend_cpu(unsigned int cpu_id)
 	target_data->suspend_cpu = true;
 	target_suspended = target_data->cpu_suspended;
 
+	/*
+	 * Acts as memory barrier on certain architectures to make suspend_cpu
+	 * visible. Otherwise, arch_send_event() will take care of that.
+	 */
 	spin_unlock(&target_data->control_lock);
 
 	if (!target_suspended) {
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 5476d590..9b94f563 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -180,6 +180,11 @@ void arch_park_cpu(unsigned int cpu_id);
  * When the state of the target CPU was updated and action is required on the
  * remote side, this function can be called. Processing of the state change is
  * architecture specific.
+ *
+ * The caller of this function is required to have performed the state changes
+ * under a spinlock and called spin_unlock prior to this. The implementation of
+ * arch_send_event() has to account for the case when spin_unlock does not
+ * imply a memory barrier and issue this explicitly.
  */
 void arch_send_event(struct public_per_cpu *target_data);
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/19cf7a61caaa793bb533d38b531519e703cccf49.1583516039.git.jan.kiszka%40siemens.com.
