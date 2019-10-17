Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXPUHWQKGQEYUVDFSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED5DAF9F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:16:22 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id h19sf478329ljc.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321782; cv=pass;
        d=google.com; s=arc-20160816;
        b=lBmZpNLrQ1Pdh/H7R79TR7zpoaWDenWa4o41MhuQhPlgc75JwpgN2TCf5KS1okH+fB
         FGCuswMoWjKcKUzjkqVnG4ZjrE6vRWE0pnC1PF/caCCjTvY7RnQcSRF33daWWW/7gxF+
         tJqpmiapS1mBCK4uW0iQZ4qShvn0B7bws0QpAEpa2cdV89pdzTilvu7nYee7/H18/rwJ
         tGdpzYwUogF1hjU7XBVcs3qEHVAdtCmWjmsEuphQevYgj0wifufhAYhNnSA7wyUDTpV1
         wzAFyMHBT9d9KDwJFagRdas3e6ACulhCEXi/YppSieP3nF+o0VP2dxDPFwWEoTZLYmhG
         qWpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=KMubMIN6ehlrAUaA8C6vZyHRoldhKTEVwZxW35+9UJg=;
        b=R2KpQJifABIbr3Ktoh553I2xttztnHDDhJnQ0gDjmZh1qgRDCq3fl/xWpV9wEBpelP
         JbZsccAF5Zlrxmz3cSSakMTjD0+OpcwQYVL8UbP8yJ1VM6cHx7lzRdUjJw4BgYXibVEM
         RpepxR0JlPtFnYcURCpY+c3F/Y55cMHuRfc3NEKbCarUMNMviCdESBbb38klA/5QSp5p
         VghO9Unoz39sXqC54VifuBW5LOzspLb7uF/k8pn5ET1GA3kOJ4BXNvBH9e0Cij888vx2
         D71njpvWYkCNmJ3o2TvPHAys1/E1mNxlbudNwLbYingy85imud3WuuiruCpRlJqQK8DM
         isYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KMubMIN6ehlrAUaA8C6vZyHRoldhKTEVwZxW35+9UJg=;
        b=oX//ZKs9WifCLXH0+LSk6tK/KVtBsSQj+DeFoQLZ37ZHBy23AiOIylnZgWPMHs2qGG
         HmhD0/JedwoIqfY07Y6jPsM4n8ndpUkarG9mAfL0Za4CJd5N4RqnnL/bg2Ps2Dkcdjs/
         KWKpNsnYscNe9RHN0w481QiuvkrOo7gpdWYWYQpN9cSioplZ8X5gt+fFXweOW3QJgNsB
         uZ1eXwcR6mtI18NobbQEQ+RA8NisKBbSMgiyDLAlRVOjhUUlAdlkltpehxRFh6v/tr0O
         USWpP4Sm+XtWCBIT0qm412Kzxj74AhX/xKbTXZhl7wTGIvE2e3tDNRuP/RKt+ozUVi9R
         DBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KMubMIN6ehlrAUaA8C6vZyHRoldhKTEVwZxW35+9UJg=;
        b=Qe0l9zXmVl1HwDoZL5G1evqrjwlncdsqWFlYLoUWYNXCvWx8ukI1sMmDkqnvBgXwrq
         ouQJEpir9j+JjVcwfJg8JSburRl9konI8KCbT++Rye98zDTgFkDfNasHEpxovdM0Kdh1
         gK3zVdiI2o7BY/kzyNw3XVyyhynnQagXL92MYwSiohOHg7UzJDroEiRa/RMwxAtldt7l
         PZNwvoUcByeZ53q6DMXB3i7LzyArAy1KVHoWfrSplpSx9k8x0BpqyL0s4S64SbUbmvUY
         bnk/ss17lT/L9hzDGKRsz5FnZ7dnRbVNwK2iikkIcpe21GFLMb6nu0K0iwnD2ubUNB6u
         2VtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXSKyTn4Ic+Vo4OqfqQ01a8N5TxzOn1XeU7lpIM3TrOjndl+8dc
	qTwA70GOkSfpxNtjZB2j1j0=
