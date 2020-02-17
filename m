Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHVRVHZAKGQEEJIUNGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id EA630160E24
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:54 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id m15sf8558511wrs.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930654; cv=pass;
        d=google.com; s=arc-20160816;
        b=T36k6v4ZL9Mky2uURR+B1a6/iTslooi2dgrfX0JssHuS8aHXPlvIXukbpDThdA8i8F
         x/M5QW3PrKC/+tal3DGhWpEi24Us4XPGCbXNZT9r9P8Vx/VFhmMczL+xvb6WEyV4oFEA
         qNtoxvIAFsq5KIQFUN+9wq9OMfT+xdBfbocg8zLtNkZHpgTV48yV1phvwUKXB3hvbfmr
         +tuw9wlM43UXsRntoBFAIHIeX69xOhOUlod2EUBoGO87iO9l9/4/KOc4mZgRR36bsnCf
         UIawxNVggHEAjxVZQX0uR1YGs9/aQjb9kRNrHj3/j3Z8lv/adx4rlvbx9PH1Vy8aHoq5
         Bnaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ZjUGwbaITXa0AoRs+PNiDzvq0KuaAfAY8eVFSGXQlrg=;
        b=bz1rUzkAdXycYP3gXBEX+RIDin/fqDjwexdAOuyJXCOs9xcQOrv5u+iviTyFewzVez
         ZmxzkfvUZWOMvrsJTrjzUv4bE9Pau44M0/pkRrpIaBQJMzq9MwGq8pRESeX1Esl4agvC
         YRHNrz76zmfWgTuYex332U4MsZhDibqzDusOZ2z/iNLBeKEELzKmvCbInc64FXLfvpGl
         Z1if7qxUhnT9JaihZQPuBxylBfBaA0KmhDk3gbSy7H0xwI96u6T+GMoWxLxtGA5nroXc
         nUJiN16BABbmC0cKxodSJK38ijFN8ZGVYTt7JPPUuyDNlU3RBCkXH+tzTHtmJetS9zPE
         9eQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZjUGwbaITXa0AoRs+PNiDzvq0KuaAfAY8eVFSGXQlrg=;
        b=f59Pz6TlvLsZUQJhjfkkNMEZnl3z+p+iCVx/WOp3V31cKZlFbefYJ/DpN2ZpVl+KXX
         Od9u8cecP3VtW3npLKReFdG2SW/1QfF8KuEmt6SczdsVnJcj8Tugcj8dQNttYiNnV6AZ
         s9wuVXDErjteONCURPbaWlU0ZlO/X9KRwZotBeS867y5Tmly44QB8f/WEVfNHI7ttF5f
         dz0Qd/btbZJhg7zZW8uHzoNy4fgXOxNECMX/Ivw+oE5Pw7A+4ySCH5HHloH5KpcaQcrr
         hkfK4KHRauSvoPylwLPUusOC/M4GXU+pn0TO/IK9kXQy8UqGM0l4jqM7lDpqFWk1zsKf
         L1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZjUGwbaITXa0AoRs+PNiDzvq0KuaAfAY8eVFSGXQlrg=;
        b=PJTP0sxGlKOtgJGj/VDtiK+O9pqdm5Nl9SOJ8xrjSAAhBkRPf9uHsLqVmpHNVZVu/l
         v2Hic8f5eMi8uuGAw7t4ANmti+6swfAN0UdF+eLnmVJqEftfLIj3KaK/A0JgxrXXTPxg
         9rL82C0hIBZedvW1bOeQUEPazp4eEgc85aebvvyYvqgkBoYMmJ0v0ybEbla7RSimycgg
         weygpDBdH6zgKgl6KHoVObkyruBqiofpi+XnQmD/u1rpAfqXwelIJkBNSfSUuf28kvrt
         pGpz1wabAWnKho6JpwRyZu6uoKtlf2+rzyohWgwVWZtwrze0kNzFZa41wcVhsGsoZ3UO
         nd9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX+scw1FTjcCBg4db6dTQcAUmGuvDYboUFHK0XDdD2ewRWiWcjN
	dtP9578yF/v/15zlNu7mnE4=
X-Google-Smtp-Source: APXvYqw/hgANO/W7P+2kxgyBbNX7gXFhPEkEBlmWWdvfzngja9vfkoqscJ+J5H6w0OSsWMY75s1yLg==
X-Received: by 2002:adf:e781:: with SMTP id n1mr22235806wrm.56.1581930654672;
        Mon, 17 Feb 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:100e:: with SMTP id a14ls5173883wrx.2.gmail; Mon,
 17 Feb 2020 01:10:54 -0800 (PST)
