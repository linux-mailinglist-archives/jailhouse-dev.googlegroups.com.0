Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBXV3XH3AKGQEY7GCTRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53e.google.com (mail-pg1-x53e.google.com [IPv6:2607:f8b0:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 291201E425A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:32:32 +0200 (CEST)
Received: by mail-pg1-x53e.google.com with SMTP id x3sf19220251pgl.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:32:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582751; cv=pass;
        d=google.com; s=arc-20160816;
        b=FjlKrzsadZoOuOR1B42+PCbdXmmKaLCc7qw8abPHOcGVClE+pkJsPUX+tBN1aqA80N
         KFWp4GoGquWvZ1qsVfsdXd3t/7KT5uwf25id7T0+I3zIAg9j3+XxJKhxXcgN9Cp0kXAX
         lPK5F8yMaom75+GuEFOlxEhUpzjl2zUTPYR9g+/zji7cQh8MtsGYiSg/Togoy7VrI6fb
         Mi9OR6cBzX2N0VxRQV5Wkegf2sBqFFgX4t8zT4LKiyeNHswCcERk/9nb1suapsPCDxWv
         Brn0C03Tc62dRNzzWm8CcoZqhB7BAHUWph7UBbUHhvcY5KKve33vSGcF7yhEWbLcKr7z
         hGIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Kf1yd9m/VHbOh6fvY+Pmp+TEOBVpXcL9vEMhnHtTT4M=;
        b=MjXycpCwNtsEKpfiWTmPEDOYstZpTGj543Uvfdb0av1K9NAS8kuiiwIlKDwFWg4xMl
         zAMFVS338vcQPdK8D1lLZq1XjfC8G+hE0M1iSzlDiRfAexpqMMTtRHahaqT4hbCJjm3x
         ZwAKKQEOXpAUUH4O/SKO1fZN7OarbXjKIBMOj+I3IIyVhbbdFiq22LECTEVjgolhPlx5
         RukQwVrXok1h0y56o0v1jHZiLp2EMIga5YZnQZJ8Nv8MAn/gb/ith52u9/iCou0CglOC
         4QeMu/9WCkDhAoz5q285VAAKWkuVBHilISDvkCGIhpoTHHdYSzhb3hQKv9UQ1Ey+kQ+4
         l81g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="p580/jie";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Kf1yd9m/VHbOh6fvY+Pmp+TEOBVpXcL9vEMhnHtTT4M=;
        b=jWNSYOoao6g/fRfGIV1BaL2SdRwGb2Api4rtAHDCOqGX1xiVQkGhVV3dhtiijTGSzI
         ZzcygRVz/NmbqOZIBlWsbFKwW0sM4iMmhxlHGUkv43N3ohpxVwLgS7FawyczhLmPNECV
         b0o9Pww9GWRSjb9CePqBi3NA8QBAKBWMFfaVyOwn76Jsi0FSXF4+1lPUCVwxHBJb6vGU
         YEvkFbjx7yy4lsXJl/gaUzVeIuwP+6UO5fseFF35M6axiSHUoiouaaeqiYlILUab5cLn
         m4TzBjPgH44Ovr+tc5IIfzN3omclqW4hwgkW3cI8VGfuX/V/oODVkvvDRuGxwT5Mly/r
         fdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kf1yd9m/VHbOh6fvY+Pmp+TEOBVpXcL9vEMhnHtTT4M=;
        b=Tfe3sh2/DSoxAINd8ljE2HTdS5c6VbS5YOoAXi+mXdId1Uj3mPI9LNkP1AXuvOMkyl
         TIVidRBLcLDBHdTdwP5lOPwpthwK80tAInLe9Bql+JO3apUuF+/6kjHD3B1dfJGZnmvI
         Qu1Aw3WBeQ4ZhQNbIKvKQ6WqmHe4dDIwqAFJqkj1vlSIyofPpxwoEYBkjt5Zt9L1Z9KV
         HZo4t4nE9fNpS73hwy/qjnIvWmbm1/vrMkC1p4vyAlK89W4EcG9RicfopRpWCZNaT7wD
         +Bfe1ULlun6UcrQ5+5oXAWuj5wqEb3VIe9n+AYmPpHO6PPOm3kooYltdm0iwJCQyXbJz
         1nrw==
X-Gm-Message-State: AOAM530cVMgEYo9XKKQ5p6rv3qI59Xqs3/puG545Vd4gir/Xn9PAXJ73
	KE+iJnln6D3bL0hrkxUKdjk=
X-Google-Smtp-Source: ABdhPJw6E+fx8RF4jxpcHEAizNBs9dhSblZYbXZKvfj1CGeNXA0M6H42kQcS+LOrcPH1zeFFFSUh9g==
X-Received: by 2002:a17:902:9a95:: with SMTP id w21mr5944764plp.259.1590582750861;
        Wed, 27 May 2020 05:32:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:384c:: with SMTP id nl12ls1455620pjb.2.canary-gmail;
 Wed, 27 May 2020 05:32:30 -0700 (PDT)
X-Received: by 2002:a17:902:301:: with SMTP id 1mr5938164pld.245.1590582750352;
        Wed, 27 May 2020 05:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582750; cv=none;
        d=google.com; s=arc-20160816;
        b=NmYRagmaN+CPSs64xhK/zXP9EAcbPWDr4r0+gBXi1ApPqbdM5ItwBK2Ppv5MYJu1gv
         GJcQtZasJTIQJLJjh+aJy83S5opb0ZHwinao/EV+s++Iz9tcep/MxMExZrpbn+w+d37/
         6eqcwHlA5o7uJBLX5px3RBXBKCQBXlcAmgx5LFyoKQPq9gPwN0xRuFXeYE7v6939Q17b
         IZD7uGvbewLC+IBKpwNabH0YxI+BPGpN3AIJD2NrG43SWUms6xCdFu0gBOZAO1VUGlVQ
         NQ5DPL7vvJ3YgytRbTPlZqzguiFZofYkFyzf/c0Ewa1zNU9Hn/TVi0QHb8rxiuut73TT
         ib+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VtZZqPxT42hvHqwMVAWB6R+/CUnywedcDNV559n6PVQ=;
        b=W/Jqa/3Qen3N/02oXlwOiT5lMPzKMhHAf8NWle6Pgt4c3LxxVueNY+BWSuUvJ3+Wsi
         fJfL2AKebO4TcS/Q96liweWyR/+LgOXhpmvks4nMiR7ZaaXgr+b6FObicoQg5MXWwdo5
         AQ46G5pdgnyM6JskxHWEKgmKDW2hOBTzZuYfGbAFiokZ0CRfTo5bKX6vv9AcfX0jyqpn
         j0OYk39Bu25kXUz7Eo+Jr48ixgeJEZGNfN5/ODqZrNLINw/l/irTx8vvKRHKdYkDiG0f
         +VU5hQ0z0CGMRSMD2wM1nQQhDqB9QYPfQF8F1horSP3dZervCBv20mt1eU0GXRHLJoay
         JrJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="p580/jie";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id lt18si77514pjb.0.2020.05.27.05.32.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWT53007781;
	Wed, 27 May 2020 07:32:29 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCWTQC123371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:32:29 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:32:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:32:29 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWPj6096152;
	Wed, 27 May 2020 07:32:28 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 1/4] configs: k3-j721e-evm: Describe separate IVSHMEM regions for demo
Date: Wed, 27 May 2020 18:02:22 +0530
Message-ID: <20200527123225.31726-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527123225.31726-1-nikhil.nd@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="p580/jie";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Current IVSHMEM regions are described to be used for ivshmem-net
driver. For standalone ivshmem communication, these regions need to
be added explicitly instead of using the macro.

Add regions for a 2 peer IVSHMEM communication
 (0 = root cell, 1 = baremetal / linux-demo)

Also change the protocol to UNDEFINED so that the ivshmem-net driver
does not get engaged. Switch bdf = 0 for consistency across all
platforms.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 33 ++++++++++++++++++++++---
 configs/arm64/k3-j721e-evm.c            | 33 +++++++++++++++++++++----
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index cda1614a..b6a56e2e 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -56,8 +56,33 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
 			.virt_start = 0x00100000,
@@ -212,12 +237,12 @@ struct {
 	.pci_devices = {
 		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
+			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 	},
 
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index dbf0ca7c..0be0e19f 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -98,8 +98,31 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 0),
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
 			.virt_start = 0x00100000,
@@ -396,14 +419,14 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0003:00:01.0 */ {
+		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
+			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 	},
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527123225.31726-2-nikhil.nd%40ti.com.
