Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVG6SDZQKGQEFOWCN5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B117D0AB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Mar 2020 00:33:41 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id y35sf4932278ede.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 07 Mar 2020 15:33:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583624021; cv=pass;
        d=google.com; s=arc-20160816;
        b=HbsBwCL36yMXbdaRoiZUfavtu9t0nluEPvNRwhYMgWlCUc83K4MZvQalaT+laz2qWw
         MYCjz1aTwsWMa44t4Q7WKo94ji8Cu4gbdEvlGzj1TNmF7zB8Gxle9HfQ/ykZRbpozGuT
         fghW0AnlwHcy5ql2O4UmvO0OdmR2r8w+k0D5n+Tyyu+UOmfGCGKaIJ5/2uUN+Gf7ARSr
         HTucgyGNK2Yuqo4eCPSAQcScu925z8bK4A3U1KS1sCO6B8xxq+gE2T9tQYNTCtNC+7vm
         FpbBa61eAerLltN9r33F0eCjwqtESA63P3YoHj9avQb6KIuWsav9q41bJkhh4ZZf86j6
         mN2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=uPIsiHtQ/UE6jCITJVUPnm7hnuFcPyxPHERfMspNt4I=;
        b=oEFHIGqVQocSnMoZc1ldtRnyJ/fH42EtKdtMGTxg+954lff4ZqRfTNp9gso/q+CbYD
         aAjfrP/flF8nY4mhF0RIjmdsWudrlaiGz+PcnYBksb4czfOmn13cteKuCnCEZutqJC5/
         vZSE++XKxJcXbdMWkh7sQSF5wKsQSLekEWUjd2K+eu+RqCwtUfiOYA1maiINZrodHkSo
         7FJeyHT1aUDQjyrZZ1Z7BYJ5AC1V8UxF6XwhBAIJbFxty11WHLAZIRpqN7HxddxyCzL8
         C6uGITz6TgB2y/NDElDvFkS4Ano60NGbQk2m3518ed1EK4dVA7eFNfMr9zdtPTAJ4+k5
         B0Ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bQoM7CpF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uPIsiHtQ/UE6jCITJVUPnm7hnuFcPyxPHERfMspNt4I=;
        b=ZupNMKsklIzG9e3n5heXoldvPRFGEk85094wfEtgOakam3q06GecDzzeO+aFvh1GgG
         xwwAaVVu+V8AqQ+TJnMVEdZFgt2Q2rgZI9mpsQ0yx5OCucOro3y1lFers7BLWT2xUtYm
         Of1l/YEvVZFjsA2sPpqGDyrk/SBxr0FeYfSuR3E5aM461guZDg6XXPUdI39OttSnF3dj
         aGhSW1gGunaUUMnaA8At9k17JUTp3OKZ72DDjIaBdH+pQzKkf3WvxIbbs56cp6z0eikw
         nuVdegL68ggoKArvz67f7xe7mdP/Qcbsmj22eOSb6m1xDN/TuiH/ly1tLx0zXhZptIc1
         5iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uPIsiHtQ/UE6jCITJVUPnm7hnuFcPyxPHERfMspNt4I=;
        b=ZGpUR09LXIUfbKgDe2XaW9xWGaL0z1EMSN55ysxQU2kfeV6mVVHUmK7sZqqz/KUizi
         sNtoAqPuH5Xwb3ZagjiLP9bs62EH70ZdNDDn2lp9wDlhX5StLGIGKrgWg6hP4GGFcXbT
         CNYUZgDThKOJTS3oITjzQZ17/7vs2qgQJJwW66fiHJh8dCIehP/QPa+lsZI+hQNBBTo4
         ME8t95QLxkwxNDTOV5PMmkdZqtKXKeJCJyEeEMsRpzzFm33ZPj+XmGrLXPVO2+VyHMFS
         HPi4I8BnuAmHgp6rlbLdw4Ok0vpSXotFmKYscSKUkGLbRCzM1CF8OWfiPwSJq9/rLzRY
         v74w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1/pZH6KG8C/LP7ATD71k1Xy6BqPTuQWRQ6sFbWsamtoTHbDTqt
	3MSuPxkM7XUUGvPNzT8MkoI=
