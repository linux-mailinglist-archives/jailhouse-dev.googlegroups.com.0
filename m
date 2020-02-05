Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVUG5LYQKGQEEVZZESQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806D1527D6
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:55 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id z17sf136565ljz.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893015; cv=pass;
        d=google.com; s=arc-20160816;
        b=RHup09DDVUZQROuh+4cS80y93tf8UjYNPHijS1Yndy3FHVlV5tkBT88mDwp+bJsCYT
         KVO1C1gZwvEgDlzm6wK3vR3YGjYN3gDMOA9Mb/EwkDgF4HK+ZuAMU97gPErPv+p4ZUFs
         nTHXbwiGnFMnKA1KcKcWDYLOXuM2UIAP50SkuYdXC9RhJVBZyzls4bZ6SO/GMF1lyHBn
         8wdNnQ2+rboBUbfszOILjJQKYpNmb6T4Bk9qGXPybsSS80YQHcEOcod6tX+TuLVhkXbi
         VaYFGzXqlkmEm9t8L1E65bx6XvjR7cKlmYQ9frB+AEeDLNXEwnxIS9dIWufzZKGVsooB
         srUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=f0nZGSJguFBt1wZHOMuTJEqoTD2z6bvZE2p9HFuE/1g=;
        b=y3ynHluohVejYwm6l5Dps5Zqtizk8VPHinHJXfXnqEDu0SPCzRLzEZkTy4i2/xmeJv
         coiLiKY1cwXR3xMcGHbjhBUZYRwlgvgMI3abGPv1QG9SB/uyETDQIafuet50GRKIyNx0
         Dy5JI627j+OsCGYU5g1w5F4KitwtRmCHoh9K1pTA5x+SoOAtbb94H9ZHhzFSGoNOr/ln
         PvihSmuM7jspV9Fe94OX0MOKgBglg3eOwhe55rk/cOBmn9+qz5YEmNlRzsD+zW025Id5
         HgCYiFLutDJCyAfyTaeoL+JKjZw2WH2Tx+pd6u3LtqQXqH+Qq33sl5+OzxuCdkdgmzWS
         xnxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f0nZGSJguFBt1wZHOMuTJEqoTD2z6bvZE2p9HFuE/1g=;
        b=ITAef/ZripedKVOtPlKQaFmglWHDwpNEHtz1CC1Ri3NosxUq10mpTW5/UoY1xQdRoP
         B6mPVLq3C07Tfc/d6yK0b6zY/FKLC8s6+AbQnODaKnhfU+GjyJKyZtPy6PmX+gsjGBPz
         21Qeg/Tdpw9gujuUD6GpHbA6URRzDk9a48RtioEzMUlLJ6grgZ+k9eOwkKwYrxaEWN04
         mCpIi1M/pil86ZxoPomVDSxeYwS/SS52XfOT+oOxndLwK4GCndnWXGDbGaz/IWGUEIzt
         HM+e5/YI4cLzD8mGQedC3W7pWQ0vN9dJQS1r55+JpXdbh8j/m5iCtTB0ki0fR8wbm7KC
         pqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=f0nZGSJguFBt1wZHOMuTJEqoTD2z6bvZE2p9HFuE/1g=;
        b=hfSIML5lIlBhZz7CCzpRO3A1D/wravpI6mnsfRmpG0f/U0HufqD2OkopyNjMuPYiW6
         spwfZUrNXJHae8SRUVNW0GHfuIAy9RbuIZzPlxD37mF71D4AwpaRax60wDPxHEFr394O
         FZ0IcmTsdWETIVA5odGP3w2elQj1D1+elnyyTUJnaEz5jzCGqLZHcivlQDF7V+P+Fx0N
         CfmezR+mYOrmuWS3LMHFoeu/tirY4P4O4aWDDpZLj7hL4whvymIvFEuQD6zpeuigL8RU
         8yOEIMFfnFOHaR+058c9dXH1tB2pZoy//+RLaB3Hqew5QcKzk/TcTuZNgysiknDLxKAh
         uN0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLHB4DgAuDwioHyM2r7QUhu13UxhiZwYoc5WfkqAJZCpYYGS3T
	EIttgt4T+vAeT2vnjwWYACc=
X-Google-Smtp-Source: APXvYqyJo0P65OYEUi/Q204M3BmUHcLiS4I0qjexW10TAk7T8tgcKQi9XKbEeUz8uM4e+Q6OtRaE9g==
X-Received: by 2002:a05:651c:297:: with SMTP id b23mr15605952ljo.260.1580893014967;
        Wed, 05 Feb 2020 00:56:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls222640lji.4.gmail; Wed, 05 Feb
 2020 00:56:54 -0800 (PST)
X-Received: by 2002:a2e:b04b:: with SMTP id d11mr20105637ljl.248.1580893013990;
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893013; cv=none;
        d=google.com; s=arc-20160816;
        b=O4sNoB67K9MiXXaTLbKUl39MaRmrGuX98QVZQTuj9GqtfLjD265iZuNmgVXZY3ilWH
         mygVUMsq6V23khNir21siD4jyP6KA61tpf5x7/GtGjYLPB37TMqOIJjMXwZVp1BCmYvI
         gyR59yVgV9ijlJzv0OoKOcl8upPAEZRo63XuCE1NAPVmD9LivltfNX81yQPEt88/MwA3
         0ITYsuf+D49DTvJ+4DHzkKslutWt4tHrs4IaSPwSKVwobHcaLs48+EgY7uBFy1GNHUJr
         URhL27pA8r5k2j6I5yOJh8K0Pp4R0QTDbh9gwx7gVoWWzkWziTnY83XR0HVT4cp/LSFb
         uhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=cqeIrUAYhFWkQdklPssiJWhv51G5VGuSkb+zb3fKE5s=;
        b=uNZ6aswzDYLQgj0aN51DMIKTqSCXDZD/4qwiAcUlNzfPx9JB+SA9ID8a1vkhz9+kPV
         8TjQOGyrl8D53ZrSi0EBIdmw3/e6MkZOaxmG9/u3j9sco/36GU5e6+1LcbIt4sF1813a
         VADrz6Q3y9B9vcitNp2OlL522+RP+2BDGcQbGGfutxTFLpY9Gzv+7zc7NB2F8AzY8kFN
         Dy9REdxUPW0PLdgN5GtDVejcQP48Pf6Kp6fXCW7PXY5ZDi0aNr9vF+z2MNO4OaFLYw21
         Ogo6DBmFFqV5Vb4kGdOpBmuFiNN9J2iyBtvFMnMjHKTHqfYnckIaZ8i+5vtPGfoZ0xbv
         xYQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o24si1333512lji.4.2020.02.05.00.56.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0158urXI013058
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0o006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:53 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 4/7] arm-trusted-firmware: Give download artifact meaningful name
Date: Wed,  5 Feb 2020 09:56:48 +0100
Message-Id: <eda89fb10c51fb4fe1b3ebfc5bfc50bef5c55f7d.1580893011.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
index dbf3d8f..0354ac4 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
@@ -12,7 +12,7 @@
 FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
 
 SRC_URI += " \
-    https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;name=atf \
+    https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;downloadfilename=atf-v${ATF_PV}.tar.gz;name=atf \
     file://0001-rpi3-4-Add-support-for-offlining-CPUs.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
     "
 SRC_URI[atf.sha256sum] = "07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eda89fb10c51fb4fe1b3ebfc5bfc50bef5c55f7d.1580893011.git.jan.kiszka%40siemens.com.
