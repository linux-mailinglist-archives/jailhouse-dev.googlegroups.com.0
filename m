Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHNTL6AKGQE3XPJOOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF028DB5A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:17 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id 202sf292332lfh.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664157; cv=pass;
        d=google.com; s=arc-20160816;
        b=G+LQs4CsCHIbBo1U69xptJkrnzChDZYhZ4ATxeUxqfmBg3eQ8x5iVB8ZlbD30gMJf0
         I+3YJiTPTuPGRZh7J2wloU0PSrhxHYsb3TABtbHorqoVVsdFzoLJco9PH1XFgjrUMJcV
         U0HB2Eeiy7L84KwQvwyB3uDnnDscdelf7rHYL40TCvnTkt3R8zMrTMZ2xreWu/kJA7yL
         /tAjqL48WmRMnwqsUnGUTZ76oXbUxafnsoG3YFEPi6L+v2BfU/7ZQzUxzoIB8cnOi1QK
         ltHA1m/AEW1q0qGsSC+f00xZJJWIB85MlWyqVPTHJCFUf06UrIhrjF2jXVIEZ0a539jH
         xwgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=/eWrYt7CuquqeMJOtSX3VonBThNylIbcAx98bxC9Ujw=;
        b=He9rA0NFtKB8894ssaQcJmA45hGOZYr89Nb6B+bZ6JcpyRVAjK73TWUOWMpTYSEHVb
         R1V8EPWDicftLclyghgzGh3ISmrq2zNYQTU8QspMaaDJo1CamguFykXzUG6nnNkxKgss
         pRqC50UbPCw+kty55mnQ2mYT8KDHaPFFEaCJ0KE4cQT1PIz4lZkKrEKktVUz53rCV5Un
         LWyqE++WhZgB3I11LyPDxij+FHv1KXF2JmbgQmvCPEVhdYlmFJls6AonW6E/RRJsnJe3
         rc5aG74SdEAMeqjxUIa80zCxKQYHWAA2a9ETpb+pgHZ5NrJl60aF/0uSUWyx+yObRojD
         Wu9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/eWrYt7CuquqeMJOtSX3VonBThNylIbcAx98bxC9Ujw=;
        b=cX0n9Vnr1OSjOSP/DmJzKqUy5CksChOXcnbcgWimolFGBvfNO5Fm0bksO+BSeyDsN2
         DmucgwYVMUOArq1kNUnAYhRod+6Ijk0wGqzqVaFH+GU0j/O88il/iyw5U7SUA+jGowEd
         M3QBot70UcaS03N41Ygc/L3FFiQFdpY8hMFzPIJT4uckmDfeQ7KTIbEgAFdfsn8swzfb
         NApYnYqlI3JX/jW+9AiNWcumSenac2ZEMzEIyNICX1fgc5S0j4nAl3xh7KyYmd0SEZMS
         rvOlVCXhPGNVPYmae4/PqdkWrxxvNZWzzEst2FrNfzPOi4xwmynPEj/ymD6eV4xoTeTU
         DbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/eWrYt7CuquqeMJOtSX3VonBThNylIbcAx98bxC9Ujw=;
        b=paGuPCuPeson0qSAuqUsU7sgTNmT9gmnk96qO6Zo9hrcG67Fj1OcO6CdHmGe+LcBxM
         JkaRQ5Ra3IAwUXa0Jmtvd73sGiShY5QmIMNTElilpxiz6PtWezgPo/gtmQ0mODJwj6a1
         Wc7ZLbn98Gm8ZoEc7pUNQcqnCTUHnyAmXdioz6kPTfcsvX1RiSlJ6rrIQJRP5kjNTUYp
         fAIbF0tsAjXtxBQZ200fD59CfktXGDsl/W7+SEkyO0AMZIdYw8cdjEUXdQUQ5Gn9wxBK
         axz365cMKRndOaCSlAKcHpAJyjjPozUnklUYVsS0tBeejx8r04y6QWRlBfew6gXgMfPe
         dOOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532E9iaagBJh2jmVRvpoP+XnKiqu8TySEi9U41ybuaz3TjavS61h
	QjE1P9LMSEfpinkdoeOSSi0=
X-Google-Smtp-Source: ABdhPJzWl34l4mSo+oxOa6nE4YKhd8NuijOauEE+kM1dMvc62XObkGIKB+DxTnpeSZmt4Qljcsm7oQ==
X-Received: by 2002:a19:9150:: with SMTP id y16mr1116767lfj.190.1602664157216;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1310926lfd.3.gmail; Wed, 14
 Oct 2020 01:29:16 -0700 (PDT)
X-Received: by 2002:a05:6512:34d3:: with SMTP id w19mr954154lfr.180.1602664155928;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664155; cv=none;
        d=google.com; s=arc-20160816;
        b=UWqLxlYnhmvCN0eOn56VWU97uEm4/cV+1Ub304608/ou2pudP1UEZrPZa1W0mcFijJ
         ghhTiPt3jcugBAXQFqXuePgkRyxgYEAaQrRmKl6Bez9An67xQh75wa5EmhF5IjlNXJnT
         TlEyuY62FFWP3VHvuxLp5sMbPDV1YEeO1B7eKsCl2hnR58UiagZzjmj6wizqIRwDCA+W
         l7GZcBBCkFE9W0ar2nlUt7lVey5No9j5S/j08WfQcdAzng9HbO57913dQIRkcHvf5bKI
         PURD6pMR8IJoWSTty+xAZquFqkXIyurNhs8d7qhZTjEA++AUoEIRNfHdsdCHEsOlrlr0
         P0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Hiuwhv2+6qCVRNuoW/q9bmh5uvghtqR/8sUJxs4P2uI=;
        b=urxxQRXid5DdM7MQ06gTW6Fu/HDzXe7A8Kz453l7azfJIo60g0PeASE3sjwXDDhIhf
         xDDpgpxcJh2wChw+pys/cbtEJEaYeJKD2m2eO57K7lIvrbjRttQFjACmoENEkCqwsleX
         yy7x/2HPSalPexkZZro/QbO1I5nkSMTR+uDlxzksROGXIV5wqJui5O6gt6vRjmKywtoi
         g4sSt8RbGD/GAn/FyfHogFdLj6+n0ZBkWVZgQJahzi/MS9P2c/sRAXKxoFvmxLh3K0BS
         yssVvqaGoFTjwhaLuuuNqq5Y3lsa9Y/dbCsf5rE14HYXWiBOscXbu0kxdl3tAIvuPOSG
         CHrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d18si53673lfb.9.2020.10.14.01.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TFML031210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ3002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 17/46] arm64: smmu: Drop unneeded includes
Date: Wed, 14 Oct 2020 10:28:41 +0200
Message-Id: <99cc6d63b27a8465d431ae75a0194c5e30312a1f.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 9c10d75c..349cd0fc 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -11,16 +11,10 @@
  */
 
 #include <jailhouse/control.h>
-#include <jailhouse/ivshmem.h>
-#include <jailhouse/mmio.h>
-#include <jailhouse/paging.h>
-#include <jailhouse/pci.h>
 #include <jailhouse/printk.h>
-#include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <asm/iommu.h>
-#include <asm/spinlock.h>
-#include <asm/sysregs.h>
+
 #include <jailhouse/cell-config.h>
 
 #define SZ_4K				0x00001000
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/99cc6d63b27a8465d431ae75a0194c5e30312a1f.1602664150.git.jan.kiszka%40siemens.com.
