Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5OLZTYAKGQECQBCM6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C77131203
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:05 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id v1sf7420511lja.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313205; cv=pass;
        d=google.com; s=arc-20160816;
        b=O0TCZXE5JoVu3DAN5M/0eoL8STbuOq7HzhOqwdBXNyb0ygB7fiHAHNic1yQUxIQksf
         eixMLkkybj/PuY7C2BBz+TLP12991RQ8qo9Uuwh6kbZnsFsOepYtiRX9THSzW1XkjZFn
         0XMngR0nC6zlH80wYojNySAzpbnACIlSMKEHhi/XEKwivVwI9k6AuEfYAW02FdWeIEWi
         HDnemLjoHTZHD1JI0fGg78j5uiUjS1f+fH/3KWck0GNoeT5rmJ5+mx+ifzkWtKoQS72z
         0Oaj+BmRyYO5RC3a96hHVrNCwD9JJP59Jc27FYPbxFy3xLzZWGgjBVg0qbVyeKn9E6+4
         90GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=gE7vfeXLtvjb1FDeIC2LP/1WpPSCPjY8/QvExN70eMg=;
        b=DPVgpKclgwa2HJwQ9qwe537guwhq4ChQ94iVKEfCl8iOStikuUvITF+wYVQWozhiV+
         z3GiUhR2zEL6dz9/avdkLTtH1JoOGxPZIfyNzxY3istqaResOdTYvweYrOSJ3/EmJQc+
         fGBq+9yKdujCvQ3XCdPYXW6Fvg8Yd7ciFlnlRE1X878DzZ93ZvadKpMikGxcxHJJ4+2p
         Dz1bO+pstlxKrjmIlDQxDQbCszOGHIJr2e11lvjyqWVclcukJZKETAXpw92Fc/lSp6bE
         Af/b8fs5gKYZmaQtdFNPVCONiL5wczxkKZLfvUAm6dr4cwa7AycXk+uKdAlR1K/SxVRH
         RAiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gE7vfeXLtvjb1FDeIC2LP/1WpPSCPjY8/QvExN70eMg=;
        b=SCg/yEUa2iRkf4N8lgL8buo4/PRQkXej8BJs5Iucmt9utflX5tPzyJwOho1QJBUnLL
         JRtpsCESEY6mocQVVSuMxWISbnj6r9rYez/ZzadKL7s+bDftDONzJzbegYTJXDtn7Lx8
         /MT9190eRjZTf2KXbASq4fnC1HXMSH01wBtqdoNATAS9kB0hFf85S8/mZrbCVPoLNTSh
         HPj5/gTlndD/VC1Kn787hSfeiQ6f/uq95zEhtu7z+/9SEY3IMgOTNIXZ5rmTt/HoXwap
         krqYhTqsBqk/DTak/KzxfaE36YEk+jaFN57vmfhQKkzeuO3c1ViB9TLG3TSdRCLYW/yk
         ao6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gE7vfeXLtvjb1FDeIC2LP/1WpPSCPjY8/QvExN70eMg=;
        b=C3n0N3zRd+5h32A1nVeqv0gweZu0z6ZfVLSw2R6JK4UoSh5Sa5TpOkNfRFBcyui/q/
         LDCEkjnIhTDUlNK7lbBgWDVL4Y0XeuIvcItie/urpLVU22/wN2ibtr2B5Plb60iN450g
         R3s1NrTEaQMioHLHHwwHNryX+yEbT+yA5kYW8L2AO6jlKrhVpeBPJmwYrGlaj163A0vU
         ev1WWJkIeTytKOqOMzo/IEAaLkBBc6KwCJqT+z0GFAtxTycweanbwr7d85wt6LAznv/v
         JmacatUP4cESd+hkYwCiBgWQ40YNsV4aM6QHXHdGKqwHfg2aSd92GZUkeCz+CnY2PnzV
         bxLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9hM6cxJTF+Kd7yPabTYU7dSczlwngUsRJlfrtO1a95HFu/a3c
	Pcl4Ke7mSMXYTO9719i22KE=
