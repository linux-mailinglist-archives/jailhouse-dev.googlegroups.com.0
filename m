Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOWLT7ZAKGQETJ2ARAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E515FE6D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id k6sf9627779edq.8
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=im6hJ1BgXSBT++OQVIWby/dUEcLILeZ0BuH0ueVjydMVVs30UcxZC0Dt0ybxkpPsHJ
         EKKvpAjqzfWu5hUX2sR5K36Li4kcYy9WBFlzQ8BUE1x5x+PyxvtH+J+HXnJBFvHFdFyy
         7DupyoUfc/HOhCRsXwOe9IfanpLKyccVM+tOfU8oRsCKhqpw9Z9Njunl25BfzK380m4N
         jR5abH/E3gxhRqw/9YRRINd0YD0qiovosgqo80jqkwVawk4/hgkDyqzyfVBrOEjFuYH/
         iUYVDfg+DtE5bwIU7pS0S1XCN+RcmD/c38m1DuCkThFcDKrID/0VQMjVkx6/TtppM5fM
         nsdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=7qZdQW6KszEKAIS1B+dICY0aspgbUNHU5y9kfF4fJJE=;
        b=FPwhDCTO4OhqDroMqGP/1qtEgdpSojrDiYMqa8esjg6ROaueffxYapRAlX3cYBGp8O
         eZJ5Y4DmhrNiEL8p1VeRP3L6WZZ1ZhkFpuBHYpWfbsh4tQQsy0kHrvcw0Al7eR6mdVDg
         P/yjYwZSvp5D6hOQmZx1s8z+YGDNmc7Ns3JCky2P5xi3l0njwU+/oDaAVXZ/v+OJIRQn
         y4Ua9bs9WBeWizi51vV+QA0Brp5fhE3scuZOnPwTVIP+y9nVkrE+36MSUE23yWLBj/bv
         HacqvzLSCYV57P3nWnseFP04r1oDR4EFcl3m8YUTWhkLwG0N1bB6j9fXNJdfmWY9sKgR
         R8JQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=THlC92qH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7qZdQW6KszEKAIS1B+dICY0aspgbUNHU5y9kfF4fJJE=;
        b=j+ztaur2P/y1aarYscS1hvVNWjsJNNB1WJx0uqwyI+jOj1bkc/zurYBhbE69QLxNak
         XqlCG1pX6+g1/iOC+Jm0hwbvdis/5nwf2trESV8mCL3pvS4DNpN5Q9Vkl1CPRVqIJe3c
         ai1FObgPW1OGKNQq0fimUwSKYupi5TeIAiEWtV3yC0Mfhp/D+foqUJl77lpk06cowJFi
         ORnIfE+5vJfGwefq67zXpx7sdP04CF00EhUBCAkq2IsTWmV+7RkCLgcKiySbx8qMDXxQ
         w92Q+6VHDmvdnX8t+GWD1AUlJhfAPk6/IIto33eiR2fn4bSSnDZIeTjCUQqV6Zma+MN2
         AQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7qZdQW6KszEKAIS1B+dICY0aspgbUNHU5y9kfF4fJJE=;
        b=AbA/bW1+H+kgcSIsAeVKTWQY09uDreDqiBwxdx0a59YHL6+U8k0DNRemZWylhjLFer
         hpqxS8lYaay14PlJgEZCfOVE/QhQCnXWAz8oNIricpOMlQ81P3npj//6rED0kHMj9jvj
         GKjSvEOGjka2oGtMUrrA6oQHKgBMGlgQj27+tIDag36T+zCIX9pJdJbcyM4MvqPfdZP5
         4N4ixzVj19xK+P12SbvuAcEeR3mpTa9o1eg/04uvNgikYAikUnRfjcReD0SSgRumX5Ue
         kfoWHo0TD6b6IytOOOwxAh6sdY8v7tNV7Ysw1JfOj5rnh/aQUOtrsYekE3BBF4lHZfZ2
         ZJqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJNkBv8JpIUanHp8j7G2WabDDsxGpueBP6MKhNOAi2QlmgqhWW
	3xmnqhIPqmL+lmrp5h1bO6g=
