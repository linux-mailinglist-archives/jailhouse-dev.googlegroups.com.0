Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM57WT5AKGQEDO22POQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 91241257E29
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 18:05:08 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id g6sf2982951wrv.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 09:05:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598889908; cv=pass;
        d=google.com; s=arc-20160816;
        b=noRCyvCZUK92LcoafMdzb6/mRaD+0VznWOj1BTISHHU6n+IyNaiVl0uEcbHyOxCrJd
         UV5XuVnmq1sK6X+v/BExs0C70U0gBGS2hPfRLFIyje+bc7TjGQqYdfQ31aKZDJ71xOnO
         ci7IiDsDMCzmEZ1aRChaZlyG+JZVlu+Ai85Z5ywSn0yc2XoqUm0w1sLBSmetsWeC0ixa
         Im+J4QwjTvPKqcScOWA9Pv+WrC9dP//RlM9W1xfAVa/s/ZRGomwesoBzbknG3deZqx0r
         SpvRiu7PC6SFTMjylN/Fcf1rh049pwnccZwjCwzY5hvN6mLqu8pFIbEJKtVA3uaRtLJX
         15sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=N5Nlav/ntyJnpssUsz/41eRHUCuX7OtQskFJsE1P5Lk=;
        b=PSnwgrTHW7BKslCTDRBuvb58/7GVDswaYEDCia+V5kHI81uXjvnFoje3w1VSYEPRsY
         WfM1TtLu+OX1aYYpQXzeIE0AzwVyY7r0Qp7TQCHot85+H3FAMkaX5WO1EA7GRYbEpDNz
         VFtUYtTpmyltgnR3CspSEGDSR7e3qikBvj45FbSPICbiTiTRDPm3GEZZC/F7SVJSw6E5
         n8XNo9q5RZWEQ7JhT+32Y/tFb4tPmACQILl92DjD6tv0iYiIk2hRsBOCgPYWufRvnEa4
         lI2bM9gK1yrA55r0MV7edDPmYjEOM8QkAz5yvwBcy9RyhihV4xfelqOZw/papuVlJjYS
         OWhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N5Nlav/ntyJnpssUsz/41eRHUCuX7OtQskFJsE1P5Lk=;
        b=WOTGg70ffwSOXKvBB1dsNpTm0zluT2TK25WNC8vDDXp9YCxyghdEueXJg6sSNi6+Na
         K2LAVOyypXwANw4ZuQxcYAvY2Jmrt8aPB9gBzgoAAPP49SbiPrdexRhXAtQoUC7fs+hG
         beI0NLkmVQNka9+8nzJ4zi6QH/XI29epxHSLOhhmDsDpUh5rH77ocGYoYuXGOfHwa/Tf
         bCaPRbnQRqUlqADkLtKnukU7iHZXCL3CNh8yQF6UIqgBLXv/WpNBOJlxaJI9HdriqHCo
         S8OR2E3XCL6z4V7xl4DvS6GB3vrSuXH40jnWWf2Rv/l0Cc1zMctOcvHNUW3MkytrzEvm
         umOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=N5Nlav/ntyJnpssUsz/41eRHUCuX7OtQskFJsE1P5Lk=;
        b=oJT2+6//+/4I1bMI402JI4iRLc8oA+5BtKwLlRJPH7N98wWKXWuxNwSwe5lOf9rHLe
         ppTDEnQfJCvczmqAhNKkx0h1MZiZ7Nr0UGCR9eNMRMlcamYsTq3jq6ePC1u+ANTaYRS+
         1Mql1BYjEbJk2llKy6OkueIhPoPxhFcOHkzK1b3gvuOzI2LaLaXuNAuyBHew0Bg4llSA
         Ajv1Y1B5DCAfOQiyrbxDe0F9YtkHj4A8Rm2Xzw0pNl/MjKnwfKVmnDDIqpPRO1d2jkM8
         hUnjFoZo2GKBO/Ji8SmS9AbeYREzLeRJIZo3o3Ee/8wzN+igzN6LTGeRig2XM7R4j4+Q
         KURw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338p8kjrJkv1EtfbuF8+YPeIHJ5kOKBgZY45DOR0l6aGGfMiYYg
	y9gu0tSaDCSymQXVzgc42M8=
