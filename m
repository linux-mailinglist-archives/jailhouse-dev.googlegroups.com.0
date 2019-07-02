Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBWOX5XUAKGQEITBQU5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B45D1D3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:11 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id s195sf9715855pgs.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:36:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078170; cv=pass;
        d=google.com; s=arc-20160816;
        b=tucZEdAvUsgLOFsEl4RKlcPaXmBGEsv+NrCtOIK1Bu53YJsZaBgC/JirPqyQBLOkrY
         HPr970a5q4N+Vckmhm8ahMjcD1YAcIR4tZxPz/mpbk9VKb1i41ZGbr6tHi0xseAGzAQh
         xYpV0FVXbhm5+Arw35cr7S9nwd95oIpn5DsPMTG37cZGEzKmrTyrT2KKBv2iVsquKVeF
         6yhpcghyP+mhoQYMrsM18s5hfJfedWaL4i81QoIybm1VxpNsDLHgsehpA/bTvzW+qnzo
         TVZunDW9zVNERjWkU+hfKjh0P6SgerlF7JK0Ere/V0bUDcvUUzEDhnuViLtCXoDkYZke
         lbjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=UB0T0XIQQ3RZsQivPl4Y65lf+c5YoBMG+HVAlqr71X0=;
        b=BcHmNm+D75UykQIslEjofp0D4DnbvfisIwpoh5lEiAaGpIc49WiH/EQxE4K+8V48D4
         ejyuDcescYBlKRYSuPPXawl7GX2QdaDGqFzguwGXfIRiicQld62MIr4M/jmNleddP1kk
         G8Iw0ocJSY3oYahB/B2i7n8pW2LIA/I/5BK6V0P1Z0leXhxMBfqgqcKYzhjvbXoADewn
         aWw45qPGW2CSAbJvXQlbS1jqGVYpF8VuDplRKNNJPLZ90mCj14FodYR0T150RsjZWiC/
         1J4kQin5vy1lr6jDO4RgUt6iAKb0XTw1vVy9eUzBWCVSdp3bOFe5ZrgZ1NFtgOlPIgle
         KsHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KgMgw4Nm;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UB0T0XIQQ3RZsQivPl4Y65lf+c5YoBMG+HVAlqr71X0=;
        b=BoGGobnqxxIYXt0hvdR6MgYTShmEZrIS2zROqzgP3PF6d8z1orSgeGdAnQpuJ+QyR7
         3Zm5V8kKKXkxsELhLY+p1tQ37d9zyNYAdw+szAbzaPUdL4G0+1f7DiPFysU3vvr82mfd
         /t99HSlbtHx5vHb53q7Z+3aIsEE8qXW1C0+ME4YMljKGyAl4B26Ri7nUIdPNizn+ClhW
         HrFdccvLnWTqTwBM7ubIXY1jj/Kbqq5iTdA8adYSO+d+k7z49RjP98TqqRoRADRfsFYG
         gBUTfcScF1RYG2Asbau16xKrJQUYfbX4mTr027280Uzc+HSzDoAjqDR/OwIHCBnidD5K
         K14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UB0T0XIQQ3RZsQivPl4Y65lf+c5YoBMG+HVAlqr71X0=;
        b=tMPZVPGzzH627uFWW3cDlIcB2SeI3wp0dVgsWNF1uMDMJB+tjwmM2XloM+CXktbNiQ
         5gl6O5PbaBTp+a4XNKmsw2VWjRgTDMgnaYYQto+zc4nYWSg4sj4QKij5b6t/Usae1rto
         y62BQPIQoHpdhMcxugvsVbz8OGf7d4mwFsHuBJ59FEmIUGdBeg8UmRVjcho8qDi/uxVx
         ppUwzB93EXdOhtn3wVVHf9rITmNoyEMwL91xfN08J+Pv2G/UtY4U07FtlMJK1w4hrvi9
         O583Qzi0LjVGvdOaud8xwbunPkT5ohP09izqVPvQ/U4iWVDVV0A3h9XZErkZlEcUQ6KR
         /MIg==
X-Gm-Message-State: APjAAAWU+6wKd1NBlL/pbTSZV6xUu52GECQEU00lXkQFWmZY0wulEm0H
	+BhyvFbqogSg7PgiyGa3bvM=