X-Google-Smtp-Source: APXvYqx6/6qMqs/5p0vcyosAekPJQdOrI+AuIR4tv6gLzgtJZqN54rxXWbD4tWV0TV4eWxC1/AaKXA==
X-Received: by 2002:a2e:918c:: with SMTP id f12mr59987094ljg.66.1578313205364;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c85:: with SMTP id x5ls5199099lji.0.gmail; Mon, 06 Jan
 2020 04:20:04 -0800 (PST)
X-Received: by 2002:a2e:9d11:: with SMTP id t17mr60103574lji.169.1578313204359;
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313204; cv=none;
        d=google.com; s=arc-20160816;
        b=Ebuv8iF2LMlOK7Rrq7Rzcd3nMmnVaoPDfEV2dZAu3LohMnwgpzmB/DRvHFfPjBG/St
         pinNznY+6xtf7XaWxupOtZ7MdQxU1JoVb6g+pgmg0jvtvs9P9p9czAjq+VQ2vSvaZq6g
         rpxQN5XDo48oyNpq/EtXXauLGL13Ike16jCXUWhRlHWD0AztV56CmRFSzYYrtTJ8lN6i
         O9GDAx+D5cWoMvn2VZsfKZUMv73CSPmmryfZmK8Nw+WcReOSeNB2ZLm/bhSTIYDDS1HQ
         Kns5Esu5W+w5r7KUGyPV01aRPMHknC4k1n6u1aSYj26XS9kSKyGWR9d4XSE+hf4yGE18
         mDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=9j+UQwtW2V5flIWkODLTBEO2XFFa2nb4M4G//We1WH8=;
        b=Cd7kHoA4qw3iuQ/mbsknywMAHfA+wJYf0xuMn1t02z/5M6SAdgJ2mlDgfHKV2KNrYE
         f57IT+XtUP0waYXsqGhKVM2BVixmm/BAXeA3jWt45m8bU0rPVQ6oUFfTnCSBJQi0iI0H
         /dsgg30EGZXfGHthoMUmTtV1sfnPgXTFGs9yMJMoRHSLVULbw2cT7Y5xC2Wh/Go602Kv
         tY2Do+VvnG8uHOY+D3B0Q23sYfmgrxhTCArTPO9c3CXNCnfkcUg9YlY0y4Q78/xUWesj
         zK82SVci6QziqfwoQZmI7hac55iZtd7mUHhBHVnfva88qPt1c4nQVhbmWc7bZ53/3FKM
         OJxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x5si2626655ljh.5.2020.01.06.04.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK34d025190
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF4029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 30/38] configs: Expand number of ivshmem vectors
Date: Mon,  6 Jan 2020 13:18:11 +0100
Message-Id: <9784d4794857e1ba60c14c739d7382e3b954dbe3.1578313099.git.jan.kiszka@siemens.com>
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

The network devices have a use case for up to 2 (config, rx/tx). And the
user-defined ones should get the maximum supported, i.e. 16.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/amd-seattle-linux-demo.c | 2 +-
 configs/arm64/amd-seattle.c            | 2 +-
 configs/x86/ivshmem-demo.c             | 3 ++-
 configs/x86/linux-x86-demo.c           | 2 +-
 configs/x86/qemu-x86.c                 | 4 ++--
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 7acae6e1..3da6a2e7 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -137,7 +137,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x0078,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
-			.num_msix_vectors = 1,
+			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 5d810a64..44dedeb1 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -215,7 +215,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x0078,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
-			.num_msix_vectors = 1,
+			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 0e0644b9..e7440f01 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -90,9 +90,10 @@ struct {
 			.domain = 0x0000,
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
-			.num_msix_vectors = 1,
+			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 	},
 };
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 468f01f7..b9cc7c68 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -140,7 +140,7 @@ struct {
 			.domain = 0x0,
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
-			.num_msix_vectors = 1,
+			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 1c6f0d84..ea642292 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -282,7 +282,7 @@ struct {
 			.domain = 0x0000,
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
-			.num_msix_vectors = 1,
+			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
@@ -292,7 +292,7 @@ struct {
 			.domain = 0x0000,
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
-			.num_msix_vectors = 1,
+			.num_msix_vectors = 2,
 			.shmem_regions_start = 2,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9784d4794857e1ba60c14c739d7382e3b954dbe3.1578313099.git.jan.kiszka%40siemens.com.
