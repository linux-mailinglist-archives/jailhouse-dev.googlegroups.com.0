Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHMXYH6AKGQENF5CVNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C20294F2F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:24 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id n25sf1294740lfb.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292063; cv=pass;
        d=google.com; s=arc-20160816;
        b=fv2U/HcF8eva8eB1eybLmdRGbw//NWSkgtugAztaq0CBEQfJORknYOB8OBvwWJCY9C
         d+gD0mqq/mhm9NBTLxpbYFumj7DZi7YBNaT778/9b8WEJ4jcgP4YgwqNuH9FZdSf/O8A
         FVUM+J3UedQe9NnlNS9pbfeKR2dVP3aHFz44Bltu5ZUmktRpnrV9/16kjrXbc/h+SDWS
         QThpLIYJULIbrj/F4vueC9/hzXK+Dbb3FscCbOqgg1sV5B4LYyNiUs1HrPv/VfJ0A8v6
         yqXA3Cv8Ff5wWMjQuuyX4ZlLeMVzyix/tcgfG3G4hIDGSYSEaCnBih5Wi+3tkB5kzxYI
         gRBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zTnjLV6NimP/RspgFdV2dNrOZjUxNruUlWedtjizbW4=;
        b=Okdo6v4aSSlF+CrBu3I/J1YYA2/PDWDiVHp0PCsEXRHYFidN5itmKEHqrG9/EJMK8V
         iHPMZOz1s5+ZOwAxgtXKwsRfna7xLRZXhXTbUgw3WuXIY4RYvWqIGpVw0ln4O3wNdgwR
         Wvlbh8Rso5kG9zwd7SQGISDJ7j+2RzUTZ/QOjkzW9J95ZulXoWl0jordWOZcKEIE6XjV
         vvgQVg34jl6G3iFJ56HjNmTfFy6LqIrljXB7WsZ9wnqO6Oly3jRjdMKSUM6CVpHnYd0w
         02XcvzMpkkT9fqwHZAMDvQGdtAu8NtEnSWqxFUcMdOdOsP5GdoL3Cod/JlBSnwLhgi3i
         seIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=aB0yJDio;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zTnjLV6NimP/RspgFdV2dNrOZjUxNruUlWedtjizbW4=;
        b=FWigOzEjBa8G/5PsmCJNxTzj9tYFJSiKkO0dIhg18w6TP7xhGexWBaADX/HYG9+fcj
         TfF//aN+L9kVZWm2IvXUeLYC8ZqfkJTmdMW2fkvY+mAC+faFs/E6M3DYg4mEZJmTDs0w
         0CWHQIRusR5l4lsbjpC6F4A0eSmoR7i+BJ4VGHC2VnanTI4UQJGIOp6IcoPISyVRtpU8
         qvxEzPxmsE0WpekIh3eDSxvY4ygVKXFtVPNZNIzSr80v3H1sYD2yv1MWhPC47P6C2uOO
         qtK7mou9+Gnt1cmZ50OomOf/6PbBsbn50vlZAhtzul06a5UvIlCLy9QA1L7JtdQ0v5Sk
         5VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zTnjLV6NimP/RspgFdV2dNrOZjUxNruUlWedtjizbW4=;
        b=QlRGBybC4WCg3GeGwn8W5FzKhKil3rcDDb7yL0ALJrgz/dM39gpVvznDu6F0CQRwEV
         R/LSwuCLDq7ikdGwhworWaI84vgM1EEpNxledrXvCbB/lXj4Ghy/7IF8/CP2PzZj1TP2
         ilsCNGgHd/W9E6myCS/7f45sqidJ52ulavcqj/tIO2vqVMUwQPiQYmJM2k3d4nWvDZwh
         1Wg2Vs9QfOQUsSy/yyImhzzzi/dyTawQN9NRbppavzpctu/tgm1cGGWRtOISMLaqLUgK
         ZGXda9exk5JTPOQy2nHPqSTKH0FF0gb/ASHq5Fg7jJWx/LY4wskhpAqVK8Zje1V6Jr/p
         Uf/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jb6e+t9BuM8syhBUYzKXt7bzgExVS+KoQOsNRH/neq0R1TMsc
	iZROZYOFHG3gOyhrSFUa9w8=
