Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHB66BQMGQEFDW26XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059C364CC1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:32 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id 93-20020adf80e60000b0290106fab45006sf5139593wrl.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866392; cv=pass;
        d=google.com; s=arc-20160816;
        b=qCdtENZsmf1DiRmYTMun8XQlyCNapiasRJ0rfY/xPRpjw93dMgvTfONtMTT5QkFb0H
         YMRHwFLuUGUiwGtLf6//NNYeeEAdHbRgBrCClZ+RwN5zmIt6EeMKzv3FbEKz+D2/k68m
         X/YTeWSk1EHG/Pb9e8Y955cZEPrFLF9f/ldbFLgWrZ0I8wOupM78U9/IiO5EvwIOTiUO
         FsDrIB8I/nExUJEsy8UsKoO0nF8VNWMOIg9XgQnrzYTEmArsvTWJZJYIC2QI7OtuWWRu
         6AMnAtikH6aKSaFPKp0JhIpzWiqmRiRcKbYa8phejN7eq3SnKvBGu0RYgm+YIK7ZJkCM
         FhSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=RsRGPGeKcEy9fRwpKby6zGQ4weLLTiJI6DfD9GVYSWM=;
        b=0/h+oXm5o6jVDYenlanMCEQ/r1gawXVsVpsmy6DyMJGCHKuQtiehCwRSoWYhhSVo0O
         NM/PbO0JTv84KolFa2BSWAFtuHHjviQap3PaQ9Eb+revQ+QGkwJYTkUX9MMVSiQyFkyu
         DiTSsE6uyYr4czL1mPlEwnn07U8JrYxcti7nuAHc6wOdoS5Md72QOQrhbBxcQvUxbK+h
         TOYtEQdD/YO9eaKzK9B+laLG7H8syYsUjCcWtDM2YtyZBT5bKgtfS+Wg3Un4V44K3uvK
         HyFXkd41Q1JLGthBf6VC12shV+v/RyXftVUhcl8uQLfD/pglC08M6A/t+Q7UeNP8fDIA
         xwKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RsRGPGeKcEy9fRwpKby6zGQ4weLLTiJI6DfD9GVYSWM=;
        b=sMGgpeRWlHi9JNUdWWNz9wc5VUfn9EOijoyx8PftkIoqXet2ZxWFY1F1nDiEPkBmSd
         c38lJyj25NbJM/bQ1A31dZTuwz+zHHQUz8mHl1k3iulkY6KWZgMfqi3pc69XjtUZeCCB
         f/Lgp6XAyr9RfS1Q7QE2Gn+SzHhzmrufM2PqD5BHnn+XD/+lILFChJVHWBqqtPrWCyZQ
         HbjaiwHy+DMCBz/s5Gjre163AYPcXOb5kGaYkQYo6eeIfND0kjBb5uvURPrnZ2eBnlHY
         xr2sUJWLRyHYJR25eh1KBjYCnV0A2+aPNYJ6ziaVO7t2Sykj1oBQQlC/NleXhsTQGF2y
         RayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RsRGPGeKcEy9fRwpKby6zGQ4weLLTiJI6DfD9GVYSWM=;
        b=hoKtk3QlPgRjhodEDBsLvslOdHIdsN9SHJ7hsVYNdUxcPahdEQdlJA3oZujAZXW4EK
         nWXlGFerxmvVAknPicLfFaBC0WD0OrUBDOKtFcKLApT2AHwXF7b4cNDbzEUa8Nkz9cqF
         Eopk4uZX4kF3MfPup4k3Fzxe6c7N52Haz6rJJd3cMwUsjse6Fvpd0s/57zzYFthV31I/
         u/fkE6/FLZSEdxLtWXilLJd68TJ4yWGmRX8U9eLhwp4HbAstYnXNipxK8dpbQzHU4dWh
         LJG96bvffRAIcFHc/Zi9VqTi2wCvtO0ApQUadxU5ocGDVAcljMDOAjYpEu538aVd4D17
         q+3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GF3uMgdgyYT/a+Uw2s5ilQmkNObLcaQdyTnHzVuleO8g4CjFD
	3V05vanzeyW4a4Y/i+BnGVQ=
X-Google-Smtp-Source: ABdhPJwAGx5tbrsyOXJrvjc2sD5YVtsMFfHJ69PKpKfrn8Orgs0gprUjAJ7VHdMBXlb7DfXu7lqptQ==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr968492wmj.74.1618866392210;
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4a04:: with SMTP id c4ls299141wmp.1.gmail; Mon, 19
 Apr 2021 14:06:31 -0700 (PDT)
X-Received: by 2002:a05:600c:b4b:: with SMTP id k11mr949542wmr.180.1618866391246;
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866391; cv=none;
        d=google.com; s=arc-20160816;
        b=mVnpLtibBBx2Pp+ePyfDV/K4vbJ6PeNa8AY8i7hAciPaJ18CoonAzY6trq3Q6Z8hqV
         qN0pCudaQuALzPdkBoW2qlSPjGmivryGH3wM23UTRN8ECdP6vWjYEWMqJDt5RKSI1wpV
         mPosYyX6gHMV75FpJ0c4Z7BIn8mwFPUzNrTa6vU/XJXD54EgczTGx0DB7zKlGf1OPpLc
         avWQc7qa5neLthn0qBuri1C8x4Zg4TdSt6S/UGEM47SjRi2iaL0oq7I5Yz5cQM5xluri
         9kYy6Ix7hAqiZwdqdR7NMurErnENffdVngSxB/4MT3sLIOndDpiWlSTTPVBXxnGQnIgG
         O5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=PejFWhaEFreKWXpINmzBPs78tIeOFD37pYa7KP5GlX8=;
        b=p6FzeKwvrgYvFeVFsosPpIsMH7nsI58oKRZ4mB0HSHIskgip3+KqAm0JKJ297gp3N0
         gGaQcavCbHaCKD7mhNKrb1bpIR1pt7BSxx9GViwlljjLYYH+nhp711UJJdjCHkxRBuSM
         DbtPFhvP1CLn8sDCx8Y4ur8s9NucCIDwBwP9Vb4tjHnb2440D9RImfS7jPJsqlAkqMq6
         80GqOwk4FMHJMkfk5NHtkC82Jy2Fto6wBIg4DWrgeeW/2VwnBc5in7qpg2l5Mo9GP5D1
         jtrXUk4EHNGQ79PSUoau8awVh4OsGWvnoj5RwnTKlUypUmHjZ8lxBTL1FoYUlFM0H/z/
         kEpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p65si259599wmp.0.2021.04.19.14.06.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6V1K022604
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6TpX015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:30 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 04/20] jailhouse: Enforce selection of latest version
Date: Mon, 19 Apr 2021 23:06:13 +0200
Message-Id: <01d8ee6b5a412df644d97f7483deb84483a8c345.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Moving forward to kernel 5.10 would require so many backports to the
0.12 release that it is better to temporarily switch into "latest-only"
mode. This will be reverted once some 0.13 release is available.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 032efe3..5b0fb54 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -17,7 +17,7 @@ KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE ?= "${MACHINE}.wks"
 
-PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.12"
+PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.9999-next"
 
 PREFERRED_PROVIDER_trusted-firmware-a-${MACHINE} ?= "trusted-firmware-a-${MACHINE}"
 PREFERRED_PROVIDER_u-boot-${MACHINE} ?= "u-boot-${MACHINE}"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/01d8ee6b5a412df644d97f7483deb84483a8c345.1618866389.git.jan.kiszka%40siemens.com.