X-Google-Smtp-Source: APXvYqzYYUhLlfvzagdRKwwSIQOcrDAWinF3m6UyBw1yAG6g4vQe3DW8/kS1f+wrxXFzJfD5s4bJOA==
X-Received: by 2002:aa7:c2d3:: with SMTP id m19mr7047334edp.136.1581770170829;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f99:: with SMTP id f25ls1783447ejr.5.gmail; Sat, 15
 Feb 2020 04:36:10 -0800 (PST)
X-Received: by 2002:a17:906:ce57:: with SMTP id se23mr7370569ejb.362.1581770170230;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770170; cv=none;
        d=google.com; s=arc-20160816;
        b=tdbDvKQwQfP++SqodL/BjsV3ZH8tbHfpAtWYWWBkz+hq2TN6iQiDWsCjMzkd5onpqZ
         UviLgDFRr7gCXtcyGqq5bUyVdn1vszLfvGK0NXIHHLHUHztct6MJ+ZipSI5JVNT6sEm9
         pTCPvrzNjrd3KEgWKFccMkFWwH2U77C69nNrtftqmLzqV6sqrmBD2u++fc5OOXbtV5Mw
         IMKu3OrK2zqCClcK7CWafrly0/RTglfwdy9F/tXiTignIUkDQLBKCfmsEbvCd2Dtf58y
         55+sz0v0B+bl9RvQ3aLXxgvDErzK9jywB6sU2TSJVaaIDFAzVEb7NiGEAJXQu2Q9oGg3
         9ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=Zwd0BijwJ6S4UyyLVLdoMNUrwMIT4gcS4yqn65QYXiI=;
        b=ciEIG21tYtlNzztEX+Zf/iZrgKv3NMSItq0enraugnMutpPQV+g20RBAEV5LXsWGk4
         LQdF29el48yRJwsgyg0SU05l4ZI8LhVRhhC7YhcTV0Jb4FAVDDNfIdXCWSf1pRLiw5I+
         4EDs2uZ75yJMAuvh02oWgoGR8cuq70lCwkrQb+bQYf6DSjP+qafPsA9X3K903FWhiQrF
         wc4KG5kXyXYdOWmZSeZlPZyoK94YnnSdwPz9IDmmBTbl2j4rUQ0NNrV/YF4Kc6ain8Zz
         GFuxUWvbJUv5wFFepONpdC4j4sR3oLFlem2XISmTHsQ2aJ7XXLXrLF6S47/ukbSGZDir
         qKWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=THlC92qH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id d29si318699edj.0.2020.02.15.04.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MNL6f-1j9IKO2qoz-006xwH for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:09 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/12] core: Share identical PAGE defines via jailhouse/paging.h