X-Google-Smtp-Source: ABdhPJyqXkJU9Fe4OmaH+TnLYfbTF0h5+jle9SOd8wnn2lqLzuY67CtYQyt//Wo7b1jxQ1wUrjJe2Q==
X-Received: by 2002:a2e:8184:: with SMTP id e4mr1689428ljg.383.1603292062284;
        Wed, 21 Oct 2020 07:54:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls112107lfd.3.gmail; Wed, 21 Oct
 2020 07:54:19 -0700 (PDT)
X-Received: by 2002:a19:8c0b:: with SMTP id o11mr1440717lfd.479.1603292059675;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292059; cv=none;
        d=google.com; s=arc-20160816;
        b=mf0gh6LqlURzMojKA8OL6zPYuFy2r3ZBDiLAwWvsld5BgXoHDA/gzZUGqhCWIAfhmJ
         uJ9BgsYyL14H4w4ngutfloTvYmTrGyggppmjWev3MUWI94U7P0WkiPzK5YQlWslN7JtP
         83b2d5unzGZ6/lp9on3dZTPdf0+/CBUPNx5FAd51Vay/m0BAM+XmQVk+JXNGFpS1iWjN
         jxFX9/qp3LmLb7IH59jUZwrstk9Kwvzj0YObhq9361bOQMrKgJCfVaO6lcd4ZghnYkUr
         SI6P1w2KDXE+iqsNNkDU/HfdjDgvjV8EDOxRKWoeBgMqEa2Qtn/g6C45BPYFlu8VEB2s
         zB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FnovdhNqGCh2lz1+iinZT/X1CT4fnvoe+ZinLZgRSgQ=;
        b=s6GDXlBJnHDN+BSVwALp9NMyry2ufHMI418ApP3GMsNGwSvWI/rLEF5waPMhrNu7F+
         b+v6ue7fJGgNNteGRFxi90pug0/+zOBQVIqSHX1lV1PmTFiUhIvkifHSXWN0BJkZv64K
         Pp24qJGFhMzYE5aiq2jqf3+gJ6MSnP5y7h7VM/Q9V+Nger03t4HDB7TavCoqUw3Fev1z
         ke/J6C88fBy9i2qI7NH/J/8bGjT8PcC3tkjWxOpTN8p1Z88OHyDSinL52K6Ddc6fLZXb
         v9foiV06gEKDSZokNizaxMlNKd9PgLM4u4IKbc4Ll3ICK4AaLPVZWawnpQiZPe4z7Yix
         I53g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=aB0yJDio;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id r7si58040ljc.7.2020.10.21.07.54.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRZ1N3CzyWs
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 5leNJBeri42q for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRY5DJDzyWw
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 16/26] x86: iommu: Wshadow, fault_reporting_cpu is global
Date: Wed, 21 Oct 2020 16:53:54 +0200
Message-Id: <20201021145404.100463-17-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=aB0yJDio;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
index fa50c2f4..1ecf857a 100644
--- a/hypervisor/arch/x86/iommu.c
+++ b/hypervisor/arch/x86/iommu.c
@@ -34,7 +34,7 @@ struct public_per_cpu *iommu_select_fault_reporting_cpu(void)
 	 * Save this value globally to avoid multiple reports of the same
 	 * case from different CPUs.
 	 */
-	unsigned int fault_reporting_cpu_id = first_cpu(root_cell.cpu_set);
+	fault_reporting_cpu_id = first_cpu(root_cell.cpu_set);
 
 	return public_per_cpu(fault_reporting_cpu_id);
 }
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-17-andrea.bastoni%40tum.de.
