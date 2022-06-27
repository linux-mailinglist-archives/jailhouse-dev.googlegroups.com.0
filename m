Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id C025855B9FA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id q6-20020adfea06000000b0021bad47edaesf1201096wrm.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=KQ8N/wGe1GWyjvQrSqeoZx5WhbbBLEFCpSpXZekOA2dHFBZ67jF3tSwjytIZD+4Bk3
         2cAhsKfq1Pf3LeyYdEC2tsrniNPnTKfXstoVmXFrZbQvSDhNVOk8z9QOBpEdG7jdC56Y
         D699V3tPBJ2K7jMQXCLtLFvYyX7BrLhcLj8is+9QZScuVhr6d/2IQ6jV199KLkstXwNC
         GRnKys8dlci/Xnm9QcVVTwXWBhh1lUjr8aPlU3yBc5MO3yZMJ4Hgi2drNsuQRKxyIUQe
         +C9K83wIiN3b1Uz2DMjZPXBwJv+ydVqSlxMyBEeAJcCX3DZGxX/ZJe+m5LB8tH/Ttbyp
         zhBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=XIwtyczSKLhk8fW5jwZKkirPIMKir8NEEuOowfPCQME=;
        b=JT8wdiiBaKBsN5QW0C4uSaM4LOEk+G12XOXSjg0mKdynvesVbkYCYDLLw/6o3/9IJl
         H2Fmdb2IsVVcldhvnZuJY/Kb/SHYxvKt9DMy3YjXn0PObPSroYGQpItJsi4kRAKXZqFr
         H9gKdiqwbOyF0mHZTXD/j/fhenbexjKi6iiJj94jUCkr/BoTJ7cUCgIuLHr7mY7PgOJv
         OiXkQN3jCdrqjpvyEwfuZWGu92U+GzIJIBTD2Q7kN635/1VPnndVYxU4AXlAn6bUv8el
         uPeTWmMUB+FbXrWnybwVWa640GFyZmbu0qG0iU16BhGKCHWv801xNKAwjglbEdpqxDh9
         W8eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Q7B1mPq0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XIwtyczSKLhk8fW5jwZKkirPIMKir8NEEuOowfPCQME=;
        b=JBMqVGswphgzi+t8HYWYAiV19S4ZE8bzDzATXorkg6aCRuM8DIT1pazcZ/Y51hDn1I
         yt0HluE624wIaChhVcOHb1ZsJvk69q8SnptpctzfOWhTTgKjybiM1BiiItvfs6HFKCAm
         BKmw+I3ChxyEXA3KpdFi7iMNpyE4v2wZOEuhblu7ZiKsJdaKOMLhJm01ZbO0iirei8FS
         sI0KdmIr5M1IwEsAHYiWEjEhL3VIEYrXpI4CQZQexdNNn9pJQuT22eOkTHyxKUBg4Iph
         UfYAdg3BGFPUKZuoD+O8sRAfbnE4+62horDrPpE64DUs/KKTIpA6Sk8HtxRE9D722Lk7
         qPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XIwtyczSKLhk8fW5jwZKkirPIMKir8NEEuOowfPCQME=;
        b=lNwUtF+Pr6zh/Qpy9bGEDNhPTTJp5YvinSLANbPIXqKhWYw3cvCb54HVKnxEaz30Qg
         fYsf92VnFqoXU5CUzyh5zTMBijBLHlWpf0ENxKSR36/+N9mMvVLCuuUp1Kj1YPB7aGJL
         lpsT0DZYrUFED37cWyu4roAsu9McLaPmNBiVPp5ZeE3HdnwO2MzDm3IsCKwFghyOBbPc
         KNK36Q1tX40jnlIrpIOIZGZ5RPkc1HONX/bbluU+WNkXqk3b76y+MmKlCJssYxsAJyB6
         wOwTa9mI3icBLyXHw5+Uf+YSDfAotokj79goZCKpqTWIPcn85KIkSp73Y9EQgDbQh/MY
         WvtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8VXCKYU1XcybEgnK3puCSz2L8F0GYohDuYdD51ibmC+9BEPf0M
	XCeBnj3HBjyy89q8CXGOvKQ=
X-Google-Smtp-Source: AGRyM1uxPnSLlYg+OInLbYERgQTRjMooxFOF9SMtmTfVL2hHHJrynkfi8/Zs0kdvuZIw+gmxHt8nBw==
X-Received: by 2002:adf:fb46:0:b0:210:2316:dd02 with SMTP id c6-20020adffb46000000b002102316dd02mr12819049wrs.557.1656336562553;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6dab:0:b0:212:d9db:a98 with SMTP id u11-20020a5d6dab000000b00212d9db0a98ls26785215wrs.3.gmail;
 Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-Received: by 2002:a5d:448e:0:b0:21b:887f:23f with SMTP id j14-20020a5d448e000000b0021b887f023fmr12715407wrq.240.1656336561126;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336561; cv=none;
        d=google.com; s=arc-20160816;
        b=CiP2Wjtytc+whSY3fTg0oC2c0A0DoTYGQlKmlz6zjGX/MdbTyXbhi3RFaa5xT5fcn/
         /D+5C2BJUzwwyrX7M1B6Y8ztFIXUMoY+qfcgh/ubBnDLVb7R3BIzhg7fl8HnslX+LX9J
         LdmclbpY52+MJ1xYwNGI+tPpmm53VSL9hasUb3dGXnODfpxe9B/rfLSoOBrchs23x5sp
         IvOSyM+ZZ5XW5xk316rlPaBUKqrPJY6zIcdUYJNqzQM/lIH9wlat0ou39KyyiQdfXDyA
         /sqrHGQ4xMJdO7Uz/jJfNIoOWZVon66JTFgto5Fm1VAV1GFx5fItMycVjAXXLP6IyOBR
         3jdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sMkKTProawg5qWOhL4G4H+WyBbt+UkHMtxGu76bZbUk=;
        b=kjrL7Vzyt9mbE8Ls2Q4kNRqN0Z1kbBKRYet076pr4E5pu7+NSF7LTzBcngOqowdkkV
         Uw2rMK/ocKJ7CW4s/2wxyL2DouMnK4aGnQIfHoQz7lp972edHaEgELDuqgjweCCrBWTF
         ecLxCIRamQN9vAQZbtd8E+GsvvKA1vNf17eUYXe7Pzi9CDZe7EH1kKEyvqgtmAFMkIAl
         sFyNU3O7gttkHfuUOMYb53mytK7zb4aVBD2vQkuKmUNzwW8BLMdqXkVGivHvU8ptJpZi
         6pJ5j7zGTVwaBD9wiRbilOvGsBMXz8ogvtlduStfw3hyI0KpWxX5UVWynw7BwqXoKfW8
         AFcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Q7B1mPq0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id k24-20020a7bc318000000b0039c4d96e9efsi878648wmj.1.2022.06.27.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV86C3Pzy6H;
	Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:20 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 23/42] Documentation: Add some documentation