X-Received: by 2002:a5d:474b:: with SMTP id o11mr21747652wrs.255.1581930653945;
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930653; cv=none;
        d=google.com; s=arc-20160816;
        b=SA70G2FOZ6Xlp2/SSnQbF23VhwHIy85WmUIORgZyVSe4BkNvyAFrAHCcqtrI422uyb
         ILFcvr6yuGUgyt2rD/kV5z/iavpO4uGc8PupSTp/0NAisq6sZjJmC8qppcTvY4ZslMZT
         g8u8Crs5Zo+eD0mUTDTA+tC8lY9b3M6JG1zhF+EZ6UMadY3C4i1NR3Zj6RAaeJu0SL9g
         R+mB0YGYgrj5r9A9sOUY2Mer4H199oimpEar+C3PUINzQORjyUWJmRyGXXX5chC6XR8T
         B0Mmw6Xo0BjDOE5XBwuUoPNHUyFVOIJAumLC2cR2mfE8y7smunAwPdTspB0HUVwbomkU
         ypNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=PesOzQ9//pdRya5YLuhZo8syyUjYB67k85gGhHm+1NQ=;
        b=om+pVJ3L8vUru3xddGHmWV76sulERXK4qSIklLtnA3sedRU18F2GXkeRCJ+CRuFdci
         j8Wkhv6qixPwBpxmrXKGUROt29HvbwQoqOqsY0FDMQJAQ9sbu1EmFObPhhsKIuT/VAEe
         Pi3FuvG9D3GAxZpfpoS9AqPdHtvrGTdmVAHyHENQ2pMgLBsbGLA58GPgsCjo5CIllfh7
         a95AyCJzmKX1j8WuJxUJrYvLmTj/eZ+Es4V5fYHHh0lMVoLK2OA9HbfJ7hiG8rOn/6Cf
         fkhFhWcCdSxzFrHvv+uwZR3YJQmA1spGM2FHSLXByr9vwtdkRGSb2oQ5aLkp36FktLc8
         OFcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d191si538301wmd.2.2020.02.17.01.10.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01H9ArZO019319
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3e020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:53 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 5/6] core: Rename test_and_set_bit to mark it atomic
Date: Mon, 17 Feb 2020 10:10:50 +0100
Message-Id: <84844ce64639ff86ca42d8ea2a2b7d437f6ef9be.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Prepend "atomic" so that it becomes clear that this and only this bitop
works atomically.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/bitops.h   | 2 +-
 hypervisor/arch/arm64/include/asm/bitops.h | 2 +-
 hypervisor/arch/x86/include/asm/bitops.h   | 2 +-
 hypervisor/printk.c                        | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index 8b9c9d1f..a0c4e9dd 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -17,7 +17,7 @@ test_bit(unsigned int nr, const volatile unsigned long *addr)
 		(addr[nr / BITS_PER_LONG])) != 0;
 }
 
-static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	unsigned long ret, val, test;
 
diff --git a/hypervisor/arch/arm64/include/asm/bitops.h b/hypervisor/arch/arm64/include/asm/bitops.h
index 004c3b44..3de2a24d 100644
--- a/hypervisor/arch/arm64/include/asm/bitops.h
+++ b/hypervisor/arch/arm64/include/asm/bitops.h
@@ -18,7 +18,7 @@ test_bit(unsigned int nr, const volatile unsigned long *addr)
 		(addr[nr / BITS_PER_LONG])) != 0;
 }
 
-static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	u32 ret;
 	u64 test, tmp;
diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
index 12d85fdb..6d265bca 100644
--- a/hypervisor/arch/x86/include/asm/bitops.h
+++ b/hypervisor/arch/x86/include/asm/bitops.h
@@ -47,7 +47,7 @@ static inline int variable_test_bit(int nr, volatile const unsigned long *addr)
 	 ? constant_test_bit((nr), (addr))	\
 	 : variable_test_bit((nr), (addr)))
 
-static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	int oldbit;
 
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index 1b6151e0..c9e22b29 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -262,7 +262,8 @@ void panic_printk(const char *fmt, ...)
 	unsigned long cpu_id = phys_processor_id();
 	va_list ap;
 
-	if (test_and_set_bit(0, &panic_in_progress) && panic_cpu != cpu_id)
+	if (atomic_test_and_set_bit(0, &panic_in_progress) &&
+	    panic_cpu != cpu_id)
 		return;
 	panic_cpu = cpu_id;
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84844ce64639ff86ca42d8ea2a2b7d437f6ef9be.1581930651.git.jan.kiszka%40siemens.com.