X-Google-Smtp-Source: APXvYqyjWisb66x1rGNA3EOz8Ibb5J6ThqzPfOSGXkUvrwen4gDPI/dLDl4IROe0M5IF7x3QnDgE6g==
X-Received: by 2002:a63:3f84:: with SMTP id m126mr29845620pga.213.1562078169897;
        Tue, 02 Jul 2019 07:36:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:bb8c:: with SMTP id m12ls4343436pls.0.gmail; Tue, 02
 Jul 2019 07:36:09 -0700 (PDT)
X-Received: by 2002:a17:90a:ad86:: with SMTP id s6mr6051405pjq.42.1562078169573;
        Tue, 02 Jul 2019 07:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078169; cv=none;
        d=google.com; s=arc-20160816;
        b=asrVbG6q7ezrHIkVWKv2BFNNHr5DZn+2GXSUpTz/XQoowaloUaaHQj0GBVP8HQRir8
         PE/XEnTV3kUz/BXouYcf5weTAQZX1RYRIKCwmY7/CZ7ndQU02Ei5pDDaaJP3S32LH2OP
         Ax38E5wSZyymW+SluW5GJIJaFEg5PnTZfS9S29e+DRtu8b1SYihkaFrpsu7pPrIPlkYI
         EZ07BEosQFTl/UGRxli9ud4CU4WLTQL+A9DycbtDSh//ud8q5QtDg0AdoOCmuOL3fJgI
         YVo7PRe+5Hzf8I9gnniX9+QWjf9AcRq4sypM6Q3EDPcbvFGzQq4vbNbuc/nJNNZrPx9U
         9T7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=afEb0gUUtvSJ1l0VRQLFFqLew9LNv3M/wQEzLYnidlg=;
        b=PmYcqcP5LlYLylX8cbtJeEOsaFNM18id0wCXRh9ldVBdXh140JvrX9ono7J0tnr/5G
         Ps063NuyYuNKMlB5WDUgeqGrxQ0RNxxyi4rOu5eYReosTNbtSDjjiMHdPVKJx56cRj7X
         2GLdN0qGpxWfH8z2CAxYLVqmf9avf3D6fiw1sI1aAGw5FPwka+JskEz7iBdA9uDU2eGu
         WVrv79PebcMTn2EJa31SVe6qAwfavzJTMkbMS2349v9jDiTRtSNoWy0Il+RyVKMFRq+J
         eIQeAWRYLvXLiHmrf/vO32eUNkEGAlBxYKdfxmgboLeOfaazCCUZlMBjka5iT9NWOJ7H
         f3Bg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KgMgw4Nm;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id j10si543868pll.2.2019.07.02.07.36.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Ea8R1038349;
	Tue, 2 Jul 2019 09:36:08 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62Ea8fM130264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:36:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:36:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:36:08 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EZtHa022917;
	Tue, 2 Jul 2019 09:36:06 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH 4/6] arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files
Date: Tue, 2 Jul 2019 20:06:05 +0530
Message-ID: <20190702143607.16525-5-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702143607.16525-1-p-yadav1@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=KgMgw4Nm;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

From: Lokesh Vutla <lokeshvutla@ti.com>

Add smmu v3 specific information inside jailhouse iommu. Using this
the root cell can pass smmu specific information from the configuration
file.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 include/jailhouse/cell-config.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index caf2fba8..17d3bf7e 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -203,6 +203,7 @@ struct jailhouse_pci_capability {
 enum jailhouse_iommu_type {
 	JAILHOUSE_IOMMU_AMD,
 	JAILHOUSE_IOMMU_INTEL,
+	JAILHOUSE_IOMMU_SMMUV3,
 };
 
 struct jailhouse_iommu_amd {
@@ -219,11 +220,17 @@ struct jailhouse_iommu_intel {
 	__u32 size;
 };
 
+struct jailhouse_iommu_smmuv3 {
+	__u64 smmu_base;
+	__u32 smmu_size;
+};
+
 struct jailhouse_iommu {
 	__u32 type;
 	union {
 		struct jailhouse_iommu_amd amd;
 		struct jailhouse_iommu_intel intel;
+		struct jailhouse_iommu_smmuv3 smmuv3;
 	};
 } __attribute__((packed));
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702143607.16525-5-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
