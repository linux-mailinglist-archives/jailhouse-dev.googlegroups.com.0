Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2UM7HYAKGQEISSSTBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D613B585
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 23:53:30 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id d8sf7101483wrq.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 14:53:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579042410; cv=pass;
        d=google.com; s=arc-20160816;
        b=GVC0Fu3uCMw/c5/ReZWL5Z9Yrk8mwnY53RzGkPUkvhiQRnL2FlP5q78mFgsXiK9DCa
         xTHiI1e9GSjrAlwzQAex3RJ1HC8uwyOfs0UULCEgqBIkF5SDdzLKqHmKmH3cmrhYzyN8
         PAnNG0mYLu2/NUX+pi2WRtKEawRBnWxTiq91VhV8ruP+l7F5jzhPZZhTq8lyBWbL9CrM
         6ff2lqBQYNWfUJ7nOd3cwMvKyFMVTRnAVrpE9DugO7cafLz899NQidwEhmpjZqNPYCHi
         nobT0GpmadC0UBvZJjPKWgMyt1jE78jGUKZmNFnAFuNIUHVXC5rP4GtiY31lX7qCiDMY
         u95g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=7tyh0x0gWC1W3l3QWLGXpj8U/Xr7eh0OWg+61Eo6ZQc=;
        b=RwRdatiuCewQl9ZZ5WR3vWe03Rh+fnEzHDpPToBVp/keO892fj7OiMu4EnWCh2vYZq
         MsRjPXZfiiTjGfm+y9tI50wkdCwY9q/5qkIZN6W9QiTNbzGnojPHrIQcFx+SFh17yqWS
         GSa5MJiDXPzWuEpGSuL4h9zEfvyNJQxRLZqiBjFjRMDgp9o0DVB7KHxbSqJF51CjwWRG
         eCQzO2qoEyDR78BxidmQNDpewCBLaExz+JLEKf7Qc2YHv1NmVu9QRT+0BTmHBE4jQZEe
         KOdot5H3ZGigiTaN+DaofI3Fn+qYG/gWz7WkTW6phNkJGPZZtIcFYUOG5zLQ4Y6vQLFM
         ow2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7tyh0x0gWC1W3l3QWLGXpj8U/Xr7eh0OWg+61Eo6ZQc=;
        b=PWAqieGdNlxugB5cErdLgqluIwroES8fIVaWRSl19lQGUb57wGSNB+PbHl+nDNfosZ
         hlwcyyjWrqk1zoCwVaoi3MZzO/8a2N2Qf1r57xA+/q9SFkCP+gRSee65DoJHo+9ZXE3R
         Xu6LQQFbttM+6Rosz6h2ik1UM55j+F6IpFYO+2j/wAJgI/Tf/LqNmc5AG3c2p0ja2Bfl
         V3xxzjBVANLRMNf5Ryvsvy2SpkNU+X+0cfbHULIm74ThejL1agHB111AOxJgzYPFjesr
         YxFsY6l8m916dsbU1QK7Jsy4jQbx54SnW5mBjJ4IBrVbusEIQqFG5eEp9nSGzqYS4aLa
         bRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7tyh0x0gWC1W3l3QWLGXpj8U/Xr7eh0OWg+61Eo6ZQc=;
        b=qg6fyYuoWQPLWhkrA3vt3LBf13VNMIuDq+75foLdAq91sQ4oLpktBCRtuaqEauAMq5
         sGvREwBTulhWeaCKdP+cOLxmeTnwKpbG6q9TKIJZ7A4LVCVMFUEN4X/HIWI7BzYK/Tcv
         GHh+pFkYQiHk2izasI1eHX3q2UtigIY1nnh01vpaWZzM8Ck6YqIABbshDQsOsrt8p89q
         vCUK94WjrZEleTsN0FVFv2puEQ8r7SHnHRuptDXWAPF+467VjXGbNR9NCWU34svg/y2e
         KcTCnQd06X3uNdLmcYpACirKLxC+x57VhuBxcqNa5btUguxm5J/GelF+ni2/CVvVMXdd
         RpYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2eNHv+n/+Os4xq3U4xn/swww5oHHlXf24m1Nxmw1DumRiOu3w
	y1iQXWumKsTHKg795clM/Vo=
