Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBH4V733AKGQEJZ7XX3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id D70FE1F3B78
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jun 2020 15:11:59 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id c4sf706992wmd.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 06:11:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591708319; cv=pass;
        d=google.com; s=arc-20160816;
        b=P35d7UIAO/D8A/V8ihFwQ5YR2UvuahOzjiyY3GG/jM8hcQSpfPNh+1arAcCb+4nf8O
         O4QC6HYIYCKedoFHgUA5iMbOny2MLppTEBW0E3UGwaO/+lE4Abtfo73n+np7/C44RGMV
         x6XVS/k90r59Y/5Ug3evlfZINp1JlSYid93eDUfjF9yTX+/x+9HyJYaJPrhp0Syrtc+a
         AJ9+O50cxaaY2p7YTzix/m2dAVhoHgHZnjlbtqEZWzJEB3RtkPveoCrshnFvIfiXUnD8
         5Xz7j9tOV3wKMIktWrwn8IOxl0uTIMfweU2pAYtSFN7TPIU3DUv9uuBtE68brPqqlp3C
         QIFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=SBx+Kb12m45zQwZAmaNILdXES6LbSAmaft8kIKt8TIo=;
        b=SNkvCc82asucliZPoSmJgleuWRbNtvGYWbB1jfF9eKoiRhbBfRNBxKb9dkFGLNU7PQ
         s/xpgNxbvz+p4us/ftUVQXYZ9rVxtWz8iZOeuo2cybm8BzAF88lrOBMLK+f70IcD4YQI
         yR0HZFFv/FklgU2K4+P61zZmLQBUTKLR1vUvHYstg4BCAbYni+J4UsRyNsvixCtnCei5
         V7QcJjX+zedZuwKDEwnv4MRf4XA3Q83L2ZWVjona9jiw+7byfihCM5jsbam0g9TamjJ9
         HeaKQnDsHlZ9ZTdRsfF1w//8wyeQqCwcIxFXA/Mngy3xex00dYsFhWh0QhsI9tAfbNwv
         wJ2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=eRLhPXsf;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SBx+Kb12m45zQwZAmaNILdXES6LbSAmaft8kIKt8TIo=;
        b=neQ3rH2lqwhddEnUq0ILfUf+u5bdIbh5fZE8eOdPBfLAdktu2lnsuNzB3YuKBjZRD5
         3mJxsn10mdQXdd4IxUIVI2lLx9egTLDRnmcDsIhNSBaJsHOYp+fD+hZ3pxGKNsoqf2vb
         I25T4rXot9L2e1tYS+g8xkkHZogvVGJ2vn2To/LTgUjCVECxyLwN4f5Du43wM0rtrTfd
         ESET61hOORKDAP3wrSU9r4QS+amjAi1rwcfJXEl4+HY47iG8QGVYF5mBFos1vkITHcSp
         BZGWvEgbYLN3by9atEM9PdCBnDN0qmu/Q3evBP4b1tX30RrgvpZjQis1RvvG4L7dN7Ct
         kjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SBx+Kb12m45zQwZAmaNILdXES6LbSAmaft8kIKt8TIo=;
        b=dpat1sppCWo7of4TaFHSDFSl1FONWONg5HAwKIGQLxnCTJAQCOKDNu5JaU6XlzWI/q
         PSEViJZp8GWX4FyHxL9s7ra33hFXiVvjp/BcqyJ7PNlThIdt9R1L88LVE0X/VzJ38vid
         Cn6qb6beoVW1hcu5wlt7MO9pt8TFzx92WUlx9RSO4opRnQRQKlSmEmymIdRF8mVYBZPw
         e6ck45/a3xeHTVeJL94z/LN/ICLgk1UY8j11wgePbNVWpELxu+1rd1DuyJgrBhf8/WJk
         P/mTUOYSqOAzWMdYkLxShSuHBbSRJm+dhYnH20qHH89kY7IW4NbAFBLbpt/Hozr2KC/z
         IqBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532F2gsOrS6ngWEPjtX8W7Av3BqNP47v14P+9ak0+lKiK6AXeZmL
	A3rRMYPyDOITNarXrU2Tu3U=
X-Google-Smtp-Source: ABdhPJxFyxvioTyv9qUkIg3KSnjPptLNzzKgUY1DN1401zUTPj6r5ZAcvvUfcDI781v0o0BxXO5YCQ==
X-Received: by 2002:a05:600c:4146:: with SMTP id h6mr4153388wmm.170.1591708319589;
        Tue, 09 Jun 2020 06:11:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1d53:: with SMTP id d80ls1505812wmd.3.canary-gmail; Tue,
 09 Jun 2020 06:11:58 -0700 (PDT)