Date: Sat, 15 Feb 2020 13:35:55 +0100
Message-Id: <b5d8439116e8615e5b0498391f3ecb27407a1505.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:3F5nfOpMkBtmmM1yAJ/y63sZFlK7uGARSjaWTYOthLzuM1Cp1y5
 bLyOG6qTYiSmlDoO08h46lrXu86VeuyxDzNVEg/28cPHwnF0ss/8BUTJbxZhkNY1XlG+xho
 D6GrBECcfJh1EMNvEnv0oRLQsVvuKVbQjMAMm5VcWJzVxuK1NiwuavPaQM73JZ9HAHFmOVb
 QsLIqQMqlcCcU01CP8Yfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WhUrTH86g8U=:PAvzZUJJrCIFhT5+j7ZJC+
 Y2nznHjuhB6u+0/10fdi4EjiN3hOXpfp7n41SrohkWo0QhocHbmoIUFo1Rn1w8LhR08kuvVps
 dHiIODC+fneFdO3MK+HlcwHdE00O/wnJRGZ82FbqOYv//0RXrYEbmY5/F46NjnxkJONGycMzD
 us7KBGnex7KDeR4XR/dOhkxBXyhCaW8B0KMU2wVLbS9QoGza6L26kvBeSXQRfvgj7CsNfJSN9
 D2/ch1ufBW97xCJd50Q2W1KyyFBSBB2FW3LYFBLpY9tQ6tcLZcLiP0qUnciscoWlPHn0l3u9p
 aUlLN1gNF3vw2NgPjAiVizbZLX+d5bVlVzaeYPVii+NbQIB6dLNCD4ssU88NhlYoOufD1+GS0
 iOjDYJGvhjEssQfRbS8Il3azoXQp3bQTEAeMrwbzpyXEq+8lCfydF43Zbk5oFWLFArlfU+WqQ
 VdS/KxvfewQu1ranyk2ZNnd1reDbpIyzBcRzm/1VVEzDAPiJ1NLEhKzVnfzVxlle4TEuizICC
 xNBhIXbB4xDW0JXw0+Qg42wNUvL4tU3bPWwJYO1WeJ1d2++bkmiaiQSHsLNeBu7Y9fCP1+RM+
 cLS3U6xaNCm59M40w+Q1wtoWDB+IUypKYIdP1cJhX5/wdNi2J2WLFHJRhcMTlZZwgPvczM1lb
 5bOJGzEn//XlZTiHTiZu1c+epQDH2c8ySiV+d+//OR2UD2MHAjj2tw9Dd3xbxHlAuqM0G6kK0
 DHRcejwLN0mu1xaLqvbMFI6Z0XKIgv7NNNUYUDBgI5FBOGXtmwrhhmvp/dppKBqZwpwTvt90n
 ijXdVI/Nbqkno9fx4IPgoH15bln1nKill2c180JaTat+GT173kT+Faaly6sH4eQn2htVtO/dH
 ytA3JpUCbA+G9qy7nycLG25xiT7qzq8XcPhL2NYZLCTYub47nZNtXwX+1OjzCo3X7UQgo11hR
 w5jyK0hBCK5SPgD5n1u+Y4z0CUolH5C14AR31KcgC45LN46v9zqhcPB49Q2oBnct9bOMRlGxb
 z/+wPqXD0gCAocEafApDvySDe+i9Ejm7IpgyjQlLwDPYVRDTHpSt1y7ci8U5FZVg4WUU66bHf
 kubsY7vFEDixr7jKSTAposxeK2V4aKgb7275WvE0ebLZPo1GsphcrVC5UVqBDHnxz98gvAhea
 UYgyHCErSMHUlvuIq7VU3ttJNrwGj1r4tNCSyEj2kIaCanbDiNFrcot5XnkP9ZSMYQ0FmuLn7
 nWfABPlL3kN1SVpGs
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=THlC92qH;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

PAGE_SIZE, PAGE_MASK and PAGE_OFFS_MASK can all be derived from
arch-specific PAGE_SHIFT. So move those three into the generic
header. We just need to replace a few asm/paging.h includes with the
generic one, and we need move the asm include down in jailhouse/paging.h
because ARM needs PAGE_MASK in a static inline function.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/paging.h   |  3 ---
 hypervisor/arch/arm64/entry.S              |  2 +-
 hypervisor/arch/arm64/include/asm/paging.h |  3 ---
 hypervisor/arch/x86/include/asm/paging.h   |  3 ---
 hypervisor/arch/x86/include/asm/vmx.h      |  2 +-
 hypervisor/hypervisor.lds.S                |  2 +-
 hypervisor/include/jailhouse/paging.h      | 17 +++++++++++++++--
 7 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/paging.h b/hypervisor/arch/arm/include/asm/paging.h
index 8e82d7c2..08bed5cf 100644
--- a/hypervisor/arch/arm/include/asm/paging.h
+++ b/hypervisor/arch/arm/include/asm/paging.h
@@ -20,9 +20,6 @@
 #include <asm/sysregs.h>

 #define PAGE_SHIFT		12
-#define PAGE_SIZE		(1 << PAGE_SHIFT)
-#define PAGE_MASK		~(PAGE_SIZE - 1)
-#define PAGE_OFFS_MASK		(PAGE_SIZE - 1)

 #define MAX_PAGE_TABLE_LEVELS	3

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 167e29d2..27e148c6 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -13,8 +13,8 @@
  * the COPYING file in the top-level directory.
  */

