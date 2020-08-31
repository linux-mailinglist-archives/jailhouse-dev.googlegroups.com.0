Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXU2W35AKGQEVX26QNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2025848F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:53:03 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id j17sf1980916lfm.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:53:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917983; cv=pass;
        d=google.com; s=arc-20160816;
        b=egk/ZQis7ycnhS5u0htP3BPx7KCCFVha30jGUGK6CHcLPuTa/svJkyVqFuDh9cfL93
         0Fc0HDuCh2CL/Fu7d3q6SztMqTBFjlZT0iHOl59HD7Z2VV629Abx0nkPZS1ViiaQ16Jh
         lk1ol1raCbE9iyTyyW9NFaN1ApO9aZPRoVxqElqeVTlyk9WJDYzkqegc+P5NfD4Hpz0o
         Ef0yXioXsdMiBoZBzMlB1SKgHkZ3nS9zRHXZoXS3mVYe0Dr6MG1TuCOiEZ7XISaLE9Te
         nmAtfBafl/VLHeEgbBpgdytYdLokhqbZmrytBxXMSI0Mc4NXzWdxsNYmyZFCLc9dfnv5
         Gbxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DM+WT7ApEJO9aAp5MTbAN58GqKDS+ek2M0E3VblpwqY=;
        b=rr1Ad2M5zMSagxAgc2K2WUXNJqR6ddfD5xo6gUdj4Atkowj+HnplZEn3cNxaGHkZlX
         /1xZqGRf9b1cft+izuHodaNgP14a2XW9fgFN/Y5BqULaSI6x5bFm7P4EGZETWh37kA3D
         vfnfynjX9OIU98sW5JBGSZvObQJNdD98Vg3pcUqb9LX1XcnNNFl0BIYJGzDnRVQJXpgJ
         15DbBN+DTItnt4UsMln3hDkjJCzFdHAXq6/TJ+Vt2T8yfaYOhHyQd2GFqPw7ELfQIp5U
         OamFwTvMck+775Ns5t8tn9l69OVbXWfvWotxYXe8cskNr4sMZX1EBfRjQ50NTZVMjuJ9
         N/bA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DM+WT7ApEJO9aAp5MTbAN58GqKDS+ek2M0E3VblpwqY=;
        b=CeJtsNAA9RfcsWNV/SiwJRcgHWKHH6U0Lqt8/UzITp2cco8kHReyH771Dn9+TP3esv
         kSRaCpxGJKJn4O9oH74AYWAWEI/gFJNPgcTo6GSv8nif7LPPB72Z1ltKh6bHOMtcHrYq
         Q3P6Us84OVplabMa+KCzHnD6gEUey2bjzkcwZ86dVv0yPtvL7bmYee2Sh8udvAH9W94I
         ZAPCfrfPAr87u4+3dl/qvA2DZsBl/p84Xqgv9gZa979MH6qgBXtyV7rLXJ8eetnd5EqL
         JrM6bVLokeRwSIgdduCSFfQj/WEq8VCL/PmR5QUhmvbR2qpEX74yLeqgjsaFkZsuWkDD
         31gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DM+WT7ApEJO9aAp5MTbAN58GqKDS+ek2M0E3VblpwqY=;
        b=fl9JaAdLSZOq/UR4Dy2jzFlkm3jfzWrTL0UCTmBpqVMRYF5GQCCYWlZtLLeVVDU5TD
         vflfh0zT/jC2gLWiSv3RXUhA1IYqMez35j7lmEFoisCbL8PKMLT6hMN3EEth5rILcAmY
         zkfB0mPVmVd85L6HQ9y9uzWYAWBlJMTxvJ+uQLQtrFlmXU60F4Uwmeo85lK4HFjLDQES
         Xm1j3PpPXmL4vy09g4LEda1pG/Vvc4ccsWhmO0K1iDEAMKLUE1hPz/TgXRxk9WkU4V/U
         OF/na66bVvE08360Fvi4/20i1pZEDluCGknuuJ2Q4aG/UaaBhVk0OcMeIPWyjMnIgUcQ
         6dHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532tVT6P9HYD8XOwbLAOnKirwscypHC5RCUtzSfReDuUDHIhWKuj
	ZuxjhvQF25MMBnFTJE74CAs=
X-Google-Smtp-Source: ABdhPJxwY/hrIHpvHjbITEFHs8Ua1pgpQdk1ho1eB0o9U8fO6crEMIixCUYnV0SIxw7yXOSX0eueGQ==
X-Received: by 2002:a05:651c:10d:: with SMTP id a13mr285318ljb.217.1598917983278;
        Mon, 31 Aug 2020 16:53:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:294:: with SMTP id b20ls1386554ljo.9.gmail; Mon, 31
 Aug 2020 16:53:02 -0700 (PDT)
X-Received: by 2002:a2e:3506:: with SMTP id z6mr1644628ljz.418.1598917982232;
        Mon, 31 Aug 2020 16:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917982; cv=none;
        d=google.com; s=arc-20160816;
        b=Hbdci/bv1mTV0wY9SFQVwbJj3U8TIsGSzjclX14t5EV2h3iQgqIWfy8Pu3oRDuAWtL
         hAOqc8Jc8wqa9mmHL6BUeK+UwXvqDFVn2wo9CR3dA/bMlkNU7NEhCBgeFQ/e+E87/yfF
         icGugQN2VxBN5HXmyhUDoZY0DWAuj8W4G0hWenNYNwUca5orCxdj1VDu+YIiyCXHeLKe
         c3MCfUNWVQDSh+ySUsEc6ZNGBF5bmeSIf1u1txxUx4Ur+lpu3sIF9+/KAWVh5oCFkRgd
         hO30I+9hRL4nIyMs8eAK4B/CX07yh7Y2ga3ilvHG6qxiVwpxas3YEfPuAbXLKCnJPObY
         uR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=JiEaJP3s7jMWEucCAIC3oEmwsMkzzWJTLHgD88ZNvvE=;
        b=VW8IylEVprcixy+KoA1Zb+QIOCNgT+OCp/pkEvOnpJOVeHE59MKOKpqzcPWMUIcjDm
         RlZpx8EECpClSXNBfUhycY4J0fRv+vMUqp3bnA62oTv+fRor4LUX7hBtc2QyYE8I8MYu
         NaIxRgtiwIGlFgg4dTwhfQF5917inXLCk1Tv2jIKrUC41h7pwgtVNocj87G5xWY40fgh
         omUTVLET7v63Wbazp5cbG9Su8wHXkjsBLGtEx8+Mrf4L+kihkGOkkkgR7L78glNU5M7J
         Nz38x29oSH+baydoVE7kEzhiD/wrIgdenXKkAs7OUrE39qspjcSsQZee5vUb49MBe+fs
         EjSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a23si344828lji.7.2020.08.31.16.53.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VNr11D020190
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:53:01 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorN007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:53:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 7/7] jailhouse: Fix build of x86 configs with latest version
Date: Tue,  1 Sep 2020 01:52:50 +0200
Message-Id: <9e6c720fdc2ff10d33cdba31173d029083a5d6e9.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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
index c0b5da3..a4a5d9d 100644
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
+do_prepare_build_append_amd64() {
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9e6c720fdc2ff10d33cdba31173d029083a5d6e9.1598917969.git.jan.kiszka%40siemens.com.
