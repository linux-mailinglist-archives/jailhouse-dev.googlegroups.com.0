Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB57Z4LTQKGQEI7QSIOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666C36D1C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 09:12:56 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id e13sf221846lfb.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 00:12:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559805175; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kd5t1MmWtWKqL+43qxuUAQyc6OwLLKzOxGydZW8KUOaCBd+geZ1Kvr9d1JZkhuLx3a
         zdYuqZ1tkGI3kcsVE2BemKXmH0DQL9QYzrGPHPGn91+A8gcuOVhEwh2KHniuuUN+4eIR
         KCFbna50yh/C7DLElI8qqBU/qARohyhfNvBXPQlH0bMpCAeeO4Ds9P5tc8jVH9YGLhJt
         cgyFpyXyA8cVBbfk4M36/QjZdil/Ihm+4jX0f/aeYmPeNWzI0kW2mTI+O/W78M11HlSk
         vk+CoQWo+wDP3Lzk1o5tRxMoa69luOFRX+pYbkPOoJgkpYFgj2kTuaQYoeYMLjRk0tnN
         tn8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=GGppSnizm5gNjaNdpfTVvEJ+MtWiexM09pVzfTVCaGo=;
        b=aKeR+RAIMpAXRB272HxwgxDzdpLoWAv7l6Q+6HEytTHPv1JDmHVUe3aaGG8sMGUL9Z
         cexmCsJftAdfh9wSrJomYxgmj+rCZHdpDe7eYGfMLSf9L6/YFXmL7z5msAeDHyITKarB
         Y6wbo9g1Nz/NzZ567Rcn3fFY00pczuD33mRQ00H/29jFHgxu398FRlj3uGTp4SOS6p/k
         0toVzaDdmIE8qapGppb4XQFlCJoCLoL/xc4qkbEIRKV7JE3R9rw01wsIfp4vrUy8Iosw
         UvaHCHUGxSPu2Rn5MhuswGeSqkXKidlT4pyCH+NtbM2QysJRgiywkVaHhpQqMVnBwd5b
         padg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GGppSnizm5gNjaNdpfTVvEJ+MtWiexM09pVzfTVCaGo=;
        b=CSjHqxKZP3mPpkr8Gwn+K1mhsgPOu3aZmyVngI9WnkReKMrhta8qrzp+aNzvVAw3Wi
         u9+n5wNA9ko6RX02Afz5CiQkX4Dg19kmutcZaRRN3oTOG7x98AR8NMnt57lykSiOz/z/
         Tt3WJw2OhtJJdLZntINm1KDYiumEsRpyrnpLI7yr2mKw5dryKR4BSvpWlgVAHvJL+MCV
         Ywhr0BIwA/F7TCumjM/8eYfkgb0HUN6zG2UMGLo6oHLOrUHMx8IjJ0KKdd659hn4w4oG
         UFfvMQLHr7ijW7wHgzKu5tqgDtcBqkmJL87nasJHzZlRA906sPYYbvK2Wf1cXE9mUs0O
         3SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GGppSnizm5gNjaNdpfTVvEJ+MtWiexM09pVzfTVCaGo=;
        b=a/noYes/mLsd0oUaLgpDsOBmSvExrBl12Uv5OkmQduQfiFp67o03blvhMq3JptYFsE
         x7mQx+Iwf3D3PqxlIiFAKqLqH09CkEHtoJateRmLmfNlcMxjIjyg0MIiX9R67whKgrre
         rJKyPrEYcoHv14uAHFgkSrEPkzEdqMz13kw1mz6S7idB0P6yDqseCedIEmbuGt9ybyr4
         J70+uV2PZ2/3VDf5ssfAvDUpmseRuuR+kFxovObWH1M75rNo0e8qwNTuAyu+4kXkAjI+
         626hwg23GGoSMV88/wB6wLSwHhTPcxNIWH7uURQVkd6jSTP7LP4PJA9tQyhIfAOfrASw
         hDgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGYpsrSdMI3yB1yPVJivRL76wQZNI+WdtYlcZwC3coLsWDghBl
	OlhBJ+2ZSkd7zDkroAja8Nc=
