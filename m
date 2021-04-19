Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPB66BQMGQEOQWJH2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id A898D364CC5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:33 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id w14-20020aa7da4e0000b02903834aeed684sf10091532eds.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866393; cv=pass;
        d=google.com; s=arc-20160816;
        b=OyyVT7wBtD+jH2cpJ+v9QZWFWWFop1SIrJErg2qyfy1m3bi6Fdb3UcS7D3sde6j+t2
         spjA5UBtM2Q8/bMtj9F/dp7+StpZVZiBowxLls4br6/t47lbwZKO0U7/kKr9wlFsm1Fu
         ZjpeSuMDeQX4fYfjWI5CE9aGxVs2ZtYO2yDQwwe1CxHAWuXklCrc4OtGJxUFjL+7imPW
         WPZXOHF6MigzZWS3JynssHVOAvB7MQh09AUuqR1r2lKh9R23IZmvSQPcu7XrCs95gV4F
         slCetEbvkXQK5sIF4dUhKW23uUQLxy0JUebFZjFgNoUkVt698v/mtd3NJFwgUmKkXQrj
         GlrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JvsNNvXeketrt1XvrdYE0elMqMAV+rrMDb5+SUNyCfc=;
        b=gsARBD0EODuxZCIoA+l2Zv5uT4yayz7iXP46D44EEswjXKxQj0glXLl3nVp/QaJzym
         h2NQexYxmYLSIeIwy0ubM3MtnSj/Ex/O8n7oLnC6rANsqz8+9U4Vg+Gv6e1I+V1Iyvrf
         pgygVE7mqEQoz85b7qEWPWaCwDtpiMlzYTRBPqIrLf++5r47Mrty+YYDc6L1lB8lWWQX
         mUz3isPT/g8rSb8IjLOQF2cTx3Qz62EtXlHe0RUNUX67o8Np0TQEnUdsevvuNU8Mg80n
         9NVKF+FnTwAN+M9on8Ak/pdCBzggA7P+Q+71KPej2+oxb2PpcpUcMVPCfj5mLhGtDlEO
         Pi4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JvsNNvXeketrt1XvrdYE0elMqMAV+rrMDb5+SUNyCfc=;
        b=AAuAtdZVO5wK3IbpFfyZIZu+b3Mt1bHEmivEF5W7/Jr0ltjiMbl2S4XvxPGBT2fV+s
         suuQbBR7c7o4VgSqPRlzf9KtjsR0FHma8eaW/NtPrhNDr83HeANTMhkuxVXkL1MGx63I
         cB2YnfavCNn0wBdkTnBd48OQXDJe5NzFCP8rVR5UgYjUlvuUmsdKkr+bT6fLy0UVolOS
         NAJHXmOeeGU4TamkttXTc+tubsdAIuIR0P67tkRL0+1Wh0xxK9a+LObnh6QL13Ec8kaX
         FBLVuaZEBc6PSMzwsNw3so4RxjiEKL9AGXtXlKZZgk7hLfc0W55UsZwNn4hVF4Yegmkj
         nnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JvsNNvXeketrt1XvrdYE0elMqMAV+rrMDb5+SUNyCfc=;
        b=pNZziHpNM/jxEIpCITqaXQ/RoSq2ku6AdTNJmU21PUKRdTBoyXFSJ6G99agPKa1il3
         8totn4GoS7gyj4C8Jd0Ff8PO+TLkIbo0y0O9utWYVU88DAKTSWV6JFf2HU5cpSHPpwNJ
         qBpNN18h5GQVPQBAYQZ15CQercq3Hn2o05Y/KMQqHZmhB6D5xcGgoAKO6zUwqCt8P1Ew
         3Y4iBFWbRNfdnJ6lM+YP/yBofb8qiUZT4jizK7Po+n52zkxP5risz+vKZaDd/uHC52Wc
         9qHXCLcki/8ywcRRc1lXDHj2CnkqohifScJeoplYrqzHh58u31+W8p9QzJkLN/HBv+Mh
         Ep8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533LOzT5lOqgeT6WPLlDaqNGRZcLZkgDpmGzVX8ch6KR4rvoE4gt
	7Yu65vpE5Du+SdJIU2+8jGE=