X-Received: by 2002:a1c:998c:: with SMTP id b134mr4207520wme.78.1591708318830;
        Tue, 09 Jun 2020 06:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591708318; cv=none;
        d=google.com; s=arc-20160816;
        b=SHa7NgLvhpjMNWYAKid+l9dCtYw8HmkjR5bBzFYgdNJFZvPvJ1LnbaxA/VgniQnyY0
         6N1H/ZOUHftwVrXyWR4BUh0VF3itiGdEHPUVv7JSx1Zo2ZfQID8ybqPIUakgJSCRAUh6
         0EUigdfLW8XxcN0/aPHpQk1aOgeJ9EZ5PopCB9ndgDjqv1CiyAJLyByjoBxEFytnlit2
         u8NVUGMV8alnjMOM/ws7p0P+wer9ZreY9/fxm+yihfdPYe1FgxTnSXyf3m2z6m7vhCUr
         IqRA+RodKnB69lrr5KSGzL82Z9zFoLVRz1nf9EmuTRy7J6H+QfVPCjKdscwSXeWkG2yv
         ByrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UdQH/H7pInPguy9WSP0GQFhg/hLOuYE07cHt59D05ws=;
        b=akcMPLegTRQUa8aYXu6bRXpdhrjqViaacOoYtNR/3M7BLIiJxWuEg4O1Del/K/XxjU
         NrixOm0BUBm+xxJZdf3bADSPBE9qF1VQdyuWSf0sjzBLr8UjCDnfR0V9IITE0/oSDuXn
         Q3PY49Fs0YxLo5qPlbkYqPFprL4BRpW46nagsqXuFGPjQPStXATh6R5iV/RvrufaOMYC
         MlDnQUwTksZOFtH2Pi7MVeVKv20jBhWGjzQpCHmaunGqujdguADgtQq99Ll9E4bECQjR
         cBVmW6ma5gvtazSTSCgbtbIS5on63fu+01vMHzB5ab6SGr/W7XaE5VT1MQkzmOR5kjdf
         ZlEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=eRLhPXsf;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id r204si145029wma.1.2020.06.09.06.11.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49h9WL3XrSzxyl
	for <jailhouse-dev@googlegroups.com>; Tue,  9 Jun 2020 15:11:58 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 9 Jun 2020
 15:11:58 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 3/3] configs: x86: f2a88xm-hd3: remove unreferenced PCI capabilities
Date: Tue, 9 Jun 2020 15:11:43 +0200
Message-ID: <20200609131143.2133316-3-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609131143.2133316-1-andrej.utz@st.oth-regensburg.de>
References: <20200609131143.2133316-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=eRLhPXsf;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 configs/x86/f2a88xm-hd3.c | 43 +++++++++++----------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index e5dfd78f..b529e6a6 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -27,7 +27,7 @@ struct {
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pio pio_regions[8];
 	struct jailhouse_pci_device pci_devices[26];
-	struct jailhouse_pci_capability pci_caps[27];
+	struct jailhouse_pci_capability pci_caps[24];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -384,7 +384,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x8,
-			.caps_start = 3,
+			.caps_start = 0,
 			.num_caps = 4,
 			.num_msi_vectors = 1,
 			.msi_64bits = 1,
@@ -398,7 +398,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x9,
-			.caps_start = 3,
+			.caps_start = 0,
 			.num_caps = 4,
 			.num_msi_vectors = 1,
 			.msi_64bits = 1,
@@ -440,7 +440,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x19,
-			.caps_start = 7,
+			.caps_start = 4,
 			.num_caps = 5,
 			.num_msi_vectors = 1,
 			.msi_64bits = 1,
@@ -468,7 +468,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x80,
-			.caps_start = 12,
+			.caps_start = 9,
 			.num_caps = 4,
 			.num_msi_vectors = 8,
 			.msi_64bits = 1,
@@ -482,7 +482,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x81,
-			.caps_start = 12,
+			.caps_start = 9,
 			.num_caps = 4,
 			.num_msi_vectors = 8,
 			.msi_64bits = 1,
@@ -496,7 +496,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x88,
-			.caps_start = 16,
+			.caps_start = 13,
 			.num_caps = 2,
 			.num_msi_vectors = 8,
 			.msi_64bits = 1,
@@ -524,7 +524,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x92,
-			.caps_start = 18,
+			.caps_start = 15,
 			.num_caps = 2,
 			.num_msi_vectors = 0,
 			.msi_64bits = 0,
@@ -552,7 +552,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x9a,
-			.caps_start = 18,
+			.caps_start = 15,
 			.num_caps = 2,
 			.num_msi_vectors = 0,
 			.msi_64bits = 0,
@@ -580,7 +580,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0xa2,
-			.caps_start = 20,
+			.caps_start = 17,
 			.num_caps = 1,
 			.num_msi_vectors = 0,
 			.msi_64bits = 0,
@@ -678,7 +678,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0xc3,
-			.caps_start = 21,
+			.caps_start = 18,
 			.num_caps = 1,
 			.num_msi_vectors = 0,
 			.msi_64bits = 0,
@@ -720,7 +720,7 @@ struct {
 			.iommu = 0,
 			.domain = 0x0,
 			.bdf = 0x100,
-			.caps_start = 22,
+			.caps_start = 19,
 			.num_caps = 5,
 			.num_msi_vectors = 1,
 			.msi_64bits = 1,
@@ -731,25 +731,6 @@ struct {
 	},
 
 	.pci_caps = {
-		/* PCIDevice: 00:00.2 */
-		{
-			.id = PCI_CAP_ID_SECDEV,
-			.start = 0x40,
-			.len = 2,
-			.flags = 0,
-		},
-		{
-			.id = PCI_CAP_ID_MSI,
-			.start = 0x54,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = PCI_CAP_ID_HT,
-			.start = 0x64,
-			.len = 2,
-			.flags = 0,
-		},
 		/* PCIDevice: 00:01.0 */
 		/* PCIDevice: 00:01.1 */
 		{
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200609131143.2133316-3-andrej.utz%40st.oth-regensburg.de.