Date: Mon, 27 Jun 2022 15:28:46 +0200
Message-ID: <20220627132905.4338-24-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Q7B1mPq0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Specifically on RISC-V, and fix some typos.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 Documentation/hypervisor-interfaces.txt | 16 ++++++++++++++--
 Documentation/memory-layout.txt         | 20 ++++++++++++--------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/Documentation/hypervisor-interfaces.txt b/Documentation/hypervisor-interfaces.txt
index d888dab7..fe493e46 100644
--- a/Documentation/hypervisor-interfaces.txt
+++ b/Documentation/hypervisor-interfaces.txt
@@ -13,8 +13,8 @@ Detection
 ---------
 
 This interface is useful for cell code that should work not only inside a
-Jailhouse cell. The ABI is architecture specific. So far, it is only available
-for x86.
+Jailhouse cell. The ABI is architecture specific and not available for
+all processor architectures.
 
 
 x86 ABI
@@ -53,6 +53,18 @@ Result in EAX:  0
           EDX:  0
 
 
+RISC-V ABI
+- - - - - -
+
+Jailhouse adhers to the Supervisor Binary Interface (SBI) defined in
+https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
+That is, it provides the SBI to guests (as well as using the system
+provided SBI).
+
+The sbi_get_impl_id() function returns 'JHOU', 0x4a484f55.
+The get_sbi_impl_version() function returns the version of the Jailhouse SBI.
+
+
 Hypercalls
 ----------
 
diff --git a/Documentation/memory-layout.txt b/Documentation/memory-layout.txt
index 82029f17..7e8281af 100644
--- a/Documentation/memory-layout.txt
+++ b/Documentation/memory-layout.txt
@@ -6,10 +6,10 @@ visible hypervisor memory, globally visible I/O memory remappings and CPU-
 specific remappings of hypervisor memory as well as cell memory pages.
 
 Cells are not mapped as a whole into the hypervisor address space. Only
-explicitely shared pages and pages that are temporarily mapped, e.g. during
-MMIO instruction parsing, are visible by the hypervisor during runtime.
-Furthermore, the visibility is limited to the CPU that create it because they
-are only added to the CPU-specifc mapping.
+explicitly shared pages and pages that are temporarily mapped, e.g. during
+MMIO instruction parsing, are visible to the hypervisor during runtime.
+Furthermore, their visibility is limited to the CPU that creates the mapping
+because they are only added to the CPU-specific mapping.
 
 
 Common memory region
@@ -23,9 +23,9 @@ Prior to enabling the hypervisor and after disabling it, this region is also
 mapped into the address space of Linux that acts as root cell. The virtual
 address of this mapping is identical to the one used by the hypervisor when the
 architecture set JAILHOUSE_BORROW_ROOT_PT (currently x86 and ARM), on other,
-this addressed can differ.
+this address can differ.
 
-The commom memory region contains an array of per-CPU data structures, one for
+The common memory region contains an array of per-CPU data structures, one for
 each configured CPU. Each per-CPU data structure consists of a private part and
 a public part. The public part will remain visible for all CPUs throughout the
 hypervisor operation. The private part, however, is only visible during setup
@@ -112,15 +112,19 @@ Size: PAGE_SIZE * NUM_REMAP_BITMAP_PAGES * PAGE_SIZE * 8
         |                                      |
         +--------------------------------------+ - higher address
 
+The architecture-independent code assumes that the I/O mememory remapping
+region is described by the same top-level PTE as the common memory region
+(JAILHOUSE_BASE).
+
 
 CPU-specific remapping region
 -----------------------------
 
-This region is differently mapped for each CPU. It consistes of a virtual
+This region is mapped differently for each CPU. It consists of a virtual
 address range that is used for temporarily mapping individual pages of the cell
 that runs on the same CPU.
 
-Futhermore, the private per-CPU data which is hidden from the common memory
+Furthermore, the private per-CPU data which is hidden from the common memory
 region is made available at fixed virtual address here. This allows to
 dereference CPU local data quickly and generically. Moreover, it hides cell-
 private data that the hypervisor may collect on VM exit, e.g. register content,
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-24-ralf.ramsauer%40oth-regensburg.de.