X-Google-Smtp-Source: ABdhPJyFXzA6dMKL5MYvdXc5h+43DhMhTWuFGfRI4OUgGUAafHHUQIQZUBA6bHHylqAapta7A2yMHw==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr2452187wrr.390.1598889908274;
        Mon, 31 Aug 2020 09:05:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6592:: with SMTP id q18ls1352357wru.0.gmail; Mon, 31 Aug
 2020 09:05:07 -0700 (PDT)
X-Received: by 2002:adf:f245:: with SMTP id b5mr2417525wrp.288.1598889907326;
        Mon, 31 Aug 2020 09:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598889907; cv=none;
        d=google.com; s=arc-20160816;
        b=tul1eyj9PMs/oyQSsi/Ry6KETU4ovIjljdBxNKMHwipqvA35KaEGddzZ76YqwHDIFT
         t7RO0YY7AKE4tccIkyhFdnvFhXxEiKasu7j8/qJ+bt8Hv7e0V32QCAi6pgrpqiYvsMdo
         m/8IuVoxxJwkfhJCsaqLzEDRN/oTcJNp04DiHNwo2opKq8fIj8ATg8rFi71hjwMFlscv
         KivhHGoFA+FBTpY1mANWPXgUUeRv/MKmaPMi5eZVL2Psavd/ZbALlRHpT+IvPZ4G4f/m
         oOhoXXUTtI/mdytjBNpNTFXTq7U7p9xUbctm/7xwiua5jPkMIPWlEXQY+8/w5SexcF1X
         OULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=0rv7imkVafqNCVb7ag18RqWqqCwPMhnzbvp8qU7IN6w=;
        b=afX8PLfUT3KRxFSNANMWIZVScIuWmbQTxdB0JOZldMRkTGLg/9ZHbjeKyb2V+SRkP4
         VD9eqrJKIERluck3j6lHhsaXcmVzoC7dfcMT4iLlpoEJyLzdK1czgeU+r3lipTjPuK65
         Xqz0s/A8dn0grjQ/UsdLRC8I7bi+C9x2sX6kljs8EoZcYV6vp5oO4p9V5B5DuAuUyBLP
         wFo/+su0Bxm/+qZ/X/COXPQReUfHzMgAKLpUN0IS0VAi72fMtvApUbZOCt8DmS/9ZTdx
         fV0y7v8NEW4wexCBJ0KhlBrQ8pChMtEzW1wfxoXmbC6VwD+8KNNgVyLO39t9PbN/qV/8
         tVQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y64si9116wmc.0.2020.08.31.09.05.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 09:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VG56U3019330
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 18:05:06 +0200
Received: from [167.87.39.104] ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VG558S021123
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 18:05:05 +0200
Subject: [jh-images][PATCH 6/5] jailhouse: Fix build of x86 configs with
 latest version
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1598871229.git.jan.kiszka@siemens.com>
Message-ID: <a15c05e5-4658-fb0c-474c-20a46f5cf178@siemens.com>
Date: Mon, 31 Aug 2020 18:05:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1598871229.git.jan.kiszka@siemens.com>
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

The IOMMU data structure in platform_info got relocated. Account for
that.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-jailhouse/jailhouse/files/ipc127e.c   | 24 +++++++++----------
 .../files/{ipc127e.c => ipc127e_0.12.c}       |  0
 recipes-jailhouse/jailhouse/files/nuc6cay.c   | 24 +++++++++----------
 .../files/{nuc6cay.c => nuc6cay_0.12.c}       |  0
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb | 10 ++++++++
 .../jailhouse/jailhouse_latest.bb             |  5 ++++
 6 files changed, 39 insertions(+), 24 deletions(-)
 copy recipes-jailhouse/jailhouse/files/{ipc127e.c => ipc127e_0.12.c} (100%)
 copy recipes-jailhouse/jailhouse/files/{nuc6cay.c => nuc6cay_0.12.c} (100%)

