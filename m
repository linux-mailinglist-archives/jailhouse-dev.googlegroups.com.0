Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMFE2XWQKGQEO44PWAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 29566E6190
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:15:45 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id p18sf1347448ljn.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:15:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572164144; cv=pass;
        d=google.com; s=arc-20160816;
        b=HZNtGEGDAdHcj6qPeAPFl7Nyph7OWnA+yo9f5u0AQ9kkd5r/x3CeyXBbSwU+BR25tc
         LKPdSp/5CLI2xse0q8/YeAa79aPmTESDPm9dtRSC2eMo7S9CDPOU1U4Rykvs6aqqpcIg
         NfymrT9eCYUu8HFXxieAjG7erzvbfdFtgeZenwDpl5RsdOT0gXGVXWyeU6GLcNoS9Ds9
         api3vN5pXgY3BYBWg4t3TX3J0YrHlEofPXPDhVbIi7/AkT4UR3B0WNY87khTbv1UKNxm
         yndhZiYo6VUHA3DJl227GzvtOSaVyBR63NChyk6a7diPWPYWciEMN//7BLW0b9AUloSu
         IVTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=FgJJlzABm1spaRS0hfIPnzp7jqP9MYiSqmfHqWg20FE=;
        b=dd8Bd4KizguvoSczzuKctEY6Ej4+5H/07Re3L2oe4cekT7yFTZGZ+4ovcWyB33D7R3
         ERfhsh9+n02q+DkNaGMS+DkKUZ2TAjZNAFpGVp/DQ7HawprAHh3DZWa5zd0k3PZv3Meb
         nid+2MpyffR+jaISrk30L3Y7jV5/FXFH8v67upRGSrqOwSIihO4VzsfrPTZHXMgFaG0i
         dLkFMJd0g8ovOEI8jLWtiuJVZFhyKF6U3HeT+vCeRcuXk8mBV6Kax4rl9Jxe14bOu5Za
         z1zxsE0hez7eMYROUz57tDDFYNXB1x6v+a2xfdZqNtpJPfJQG5DmmFxtU0jT3UTsar0U
         ZmNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FgJJlzABm1spaRS0hfIPnzp7jqP9MYiSqmfHqWg20FE=;
        b=nXqO4j1+zmOB2LUZVQNLhDrNkG4EpMuqFAOCmUBI+lIBS2zgSwa/sDQxoajeaXnTCi
         iabFGLpDO1PFVD+hl2VKAUit1bKPUXdwueOtQfmIaDuaMkOGSup6VzzcCyRvWy4aWRVu
         aEaKWGg5/VRrfjFjVOVgpmtIr00vRlpggXdfc/oTmvEbiUu0LxUzH0MrA0NZ5YCNdJIu
         bu2SDoQrFU/C2m8p34VmS0A9Lqmmn3wMXqZ5k3WQL4cFl+QRV72bjHLD/tZK1q3C5oZt
         VrjzvYSWINks8g6RSym7SbV+TkQWV6gwhu6iMbjVdwqEisX6h+3uv0AxPTpt3BmFw2EE
         5kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FgJJlzABm1spaRS0hfIPnzp7jqP9MYiSqmfHqWg20FE=;
        b=VF3HNNiBweUwyqjITOxeKPZ5k1V5YpiCx8fLHW45xBeDItsagDuYYJn2udvH3mv5E7
         Ck4NPBHleVFOhU5g8NLWXmkZQ822o5VaZ8/BHwZ4XSgAlVW+az80p6/DZvIUZEM1qDUV
         N/gIJvP+ufiWTelugzT88OW8qtY6daut+cFQkZwfH6GRpwj2LoY9KY7XpfK8N7bIX8H+
         wkqSNvMhqI7tu6KCpctP/1tk55tVNfZCBqZBcZnfcLkr13DyU0UOKuRLMfkIMnXd3ayw
         xjxDup3AVNVl9w6eHhASalLnNzFGI4TN2d7kcd8+dvJfK2vyr1N1AD0yErD2w/R1hfzj
         dv+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUX31HFK4eq7GDmY/1Sw7yjzlS7i+wwHqePQjsNnDYgWI7t50Iq
	TwRFInGK0v5QiMXVBlU2afE=