+#include <jailhouse/paging.h>
 #include <asm/asm-defines.h>
-#include <asm/paging.h>
 #include <asm/smccc.h>
 #include <asm/jailhouse_hypercall.h>
 #include <jailhouse/header.h>
diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 9398ecb2..5713379c 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -31,9 +31,6 @@
  */

 #define PAGE_SHIFT		12
-#define PAGE_SIZE		(1 << PAGE_SHIFT)
-#define PAGE_MASK		~(PAGE_SIZE - 1)
-#define PAGE_OFFS_MASK		(PAGE_SIZE - 1)

 #define MAX_PAGE_TABLE_LEVELS	4

diff --git a/hypervisor/arch/x86/include/asm/paging.h b/hypervisor/arch/x86/include/asm/paging.h
index ef614b02..065bac9b 100644
--- a/hypervisor/arch/x86/include/asm/paging.h
+++ b/hypervisor/arch/x86/include/asm/paging.h
@@ -18,9 +18,6 @@
 #include <asm/processor.h>

 #define PAGE_SHIFT		12
-#define PAGE_SIZE		(1 << PAGE_SHIFT)
-#define PAGE_MASK		~(PAGE_SIZE - 1)
-#define PAGE_OFFS_MASK		(PAGE_SIZE - 1)

 #define MAX_PAGE_TABLE_LEVELS	4

diff --git a/hypervisor/arch/x86/include/asm/vmx.h b/hypervisor/arch/x86/include/asm/vmx.h
index 53490e10..c03ffc55 100644
--- a/hypervisor/arch/x86/include/asm/vmx.h
+++ b/hypervisor/arch/x86/include/asm/vmx.h
@@ -31,7 +31,7 @@
 #ifndef _JAILHOUSE_ASM_VMX_H
 #define _JAILHOUSE_ASM_VMX_H

-#include <asm/paging.h>
+#include <jailhouse/paging.h>

 struct per_cpu;

diff --git a/hypervisor/hypervisor.lds.S b/hypervisor/hypervisor.lds.S
index 62c39114..ca06ab20 100644
--- a/hypervisor/hypervisor.lds.S
+++ b/hypervisor/hypervisor.lds.S
@@ -12,7 +12,7 @@

 #include <jailhouse/header.h>

-#include <asm/paging.h>
+#include <jailhouse/paging.h>
 #include <asm/sections.h>

 SECTIONS
diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index bdaf8b58..5513c4ec 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -13,8 +13,6 @@
 #ifndef _JAILHOUSE_PAGING_H
 #define _JAILHOUSE_PAGING_H

-#include <asm/paging.h>
-
 /**
  * @defgroup Paging Page Management Subsystem
  *
@@ -26,6 +24,13 @@
  * @{
  */

+/** Size of smallest page. */
+#define PAGE_SIZE		(1 << PAGE_SHIFT)
+/** Mask of bits selecting a page. */
+#define PAGE_MASK		~(PAGE_SIZE - 1)
+/** Mask of bits selecting an offset in a page. */
+#define PAGE_OFFS_MASK		(PAGE_SIZE - 1)
+
 /** Align address to page boundary (round up). */
 #define PAGE_ALIGN(s)		(((s) + PAGE_SIZE-1) & PAGE_MASK)
 /** Count number of pages for given size (round up). */
@@ -34,12 +39,20 @@
 /** Location of per-CPU data structure in hypervisor address space. */
 #define LOCAL_CPU_BASE		(TEMPORARY_MAPPING_BASE + \
 				 NUM_TEMPORARY_PAGES * PAGE_SIZE)
+/** @} */
+
+#include <asm/paging.h>

 #ifndef __ASSEMBLY__

 #include <jailhouse/entry.h>
 #include <jailhouse/types.h>

+/**
+ * @ingroup Paging
+ * @{
+ */
+
 /** Page pool state. */
 struct page_pool {
 	/** Base address of the pool. */
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b5d8439116e8615e5b0498391f3ecb27407a1505.1581770164.git.jan.kiszka%40web.de.