diff --git a/recipes-jailhouse/jailhouse/files/ipc127e.c b/recipes-jailhouse/jailhouse/files/ipc127e.c
index 021e4ba..7486baa 100644
--- a/recipes-jailhouse/jailhouse/files/ipc127e.c
+++ b/recipes-jailhouse/jailhouse/files/ipc127e.c
@@ -63,21 +63,21 @@ struct {
 		.platform_info = {
 			.pci_mmconfig_base = 0xe0000000,
 			.pci_mmconfig_end_bus = 0x3f,
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_INTEL,
+					.base = 0xfed64000,
+					.size = 0x1000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_INTEL,
+					.base = 0xfed65000,
+					.size = 0x1000,
+				},
+			},
 			.x86 = {
 				.pm_timer_address = 0x408,
 				.vtd_interrupt_limit = 256,
-				.iommu_units = {
-					{
-						.type = JAILHOUSE_IOMMU_INTEL,
-						.base = 0xfed64000,
-						.size = 0x1000,
-					},
-					{
-						.type = JAILHOUSE_IOMMU_INTEL,
-						.base = 0xfed65000,
-						.size = 0x1000,
-					},
-				},
 			},
 		},
 		.root_cell = {
diff --git a/recipes-jailhouse/jailhouse/files/ipc127e.c b/recipes-jailhouse/jailhouse/files/ipc127e_0.12.c
similarity index 100%
copy from recipes-jailhouse/jailhouse/files/ipc127e.c
copy to recipes-jailhouse/jailhouse/files/ipc127e_0.12.c
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay.c
index c3b489c..8fde83e 100644
--- a/recipes-jailhouse/jailhouse/files/nuc6cay.c
+++ b/recipes-jailhouse/jailhouse/files/nuc6cay.c
@@ -63,21 +63,21 @@ struct {
 		.platform_info = {
 			.pci_mmconfig_base = 0xe0000000,
 			.pci_mmconfig_end_bus = 0xff,
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_INTEL,
+					.base = 0xfed64000,
+					.size = 0x1000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_INTEL,
+					.base = 0xfed65000,
+					.size = 0x1000,
+				},
+			},
 			.x86 = {
 				.pm_timer_address = 0x408,
 				.vtd_interrupt_limit = 256,
-				.iommu_units = {
-					{
-						.type = JAILHOUSE_IOMMU_INTEL,
-						.base = 0xfed64000,
-						.size = 0x1000,
-					},
-					{
-						.type = JAILHOUSE_IOMMU_INTEL,
-						.base = 0xfed65000,
-						.size = 0x1000,
-					},
-				},
 			},
 		},
 		.root_cell = {
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay_0.12.c
similarity index 100%
copy from recipes-jailhouse/jailhouse/files/nuc6cay.c
copy to recipes-jailhouse/jailhouse/files/nuc6cay_0.12.c
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
index c0b5da3..ec0a41a 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -22,3 +22,13 @@ SRC_URI += " \
     "
 
 SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
+
+EXTRA_JAILHOUSE_CONFIGS_amd64 += " \
+    nuc6cay_0.12.c \
+    ipc127e_0.12.c \
+    "
+
+do_prepare_build_append() {
+    mv ${S}/configs/x86/nuc6cay_0.12.c ${S}/configs/x86/nuc6cay.c
+    mv ${S}/configs/x86/ipc127e_0.12.c ${S}/configs/x86/ipc127e.c
+}
diff --git a/recipes-jailhouse/jailhouse/jailhouse_latest.bb b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
index 143fa0e..b21abf7 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_latest.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
@@ -14,6 +14,11 @@ require jailhouse.inc
 SRCREV = "next"
 PV = "0.9999-next"
 
+EXTRA_JAILHOUSE_CONFIGS_amd64 += " \
+    nuc6cay.c \
+    ipc127e.c \
+    "
+
 dpkg_runbuild_prepend() {
     bbplain $(printf "jailhouse-latest: Building revision %.12s\n" \
                      $(cat ${S}/.git/refs/heads/next))
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a15c05e5-4658-fb0c-474c-20a46f5cf178%40siemens.com.