X-Google-Smtp-Source: APXvYqxkjySLf/v/xZH/z+ok8Z9LUAwWG0B8sQduTJe4ar1U2dkPfWXAhbDJNFUWSpQhx96eIV901w==
X-Received: by 2002:a19:f817:: with SMTP id a23mr9501591lff.123.1559805175769;
        Thu, 06 Jun 2019 00:12:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9744:: with SMTP id f4ls522847ljj.8.gmail; Thu, 06 Jun
 2019 00:12:54 -0700 (PDT)
X-Received: by 2002:a2e:2e06:: with SMTP id u6mr21048092lju.54.1559805174964;
        Thu, 06 Jun 2019 00:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559805174; cv=none;
        d=google.com; s=arc-20160816;
        b=MSQQa67GwLLqROsz4Nv2NrdlnkGQTypjyT8wSgBXPIUH4eFKUo/m7cSOwtiuSU47kv
         JP2Gs4f5B6yKl3IbPrhWWfy3WqbrowvunnsbcUic/pCZjaUF9pP2hpIDccQj03QthTAV
         vMy4OtM0q3hg40HRJt6soFvJYTruC704UzxskgJtCFiLELizJuOsgwy/6omdy730Ksj2
         +gYeX60QkmlNFzGDg74zP/4ZOhy7LUToPqJvHA66fTqUJc0Yo4WM3Tj+XCqntTLKOx8H
         E1+sP5NP2gbXU7SVnQ3fs6QDhotKY7RAHGa8479k7rHteoloKpdXFX3c9iPDzh0is6gS
         oAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=tJJka/j/kv0LSaxh9CFr3OmULaetYeiK2pKaIT0Ewys=;
        b=JrH2j0KKN03Q+Foe/4tum/HP+OeO0c+20kuYuVaJCzmjl7FaSd8jGP5zTvkFPxk/Mw
         fivu5tJAo2vRS4ZSRZxD2PdEqiD8VfpLZ8WpjPM3MyBlahdjdOw5PuXyW9yghxEVkCoR
         8Zg/rZ7hgflz+9HaCQzACnNCVYEdnCvupJx+JMfqG+vdqO22FlkUfh73eRzPE61JV54f
         VlQonti4Pyzwg1KQqyqO4Z4Pd2tXgrNsFsJt9mQ7XOvn6t/q+lsNhQ5ZI69ee7wCbDGH
         hwoav/VdBCGyTASohtydwIe+ZzcI2+4+7/M+aCG00OxkwEA116qFf0dvXMF9WThOf3Pf
         1ilA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id l4si60994lfh.0.2019.06.06.00.12.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 00:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x567CsmW018791
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 6 Jun 2019 09:12:54 +0200
Received: from [139.22.116.51] ([139.22.116.51])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x567Crlp027453
	for <jailhouse-dev@googlegroups.com>; Thu, 6 Jun 2019 09:12:53 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] x86: vtd: Use proper MMIO_ERROR instead of -1
Message-ID: <995fbad3-1ddf-6eaf-de31-50509f80e2f1@siemens.com>
Date: Thu, 6 Jun 2019 09:12:53 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

No functional change as the value stays the same.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index acaf0e03..a43632f5 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -506,7 +506,7 @@ static enum mmio_result vtd_unit_access_handler(void *arg,
 
 invalid_iq_entry:
 	panic_printk("FATAL: Invalid/unsupported invalidation queue entry\n");
-	return -1;
+	return MMIO_ERROR;
 }
 
 static void vtd_init_unit(void *reg_base, void *inv_queue)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/995fbad3-1ddf-6eaf-de31-50509f80e2f1%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