X-Google-Smtp-Source: APXvYqwB+IGZnM441rxFYNTtJXc6ARVY3S2qWamvvWFr22foFTTmfrlcI+4VKQtmPWYb585uWKwrng==
X-Received: by 2002:ac2:4215:: with SMTP id y21mr2532588lfh.85.1571321782335;
        Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7102:: with SMTP id m2ls236762lfc.15.gmail; Thu, 17 Oct
 2019 07:16:21 -0700 (PDT)
X-Received: by 2002:a19:c518:: with SMTP id w24mr2659195lfe.14.1571321781556;
        Thu, 17 Oct 2019 07:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321781; cv=none;
        d=google.com; s=arc-20160816;
        b=vi3KDxzFqIOTmcPUaSxp2/xGsuo9hq6cW6XROY5bBEjc+k5ZiKhmiaWexHtsZD5pcx
         h/yLMBQ2Cx/3cFhT5OYPGwzFuJBxajmMUD9b097h+M51nk4NvEmjnRVWuK4+c7tzqacF
         eXvLNEgBNrTxfDBS/GJX/gV/V0Kk8jshIKHFxwJhaF6pMRYo6jfMQDdDDW8p8UI85l3w
         8le/Eea9kRKEocDSC5FEtJVDXxCuim4upaZrx0vAfb3LVo4C0P8DIwIVUZut87Uwe1Q9
         75a2HrXzu34TPHT5pdGX3dIoEK5VmKC+wAlags0d146Q5hFOXctekjRXJgqfXeOTQzcA
         4u3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=21hd7NPbe0YPbcQ19qmQGoX/hiQx6IEWb2P+Nlu9eSE=;
        b=Dsy2KXvHqAVHwJN0EHMSodnB6MVPi9tQKGEGG4ySMAB3+Is2vxk6CNj0FaPdppkXrs
         WhA9c0yr3l1sZU0c87x7GWw/knbIh5/mxcvtUQuls/kQtpjN2yLYZPQXeIxAmleT0TLO
         p3MPiPXh4A2XaoN3+k0IUPaxOOuOYwO08qbCVId8FSoC/1LVm+q3qGEXuQC8x/fO87Rz
         Clr28zPAeuGMC05wnTgqih3A7xnnwRRGOxBTrU8aJiyV1DvPi+kg0RqPa8caF/mnmS+S
         03jBRZCJ+wt79D3YLrVnuaLR/rqoRgW2mgUEuQBpdT+7MxXbQXJm4gMOoxwu2Qv4pzKe
         vnQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id k2si65405ljj.1.2019.10.17.07.16.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:16:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9HEGKuM013461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9HEGKgj007087
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/4] pyjailhouse: cell: Avoid deprecated ctypes.c_buffer
Date: Thu, 17 Oct 2019 16:16:16 +0200
Message-Id: <1730359dc430eeab272b84f8bcfb195c5b85401b.1571321779.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1571321779.git.jan.kiszka@siemens.com>
References: <cover.1571321779.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1571321779.git.jan.kiszka@siemens.com>
References: <cover.1571321779.git.jan.kiszka@siemens.com>
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

pylint warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/cell.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyjailhouse/cell.py b/pyjailhouse/cell.py
index 20e8848f..afe7ca8a 100644
--- a/pyjailhouse/cell.py
+++ b/pyjailhouse/cell.py
@@ -27,7 +27,7 @@ class JailhouseCell:
 
         self.dev = open('/dev/jailhouse')
 
-        cbuf = ctypes.c_buffer(config.data)
+        cbuf = ctypes.create_string_buffer(config.data)
         create = struct.pack('QI4x', ctypes.addressof(cbuf), len(config.data))
         try:
             fcntl.ioctl(self.dev, JailhouseCell.JAILHOUSE_CELL_CREATE, create)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1730359dc430eeab272b84f8bcfb195c5b85401b.1571321779.git.jan.kiszka%40siemens.com.