X-Google-Smtp-Source: APXvYqwJImcYEKZxq87aTbzzBCb8YjrS1oA3HDO2LrjNGGR/saxRx66pUuBLXCL6H5tyOp7A0c/+vA==
X-Received: by 2002:a1c:1d8c:: with SMTP id d134mr30661615wmd.16.1579042410502;
        Tue, 14 Jan 2020 14:53:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4fc2:: with SMTP id h2ls6276761wrw.2.gmail; Tue, 14 Jan
 2020 14:53:29 -0800 (PST)
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr28004305wrp.378.1579042409840;
        Tue, 14 Jan 2020 14:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579042409; cv=none;
        d=google.com; s=arc-20160816;
        b=IMku8QiR56+sLUBfhmQaNJvNmMo64T4YIZJy0oFyB67Y0FbdHmybL8o1eZJITTs6SO
         8WN3ierJTHFM8Mwd5ZNqtgx3+gEzpgAbydSb7xnzApppMh7Jdrxu57jiq0wRwbzYs6ix
         P2TC/iA4zhARzr3GS+vPPV594KBoNu2QfWALqMBQ2BXog9Vbs1UsEWx0F9bgtjZo8iE3
         026bTWLPYkaVnJlWF+FObjlOxQW2PMxJfzJAyLzHFqbZ2OQNncs63EW13UGwQ29rYgJE
         mluYJ/+IS7SWNs1F1dSmfE9v8dGIahBt8UESD3fUvfdjXBy8t0Qm63Z2fUkyQLU9Lt/8
         bqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=EGfCJ6MVLc9eTIMffaWyPcxRiFyhejyoVRz6KyoCTvU=;
        b=ycQ/8btiro8V6ewBDmAc0J7L2J3YxBPnipJZnskhFukKoC0CIxFvhM3LBgdWy2gwqp
         cCN2eOkUvd7ATvrkYQW3afm+NniUtox0hxJEtvRO7D7/HogpFMbEt84eiql72t5McsF2
         XYddAUTTWynUopaxpSLWgA7tIzTUyCY4bjn7daKSgrNzjgk2NEq2JHcAs8/fZK22YLIw
         u+nOKgmIWDTc9i2x908GHOCzsnvavLV7B+y76S7ePuH9aEtNbmXMBSgBzaiXa8IFPm7G
         lBT4sHTitgBmitoxf4sPKsKrvTKtJbCMrbPNDAYawzkixycakLe0wxVHgGDHIrcosQCl
         KtFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y185si135039wmg.0.2020.01.14.14.53.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 14:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00EMrTN1003377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2020 23:53:29 +0100
Received: from [167.87.0.153] ([167.87.0.153])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00EMrSuf032022;
	Tue, 14 Jan 2020 23:53:29 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] core: ivshmem: Unconditionally check ID range
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <d07cf3c6-d1cf-4532-bdd1-aa2a42886841@siemens.com>
Date: Tue, 14 Jan 2020 23:53:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This check should not depend on whether we are adding a peer to link or
starting a new one.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 189dae6a..613df1ea 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -411,11 +411,10 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 			break;
 
 	id = dev_info->shmem_dev_id;
+	if (id >= IVSHMEM_MAX_PEERS)
+		return trace_error(-EINVAL);
 
 	if (link) {
-		if (id >= IVSHMEM_MAX_PEERS)
-			return trace_error(-EINVAL);
-
 		if (link->eps[id].device)
 			return trace_error(-EBUSY);
 
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d07cf3c6-d1cf-4532-bdd1-aa2a42886841%40siemens.com.
