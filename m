Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7D5L5QKGQE4NMQOXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF72283028
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:56 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 26sf1119229ljp.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876395; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yy3f18LkR4E6+BCXQNsWhKmDwrDkBuFbdwfKWWiMBDJDpbhv13Q9EehJA/qoXLjwqW
         F8M+jdnMxeoGtfownGMmUHk9rOQkqrFlI1+SMvHgzLPE6QjA+U6S42H689TbvCZMlP21
         XjEIjbCtEK83FGgt4aaBxFqb5vw/IjlQrYqciNo0RJY66hGSOwjGeVS9/BZIBBPuZoJz
         AkaHkADxGO199GvNndxkiPBXplF/TNB/K9jkuCp606U7qPJCEEWmjZvJJbtByqZ7WquC
         C0aIHhgQGmZboK/+Mf8QEfZyNgZ8fnkPh2SfD3cfy3JOk+DmzxCiL0+/Kn2WPidb5SOO
         q35Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=H6iUJnd6p+yLV79DP9zYvwy+izrkg03KOlcptskFEk4=;
        b=rWNKBggqUIpDSZN+IOTCa2xUU/BD7ZzGQkVzsqt2hX0Jjbyf6At8U9nofy+kzX+hIk
         1nTLuT+AaavzhiLCbgQQcfbrJyMWbWWho2/0oEvX4MmNatPdm/Ty4lRb70RHtPEiGrkB
         DGLYA4Iwpmk9M2klHKQIc9MpoblBoqx2jQyE7v+aAJt3M7SnhsvFz8uNXk4nr4RKOWJ4
         DbNJqaSuRFtXXA95DwdcM3HW3rOFDT1k2dr7Y7WKIEKmcw104xcHzPoUK2/SBUPRaC27
         R10+V2xo8xAJKfvjeo1zilXal3oyFL9/DDhGlJ0/D2tXFB1sYtYmHgiG913YdWPtbNiQ
         LhQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H6iUJnd6p+yLV79DP9zYvwy+izrkg03KOlcptskFEk4=;
        b=I1cVHZx7Gb3RAZ/JrIXUlh49X5P1xy+MGaRZKmltc0pASTh3AKAhN1XO9VX7PE304G
         AWj6a37zu0NhIUEBY4piv08LYG1cybcQ+xWDkFjCX0yEubeSfuF95sEBkZ0nyLq/diJb
         /HYw5atEaCUVyJHUmt5McMMAFGs9dTaui0vy7m0eZr83i8+6gcOVv8HVOal2upAf4ecu
         OCGcwuoiT3O3B6q4dp28B0wFq0FHOtrPuss/uPpctmTzLZjNYhII4B0isoR8p8Nprk3H
         B3QHxxaxgf3JyhW7noAiT3nOsRAISW1DOhvLjrFpWhAkYsfjicNO8VAB7SiIzGC01Lru
         T/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H6iUJnd6p+yLV79DP9zYvwy+izrkg03KOlcptskFEk4=;
        b=h3GUhlNKs/tombU/6DzspcZWLcK9qaTHwF5DlawHDSKAUfCWiw6Tp2g4/AjpAxb5+2
         O5XrxhncZ5z/AHB6M3Mjd7q+ZiMVben92tNKsH1fNAypfjHg7W0JY8UOBIxQvieRnULh
         VdKFbUe1YV0BRyaPtIwkEzN3fHKo5UTXcbWiTNrk76XA7g1vO7obu59Y6uW2globpuQB
         J8jzZSKVz8S5f0nUktHlGSWLM1/N4R6Q7CloR/bNLU32hv29W/P1NT1he7AlfQlXxO9x
         TNFALK60FnH1zTt9qGxbHTNLIioBbj4eZ8HqXjhicmiOuoo9PfU8hOB/4B+b+zz03EFR
         HkNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531OpMoJJH7vo9mb70cg/5fYwfeLAQ9dF4IW+wCAesjdlkliTCbU
	tulazoAYZmBkHAQKS9dCDBQ=
X-Google-Smtp-Source: ABdhPJzPLlylb9RBOb8o85mipQL3gf5zOKY+TyvcfkBlAZHMCUJglLBGDPBKbL9cNz6lZG8NFRLaJQ==
X-Received: by 2002:a05:6512:210f:: with SMTP id q15mr5112924lfr.504.1601876395597;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c08:: with SMTP id x8ls871521ljc.6.gmail; Sun, 04 Oct
 2020 22:39:54 -0700 (PDT)
X-Received: by 2002:a2e:50a:: with SMTP id 10mr456167ljf.55.1601876394250;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876394; cv=none;
        d=google.com; s=arc-20160816;
        b=mNpTy/G3XivMkv9XxbewGP7PBIhTxMdfijCkocRNwfMMNStwpUaIXshPLTkUmhQQ7Y
         X54Kr4TaBjSi+C0jd3+dWSufGQAOZT1sqXm4uidA5RSJe4aYQX6me/qRPyGfDS6VENxd
         Nkg+El8IGHXCZMLuoorlkjUWx1AfgdG21Q4qd/f8LPLbJjfq8MGYlGgcco+BZbPR+Z5+
         L/bEy5PS9ctIZWdv4jwPWi4eU60MBoPGw8yHVn410g0mvLPv696KF/UxMF8sVlMDCUoo
         0mSNWxhAB8CHRlIBh+HgUCM+eNjDA2qYgzbCTmPZAfR3UbafjCmlkdHy8lHhL8nav0Kb
         Sq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=oKxHEAz6TFQ2igg3EftrIqeIeSpiKlcNB/jI7DIz1Vo=;
        b=sl3z5tSiRM5VTbJabpmXaZngiVbnk24IAPKvECopvh1lSA+XwGXr8iCDrbpxSQhSzw
         oLKowCmEid8JUd/26VQzD0QnIIIFSgNx6bps3P9TimwdHu9IvsMbfkkwA5kLIORhMJvP
         3E8XYH8z3NNjNmYZ7Qi780x53ITlZemds7tvFr7CAUPOrd6iXFdJd4P4HzvsVKUY/FBW
         AWtouabmZwe6BfK/fNMmJPTc2AplqpCN2gk31KgOkgqE4cFPWFK82BKyEN2TbbXxlz7C
         QxVOY6ve1RN+SndTpLm+/gHA2mfWNrfaLjXpLLMkdWnQADpPMmv/tVGQHlbT+bJ13U+F
         kDAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f23si202687ljg.8.2020.10.04.22.39.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955drnb002220
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncK025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 11/19] ultra96: Add rootwait kernel parameter
Date: Mon,  5 Oct 2020 07:39:41 +0200
Message-Id: <223a94be3f018c46ad5bc53790b737f2b94c36d7.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Wasn't needed so far, but better safe than sorry.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 wic/ultra96.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wic/ultra96.wks b/wic/ultra96.wks
index 2ce1785..41d092e 100644
--- a/wic/ultra96.wks
+++ b/wic/ultra96.wks
@@ -13,4 +13,4 @@ part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boot --al
 
 part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active --sourceparams "no_initrd=yes"
 
-bootloader --append "mem=1820M"
+bootloader --append "rootwait mem=1820M"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/223a94be3f018c46ad5bc53790b737f2b94c36d7.1601876389.git.jan.kiszka%40siemens.com.