X-Google-Smtp-Source: APXvYqyaVygw2T2qj/NqkUOjwoD++P9mFLIzlRS4bldPgVg01mDjA8nF/RJY5XFH0vIn77Ak33qXTg==
X-Received: by 2002:a2e:9d06:: with SMTP id t6mr8153960lji.253.1572164144701;
        Sun, 27 Oct 2019 01:15:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f246:: with SMTP id d6ls1329433lfk.9.gmail; Sun, 27 Oct
 2019 01:15:43 -0700 (PDT)
X-Received: by 2002:a19:654d:: with SMTP id c13mr7641045lfj.30.1572164143807;
        Sun, 27 Oct 2019 01:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572164143; cv=none;
        d=google.com; s=arc-20160816;
        b=ErdpDodUFasr1fAUUXEsoTv7WmZzZ2J+y9FyvTmk0rLAZItqDgzLVTsGRMzQy2RoF2
         JvqSE1AzcjOGSoO6SBzbYs60uIOIXETieKwxcZ0mzna3u3tOEQKfgY+6BEmKLJkotc2/
         0SsYZlHtYxqlUpJEu24knxJ7rSg+5OnyvyE8WwWs4XbI8jh3Lcm4WdBwiSWt4RWT8D9t
         bM14vQZV1i3wflgEXm4K63X0HZ0k0jO+dYh1CypaSmrudg/v5rpTh67XBB5g+Lf8JPUl
         yQLSGMmo8ovI8mWNHe/XVyid21FQo1CL74UfYL+axfwsTmJ0qEf8zeqnCgt6SXSYmj80
         srFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=Yyc/kNQbJWSRfBBFGPBtJOZCz7KppOYqcQYF/YA88h0=;
        b=YQb3xQa4mfx6RCHfz7DLl95ysfzr/bRaXJsmO/gO1eGnJWhWQ1nZBuF/AnuRzfgpQD
         tDX0nVZ/yO2apV8xDuw3MfTcCInoM2oKpZsZxtzRndB+Sm4jahap+RhyA31+kNyYND8k
         ArihN17L6roHtjODaQnopc2gnAfCUA53LxMqV0SsaQDohfGDLH03WdaUJzD+93xlk+oP
         6gDRCLqflU52EqKv5WN93Fzh8S32Cd5Gyi9uclH7wLXSzDASVNWwuAO905LMMMZ2N5I4
         VBhEGaBO/20eAyVU1rLgkiKS75J3vTH1+5kacDxLy2WxexO9TF8CF1GKeRrLOG3RVs+f
         CJfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de ([192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k24si297171lji.3.2019.10.27.01.15.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:15:43 -0700 (PDT)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9R8FgYM002878
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 27 Oct 2019 09:15:42 +0100
Received: from [139.22.33.136] ([139.22.33.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9R8FgwN026468
	for <jailhouse-dev@googlegroups.com>; Sun, 27 Oct 2019 09:15:42 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] tools: Clear KBUILD_CPPFLAGS
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <ae2d345d-2662-e72f-a50d-412927d6b200@siemens.com>
Date: Sun, 27 Oct 2019 09:15:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=temperror
 (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS
 error) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=fail (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

Required to avoid that any settings of the kernel leak in. This breaks,
e.g., arm64 with ARM's gcc-8.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/Makefile b/tools/Makefile
index 08fd361c..c7dbc734 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -22,6 +22,7 @@ KBUILD_CFLAGS := -g -O3 -DLIBEXECDIR=\"$(libexecdir)\" \
 	-Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
 	-D__LINUX_COMPILER_TYPES_H \
 	-DJAILHOUSE_VERSION=\"$(shell cat $(src)/../VERSION)\" $(EXTRA_CFLAGS)
+KBUILD_CPPFLAGS :=
 # prior to 4.19
 LDFLAGS :=
 # since 4.19
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ae2d345d-2662-e72f-a50d-412927d6b200%40siemens.com.
