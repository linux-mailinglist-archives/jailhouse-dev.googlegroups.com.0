Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXF63H3AKGQEI5HVXWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 618831EBDDB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:17:01 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id k12sf3510218lfg.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:17:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107421; cv=pass;
        d=google.com; s=arc-20160816;
        b=qddNYN3cuRd8JBPfiUfGYGFCrjmtJdMseHKbB0BBO3cFSII98FzJCSOyxyua1UhW70
         d06ZWmv/W0jJgmOOUm5EZq39ZUAE0Yj/qh1HHx45cL82R3aw/DlvlyfEUMbMfpb3/lBN
         SglRjW0dYQD69Mu0WIVC1zNfLfRYATLGj5A5ROu8dbXMI7E94wVdgsp38snztnm7/zQq
         X0Ibi1Yh0rXb7Ub0IkV6I/Fbc3RhYOfE9v6GIg3EZvlsJNJkrRnZmq1O9BJnVE/sljMD
         Vm88dxYk09pvOMSiYGYEsxTzMcFTJ2KJDXOnN4sbGZfJRk6fUPSv8kLU2pzZe4rgAy2y
         RsaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=w0ohn57YG5I4QkSdXPooBXXMwzsPzRapCK6FX2Ws6dg=;
        b=ZNgMd/3kbzDKfacT8J4+kEQESUdy06h7qNW56aY/W7qwL+8VBRLlraDK/y4koCG4uW
         TUC2u3ZZ7kHtHa3KAaQgk6SaJlJhqG6x4B36LKPmBX15T4l8IhZTOxrihZ0+yHNs4t9X
         /TZu87twYP2nCGnnl46aUWvwawvNyVDCsinX8RkRcEC1sXjNnkz8vLA0iM+iQLBNzYjw
         kRPUdbEZJgQGguYODayURbl3cYZpGpGhA2qT852F0y7bs5KKmjw66aS9Xk2zCH4hefK9
         NfJ4Ryayprs5syo0SqTKplozTCSKHEXaHl3P0tLRKWF/9P5O5XvJ5L6oNcaGrxOsPuAJ
         oJ4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w0ohn57YG5I4QkSdXPooBXXMwzsPzRapCK6FX2Ws6dg=;
        b=ShHerYRZGMI/mEP7IpxpnhiTip+sU6BSd6xIj2QODB6QQHvv1cTqCoHDcvM3Gg31Fa
         I20RUw9tRZ9bEbhYmqJvs6zLQZ+rIW2of52+KAiG4p6pTkTasjwYlNaCfoMK57OZ4Jur
         8pjJLNQVhw7+HAw0m9ensEsmY/kiTra3U4CFbrgIx7p8x0CJLXsz6knRRklRczQk/O0z
         CowthmuSZ53K+92G8qFuOMgJCXLdLxHAJ2ylKEcIq9Cu/NXTH6Emq49sLEeqJkflM4jU
         V446CDOG6+zNLUSx085RDP7PJYY7i3W3YfVnK5j6HDvwavYAkIqgwbr/5FLkpVB36hg1
         mK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w0ohn57YG5I4QkSdXPooBXXMwzsPzRapCK6FX2Ws6dg=;
        b=RL6LyoYQLYR6zesr/rkorIL0UVGLD6D5Xi5Pl1bKiv0XlBAwZ2CzTLxkyMWqp8J8TB
         m85v/LREUBRPEvQoPBO94QH+2e9/6lPkJ2kO7NQlOTdZ36oYaDxbVmVy2tTu89mrpnCZ
         /CrmvW1GB2xJbSv3CqG6/XEUeirYCCRyA/YOV4fLZGF2weJV1EyoWsfi7fu3XhuVPeyN
         srs5FE/+zhUgkPwL52XN9mbWzBYvN46cIGlix4gFybq8lrmL4fOZQLquIFrQIWEZseL4
         AW09/mUvuc1BAHg9Th4KHp/LdYDvpmZnTupyX8anDeQhEWP4EkQH2leQ6iooIecYlWYo
         k1Uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532vyM/5Nr+GE+9vggBOpI+SoOnBYc2wEyZH+wf/SbxBaYjbiVGh
	y+qKkjxt6BTxQculoCejee8=
X-Google-Smtp-Source: ABdhPJx0+zjcE9cTOahcNbksFBRivtXsBUh4yTlTjFFiNvq7hso9Z1M3FiMtFI7ImauZHCivhsZNAg==
X-Received: by 2002:a19:6a0e:: with SMTP id u14mr13812249lfu.192.1591107420939;
        Tue, 02 Jun 2020 07:17:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9791:: with SMTP id y17ls2551070lji.8.gmail; Tue, 02 Jun
 2020 07:17:00 -0700 (PDT)
X-Received: by 2002:a2e:9b4a:: with SMTP id o10mr8528077ljj.278.1591107420233;
        Tue, 02 Jun 2020 07:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107420; cv=none;
        d=google.com; s=arc-20160816;
        b=W2rUPIOqpsgvLKs9UxfateyF1Hwk7maeYHyAPiBiNu1Azf6iqfYRWvK/atsfuYLBB4
         3xAqGR7WkpnLDajckIfvX7gLHsnRVyJXM1r5K6mDhSLnZOKkSNaYkCBnf8kfsZerQYxp
         crOQXBkskcjpfzKZBN8BUUMHeX9iFjITf5rtmRcF+iuAgLSdTVnGmq4Dld9uFCZ2ownQ
         ivdAH+fYMEXtbZh9MPOLbd7JUYgZalzDnFqBzxxK1iF2uFex1DuQoy8+5otgoMgOdBqt
         mTnhbk7+5+SlJ65HG+VWJh6COT7s5G3yGs0+zleH4xbqKVIDQFxTZfNTxBHwTJzQCafc
         nD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=NaTldDzrrM7ZeQJAGBFyt1HVic9MFxKYL1pTeoJjOyU=;
        b=D0F9kSgkeFo7prNWPIoaKCGOrBCKe5WlFHbeHZFdgek94dcs8SJWSMuy+lL5tHx5KY
         oFKvCRARs7Bs0tXO5wyIlkhD19q5qIRi2O2TGL4l0hwPKosU4eBCBC9S5QPp+tpNWGsr
         02A1t5Qi81GIgw31Tpj5oRLDmY7g8IeR3iFzNVgUffd1I/8TPnUMkzUHBBMud+L4hidX
         h/nUpRNrvVtuQRKGufIhTBaY/nH8/cCkyeEtD4s97RbDSYTdUIC89UraUZqTGyP6x/H2
         g6ZwM/flvagsKUAL/GigeP2rM0OrZSnSfPGldetLARQP0uUCpdMA+qDx6w2bMhc2IRQ9
         aGGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o10si142148ljp.3.2020.06.02.07.17.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EGx6a011724
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:59 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdO028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 15/15] configs: arm64: Shrink imx8mn memory regions to required size
Date: Tue,  2 Jun 2020 16:16:38 +0200
Message-Id: <0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

The last one was unused.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/imx8mn-linux-demo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/imx8mn-linux-demo.c b/configs/arm64/imx8mn-linux-demo.c
index 1618cfc1..3644b6d1 100644
--- a/configs/arm64/imx8mn-linux-demo.c
+++ b/configs/arm64/imx8mn-linux-demo.c
@@ -21,7 +21,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6.1591107398.git.jan.kiszka%40siemens.com.
