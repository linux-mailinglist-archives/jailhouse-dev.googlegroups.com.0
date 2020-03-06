Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMTRLZQKGQEHQVEUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F717C47E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:02 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id l5sf2226332eds.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516042; cv=pass;
        d=google.com; s=arc-20160816;
        b=vo0DvQiDCbJl9n6f9qAFhGLsLXIuk72UC6U241hAf8pkX+0EOFU3zhw7TluZ4srHlP
         bpfZIMJIrbfc35mtttto3Au5Xaav0xIFBFcE+keuvRM/kB4Q6x9tju8oTcDDzmN+Ev5G
         jYTloSE7OV0m881+mtogQdZZI8/XEf1eC0FyNL0AJK/W4JK0AuxCy8vdnk7GmTSgzI8s
         08JBWEFlLzqOamgGDetKV9H0LHM/RajAxiPiE8afP3d+ao5Frut3bFIIdeWWioQpgWmy
         e3c/n0HnDZkLBtsbtyRy9y00ULw/M6PriGpQH/Ul8Q3GPCYbXS29Y8utaDnedxnckmet
         ccZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=HEDEQWP2ZSgO3ha1ehZtLGT2BTBqmFfzA4ykXAkt48w=;
        b=02x40gNyXF/Y8VqAFzTQBPyAD5icD/eEYifVA+Kd2OgralVS+bK6av+EfqPPk3zWMO
         tgf4TYHj3uDt2uhV+UgwGV5uggtQ1AJhTYoQntM+d7PsWWF80Z1E5hIRYmMVqAV9myHR
         m9V/Wts9M2USCta0DLhTmhtHlKD5jzC6o7amV871B9hjFB6kVi+rLYqZJZKE3SgZ/Gpb
         yZUgBN+rCPvoghXo1i1MZfypqVMlmvbF0pcYWpIDJmTgJWGulzuVQcUicnr7pFQPtCYx
         WuEvNHF8UWsPi+YSmRtLxfYm3XizcMguAKQA3C2gdVB0G1Y5cvOjWKjXWHvbyIZi9uls
         VQ2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HEDEQWP2ZSgO3ha1ehZtLGT2BTBqmFfzA4ykXAkt48w=;
        b=Mkka+NI5jrN1IbTIZXQpmjosDmDzv3B89Q1pYGIsWvHQXkiu9eKW3Jclt5MmdTpWSJ
         D+hDaAeyDzRT9MA41eu1Yhg+/K+8sed7qCwlLHoR8OC2RKjzT1nBGVcO424rW51L6pi8
         Wl4SfzGsVJO2oBqaFVvq/yWkBFk0QJGuqnph8+/f3RN5SVulVGpytaMytx6orJHWCGQ5
         FS+JdsOcBwCYLX66xFBKvQN+oBgu1rRsX8t7C/0jG93dtPt0Z4dExIKLeCTmw5RuB5nm
         H7WIP4ZfLI5e5DL5d695l1puoUULpESe80vNajveH/8uBZ9MEmk3ezkFUI+S54TuWYm4
         bGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HEDEQWP2ZSgO3ha1ehZtLGT2BTBqmFfzA4ykXAkt48w=;
        b=a1ndfQBPL18WqY/n+qzEPPSUiSt8pJG3xj8DHsImOIIN1EXnDZm++3hebUs209hf8V
         +4hgYxnC/qVkZfJVKjZbJonQR2kD7jwDqFW0pZ37PkWa7mo3u4966gPEsM7Nm6H4bf95
         q28wLLHDp9gUp7lgNVnGx6npTRFBY9whGcrj2IUvHmOiYVMaSj3lP3oXfP/pd+UZ3jkL
         LXeQerA9GgzA0r7wwrQkCp3qw11T+LFyrXeFoeae4DCtcQRmYHmapZG1n0q4WqIj7SAB
         ObIRSPR0Vmx2fyCgDJxI2Li/YvX8uYYyuhtd16wA3qVLJaaWpsJ9hUAiK/m/6JNTlv8m
         Wm9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1XYEqIv5gX4OfaWflIVgoOM9XweohuJSJl4I7LydfbkboqmxHf
	WHG45DPSjMk4BcwPwrOuiLA=
