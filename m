Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 260AD296430
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:35 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id c10sf999830ejm.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389515; cv=pass;
        d=google.com; s=arc-20160816;
        b=gJOXY2Q8BivSZnmrdMpqm1Nf/T+fcjjClwHfu9hmRg5njKRewStH3SDwW2OADXTLHO
         Ra4J16IZskCbEWW0DdlE2jrl+K9b/r5AWGk6QhXZsDp37g21U+fGZlgOGxacV8mJgqpK
         3B8zfolia7Q5rPn2Y0tBq4IsqiwiH69FxvMzQbRb64zPw5vf9N+mcEKqzRhUbsNN0gjh
         pYLOEmZY1pOryTJIkj1RMtQof4Xh4RU/+c7q4PT25zduB1pv7LxqQTcXzDAPGIBi9ARD
         775MlxEvu2INsqFDv6kdDs2iVvd7XprIwzm2c3g/MR+cuFz0D84PKfOkZVP2C3/TnlbG
         T7YQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=IL/bNE9V94SV1RQV37Dmvhx30ufrnSXKXmk2cTd6/AY=;
        b=dwVX7QH43mwBsEdfWEQo6IcTqyHW3Bx7gKZHJg65zNGi6dpqM0dlMZFJ97hihH3co7
         p5MsBLpbL4mcp/c0DlbCxn1Sme9tVKVbkLjBmKT2F3xSsxxsM9VkR0SvxRndbPWkG+0y
         S1bAacOaTqpOrKyMLgs2T82fFsloaHWl/TJRwJHppTag6I2UwvTXWLo/8+VBz3qV6gGc
         r8ABXuoQQMOT10v6EIJeexVAQOGbJ6dfpPEoZjh0OwvlnLwTuo6xJ5zG2CcJdIFYPDew
         8gvw7qHUc7ACas4vhmfBy+qvQF/CQDUTVHSJWfOS9g019mB/BSP+maZ6dgbnLWBJSgfp
         V+EQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=KNZfaeif;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IL/bNE9V94SV1RQV37Dmvhx30ufrnSXKXmk2cTd6/AY=;
        b=IEm1PbNw+Fb4fkAX4p+m2dXFINc/Z+E+Y/ntpGpmz7+iW19qNUC7OXYMzEEomZMk84
         Sf7hKMOIGuayP8tXu9I9DDxQp6h4twtPhlxTOP/R5E7UK/G3bxZkEhVMD/BVU1eJuo9b
         K534AQZRC2ZqcN2knVvSU2H25PpQO6JSPIxiamBSVgsk5pyloXjgCbM7mWVA0+bAq17i
         fnNtlCkbVmZehK2LDQmdzEzjyH6UkM40AsJ/2z8S89wXBap/UsxU/CR3mjV50GY4qotW
         j/cVxzFwPZ1Q2Dm0ED4RCShk+VKQVnuyQb5X9o7Qb5plj+TKCJJmiTBSz0rWvNNRJYZ3
         XcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IL/bNE9V94SV1RQV37Dmvhx30ufrnSXKXmk2cTd6/AY=;
        b=Xbgaab93okXcuykpCWAuq04CjmYvpx7l2+d0RimqhJDbkF/O7ftg7HYhueCTH9IpeK
         hgZpeD59XQriNI1GjlcinX8tULCGCPSz3UpFdvmJzKOICHClzD1s25g5i/22OwLKc+gx
         3o9dK6UK/W6qPqnh6jGSA3JDLR7SCjJvaUWL9X/qKkiUJoJbIxuxDmdNh6ftzXtqXoNc
         PeZHYPLRddL1h0MVF+TU31yG/N8BAzZwSAGetsOVNyPnHKhjiQXfGZx5rlC2oEO5T/st
         99afwGeCoL1LSaBQw6E4C7OPPcUdRXZXirGaV/tmy1S5SCIGYdkPshbXT5X/4v23XWLS
         jTUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oHy8dr9jjhOrMJe0NOCQUcFUetjRY29n9jTMu6w4yHpuqta+5
	U6BbCoiVOFu2nqjQWUNX+FQ=
X-Google-Smtp-Source: ABdhPJwl7zSQXNYrCYYil9AkoO3uczzsZl4PU0IATbvNdBkND2alHuTwclRuo4tqst9W2W3xBeL1lQ==
X-Received: by 2002:a17:906:444:: with SMTP id e4mr3719596eja.218.1603389514818;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c04e:: with SMTP id k14ls1174223edo.1.gmail; Thu, 22 Oct
 2020 10:58:33 -0700 (PDT)
X-Received: by 2002:aa7:d30d:: with SMTP id p13mr3349881edq.315.1603389513610;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389513; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrBfl31XA0nhAijuMUzljZ6kyhQseWMTMmqizmunKKkpKYnOwFK9VgbAcj59J+gref
         bLZUKQEbyJ1ShpZL4oBlTIUPJD3Qqnn6ollwOApSGLrEPNSNPObQweleM9VBPKu3+gfG
         PxaGuNd25W/lLXSht3kK3k8vW3Ek9x7NKKsBjIYukN1OI2w7LueT0UdQEEZBhQKUw0K3
         JU95T6CgymIdSxw3gOwPzz7AFFBScH/JxSDD18aVAxJtWPuryQUcTC8A/vmeH5vN8FsV
         F9Xt9WtfGPIpvNibb51LZ1y6yMFI1Jct4ZzFz8eazi71EZmL/rXcJ9c5S2BgcSqTFfBh
         uwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FnovdhNqGCh2lz1+iinZT/X1CT4fnvoe+ZinLZgRSgQ=;
        b=GB4qP3k211JReYBsWlami2r4DKXxZ3fj19f6vzkFwMD5BKuDLolV824sNoy0FEbUSs
         ruoUr3S/3I/vVCmK3vuE4nYYSVM+f4zXvQdJyDUgX96edUnf54FUiEasRf/98PusD+kY
         S30lCOQAUwuGhcQoZ7a+SSLW1YJWhEYLSQ1jz4zZMSctx7Whok/CzuF+8/S3jK78lbLz
         K8THUOTLvytkcQNqfga13gx8H0h3EymhXj4pImSb416fmDma4A6Jfsn8+rtSO/j+pjWA
         bjRha4woFSJiAwPt1xqdvyXCZMaVo0N0UJn6KQ04Ve4Ir8Rw4ZydzqVM5mCwE1wgFD7U
         Wapw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=KNZfaeif;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id lf25si89624ejb.0.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTj1p2VzyXh
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
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
	with LMTP id hbGidPHLv0A6 for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTh5dy9zyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 04/33] x86: iommu: Wshadow, fault_reporting_cpu is global
Date: Thu, 22 Oct 2020 19:57:56 +0200
Message-Id: <20201022175826.199614-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=KNZfaeif;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-5-andrea.bastoni%40tum.de.