X-Google-Smtp-Source: ABdhPJyK4CIxUMrqdBcMJoeRf4xkYU63HverkumHAFkmQnwfg/fJvcGbE5whRQXaAaCC0d4xVk+KGw==
X-Received: by 2002:a50:82e5:: with SMTP id 92mr27990548edg.141.1618866393400;
        Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:b07:: with SMTP id h7ls7915482ejl.7.gmail; Mon, 19
 Apr 2021 14:06:32 -0700 (PDT)
X-Received: by 2002:a17:906:c419:: with SMTP id u25mr24531855ejz.332.1618866392415;
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866392; cv=none;
        d=google.com; s=arc-20160816;
        b=04UxRFqh0DJmUoR4l8X15cY0Pru8GfssgtFnovVSCRVPN7xR4ydP1e+lzc2KxwdWpf
         eISgVmi3ehWjX9mWz1WL7eHAjQfv8E9uOn8jVNNYHiiLe2Yh/Yr3jV/lkkedme5/Xy16
         OUMN7xAQf2uZsxmmdcWYZJA1mJ3y1PV5dUrW55ConMu5N0v6mRWVBO5v6QWttlbti2TF
         60tIy1FI6lfdaj//zREPq77X9LCf5fysXxRNu7VrwD4+zJUIaODuyYvYYXLH1qjVndXO
         lqLUaES8BeZDXBi3qs78resmws73Hi8PjcHaq0HFvq/+5aFlYE5UfRjW4AxBftHQiBer
         Sl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+QzTTRIVyKXHJ8ubN9HZwtXiOqic4tL6qEHBm+X8wLc=;
        b=RJZwOzHa8XkNm+/h0zRqNpiADP1Ag7vRv/hGEn/uj0U1z9vQep3MsX+qASV0uSdAUj
         1bolF+8cRepQGTh/4os1UgS/ThfVaZhsOYa8XZVEpZogBz+xjkrM+q8+cCfrcDX6pxJI
         TUgRFrT0Ml+kyQCstVKXml7avEtXKAXYu/8/0lU8d0z1dv9AR2TY0mXNAWz29dr2rUTm
         vejCXNnMR1SE8p2VuqzVCngQ6Le2EwMxQOpVUR31FRyt+HNcaRWZz/RddywUOReoPqrH
         HsXF7hnJdXPq4QUcBZDvRRqUKErg0wVmpzgjk1nof4wVGUkK7AQzLOoPBNLPxnEvic3G
         xQTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r21si1169397ejo.0.2021.04.19.14.06.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6WOQ022122
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:32 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpc015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 09/20] xradio: Update source and firmware
Date: Mon, 19 Apr 2021 23:06:18 +0200
Message-Id: <5ee849ae9f26c68d8ceca62af83467488792f40c.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
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

This will be needed for switching to kernel 5.10.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/xradio/xradio.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/xradio/xradio.bb b/recipes-kernel/xradio/xradio.bb
index e3f3d06..23d9526 100644
--- a/recipes-kernel/xradio/xradio.bb
+++ b/recipes-kernel/xradio/xradio.bb
@@ -11,15 +11,15 @@
 
 require recipes-kernel/linux-module/module.inc
 
-FW_URL = "https://github.com/armbian/firmware/blob/7172b4b6608b131cbd6c60253c78a231993beed8/xr819"
+FW_URL = "https://github.com/armbian/firmware/blob/aff348fa9eef0fcc97d4f2bb7304f0862baffc20/xr819"
 
 SRC_URI += " \
     git://github.com/fifteenhex/xradio \
     ${FW_URL}/boot_xr819.bin?raw=true;downloadfilename=boot_xr819.bin;sha256sum=6583350b3eb12f70fc6d6081426717bd0019b55c6558ffe820c1548f0702bb8c \
-    ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=4954ceb85807959c42e82c432109455bd9eabe95971402299a16d77ddd7d79f5 \
+    ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=fb81436ad7cc0876614a2a9c2a54c5a93a75315aee164e3a3afe3db80842a9e1 \
     ${FW_URL}/sdd_xr819.bin?raw=true;downloadfilename=sdd_xr819.bin;sha256sum=84d3fb3ca8e5d25a0c113a5063bccbeb5b53da230a0afa236b5b625f37db5161 \
     file://debian/xradio.install"
-SRCREV = "502489a9389ac7118401dc7271c56d128376e191"
+SRCREV = "6bf0e2e21c80456e2a3d4ad1267caecde7165871"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ee849ae9f26c68d8ceca62af83467488792f40c.1618866389.git.jan.kiszka%40siemens.com.