X-Google-Smtp-Source: ADFU+vu++cakycqLQsfCH4O9VxX8KJNsd36Lvc4QbnMOxmfnD5BjLAjaZtRDc8qadNYUfsQfTOK3qw==
X-Received: by 2002:a17:906:29d9:: with SMTP id y25mr4012705eje.93.1583516042083;
        Fri, 06 Mar 2020 09:34:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:278c:: with SMTP id j12ls1315706ejc.5.gmail; Fri, 06
 Mar 2020 09:34:01 -0800 (PST)
X-Received: by 2002:a17:906:4c50:: with SMTP id d16mr4013976ejw.41.1583516041287;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516041; cv=none;
        d=google.com; s=arc-20160816;
        b=YvlCrjNM/RBZi7XplWPnJXzzThp4bZw6RWJK0PBEavcgFsDWPQQGbo6Czw/SD6PE9z
         +eD91pnIlJneRPhl3VmGZK+AeSq2mIgtWfBsl5OWFM1MQVmD1wtPHoFYKejxwvrzrQ9w
         kXqmL6oB9XCMcjToQ6MFzcjGOEDYMnwSpXhCNZjGH3CKRp2iKJybwmQoVWMRVhfwSw0X
         bjj5A/Y00S6LSaYY2tLLHv9YT5Wr3QOddzEtXvY6L8PXPqDV7dhRYmC3k3Us7RUdxHRN
         XVHKYv2/5i7dp8/TZfWzQX0cxdTDwszhU0oWkFYqe1LrDAbmn+M9YD/p/OLapXP4gdCS
         KqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=yz+AI6QVNHH1VkNJZtwW9AVGeEjGC4WEmUl8JzADu6c=;
        b=XndT6DWNRBJ9Ze2+/MNtN3RHOeJx4dqVSKsGOc3zbHrNiP/BTcual1chtY+3+rdK8/
         5RCo6CgGrcCw7rYvmgRYYcYrcPjBzTeB/sORFTvBI0w7WFsnhNNmyvDpB4YsrrrMdJVY
         qXj5cNl+sm+U5lSEu7CgnstNQO/rjptOncwzIoWOm7qyHteAkWx0xqTfebWj+3+oSYKZ
         JXW3dY4l848BVlXjtP8VneswOBz34a+a0b9JoIrpKQiLcsxPySZKq5XGgGvqcHg4e5Ij
         ZVfXuEI/AANq7gkoXcz61wA84g7IIuNsBrXnbbY4BYy9XTwiL/IczXwv1W+Z1UH9L2g0
         T9FQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id cw13si185463edb.2.2020.03.06.09.34.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 026HY0vD000763
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0a8016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/6] arm-common: Add memory barrier before ivshmem interrupt submission
Date: Fri,  6 Mar 2020 18:33:55 +0100
Message-Id: <cb8d79bbc2caee07fbc2d9ed86af15e040a70c35.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This ensures that a guest will not see its data lagging behind the
signal when triggering the ivshmem doorbell. We are going to demand this
property from the ivshmem interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/ivshmem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index 98206f05..14e31da4 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -18,8 +18,15 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 {
 	unsigned int irq_id = ive->irq_cache.id[vector];
 
-	if (irq_id)
+	if (irq_id) {
+		/*
+		 * Ensure that all data written by the sending guest is visible
+		 * to the target before triggering the interrupt.
+		 */
+		memory_barrier();
+
 		irqchip_set_pending(NULL, irq_id);
+	}
 }
 
 int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cb8d79bbc2caee07fbc2d9ed86af15e040a70c35.1583516039.git.jan.kiszka%40siemens.com.