X-Google-Smtp-Source: ADFU+vsbTLeB9+tDOP3RxYs6A8EsXZHy5uUqq8+vuZDaO74GZ6yXI6VaUc1k02e48UCjiDLBcmfSvA==
X-Received: by 2002:a17:907:2116:: with SMTP id qn22mr8533143ejb.291.1583624021335;
        Sat, 07 Mar 2020 15:33:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9517:: with SMTP id u23ls4551728eda.7.gmail; Sat, 07 Mar
 2020 15:33:40 -0800 (PST)
X-Received: by 2002:a05:6402:b12:: with SMTP id bm18mr10284785edb.74.1583624020545;
        Sat, 07 Mar 2020 15:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583624020; cv=none;
        d=google.com; s=arc-20160816;
        b=UaRJCf11FgX+e0LWD9JvjFKbVtXZMU/QZIJhwYsdFnpK760wHrYNLETsCCZpjq+c9N
         eLox7HjY5zTfeEit64CqYfA0pKLCNi4u+7ANG+5RFu466BOoJbb3VICh+Sut9EGQIhAj
         NjV0GJCuKb5zYT+KKXN1NemDfCVtl5cPN4wePDVNYYV+4tdmlTS8To2iOLvJZqFnRGPB
         GgKmB/gWHn2IR74/W9UbrD+dXzf3yfPkF36labRQQml4BvMj3Tm18K66qEiOIlHgsKp1
         mGDlcwmji4WDxvEIgxiCgW+7/ty53SN9xaXSo3BGhkPj838DC9lOKcba7HbvYZkyoE3m
         LQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=PoAa3HmOYd9x3X4gLPJvXYLZseD6ulVlerMZlWNzutY=;
        b=AhJ0dhVdIzC2XHIt5fuP5iNu+zxMqbO+TtRgZwPVrONJ289KrpeqDN2XFYrwPMzu+n
         1N3eze7lz51ohFkUGo7eLu4ToLWUV4D5hrhxqqD0xNZbpMRAyKoTje8b5sgL8wNFqtB1
         X30EaKeAHVJQ+SWRo6zzIxPh88KK1r15INtwc9OzW4dN14/0cVjmDDdhG3P/uSS6smi8
         4luKjJuGrM23khJRW+6qjuCwlxUkvWs3BKSLiMw82T2gionY8kXzzYJeMJ1kt1iSiTph
         Fr4oKB8XRrMTz6bvnPpmSy2jlHPovaJL9rciAQyTNRzHYE+ZhzvPhhpaBs5kQvlf/clT
         ayxQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bQoM7CpF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x7si100536ejw.0.2020.03.07.15.33.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Mar 2020 15:33:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 48Zgm40KghzxvK;
	Sun,  8 Mar 2020 00:33:40 +0100 (CET)
Received: from omega.binary.kitchen (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 8 Mar 2020 00:33:39 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] configs: arm64: espressobin: tune comment
Date: Sun, 8 Mar 2020 00:33:30 +0100
Message-ID: <20200307233330.520833-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bQoM7CpF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This is probably a c&p artefact from macchiatobin.c: Memory on the espressobin,
1G variant, ranges from 0x0 - 0x40000000, and reservation can be done via
cmdline. Adjust the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/arm64/espressobin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index 79d79fa2..1b75f6d7 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -11,7 +11,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  *
- * Reservation via device tree: 0x800000000..0x83fffffff
+ * Reservation 0x30000000..0x3fffffff via cmdline: mem=768M
  */
 
 #include <jailhouse/types.h>
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200307233330.520833-1-ralf.ramsauer%40oth-regensburg.de.
