Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7PX5PWAKGQEJQI2Y6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id AE948CDDA3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 10:49:02 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id w22sf1499058lfe.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 01:49:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570438142; cv=pass;
        d=google.com; s=arc-20160816;
        b=pGWPfj24owzF5FKoxyarUHDNS+4iS3v76boX31ilyEJuQTyftNCJUGfi+9Ky5y4LWm
         F7scIlmFz/bumgAG1oRHHp3P1a0jFVbER4vVvM2LLgreHi/4KLr99zr60D5ehA/D7Zwd
         8Zv0c1ArsVlmRPLXx7hibuqyeEStEF5Zx49KCUDcR13APnSqnj0EWRI1R0GwRnmlsHNN
         2uk7hcKZcunJi2cAAK0TT40Ag2ZWVQswYvIbn765KrsT30Qtl6s9KCv5tada04TvY6sX
         gUv/VilyyFOGfYgXdAo/9uT9SuxlzC9ScVgLv+fI91R4pi9XDu8LgWhZd9Y0AP3auB3J
         4U5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=reDPu3xapg6iR+5sBe8ilixqxgQX7IJS9TltWxjYdes=;
        b=yHZKz5iTR7oNWLlIBiUVY43pyj2CAwdtQYucxgQRj2N6nb48wZYSB+hP0MHkV75Nrx
         EC0AMdytbXjHi4/rTw3Uu8YAV49wOS3HeYTisHhnrfptbyjMkag+7Cp3ibdrn4vY1TqY
         SxYS+HTgRoJRRvUta/rF+WHFISqNHnuaLF0/hN5WG4Uk93nF4ClKuIGpbX4EyLXDQ0Lk
         2G/L7pwcTCYiPUOc/GtvW2pWlHQND90maWpbqGPuuAreRfPDFm0pldaCtpiIVIxjwras
         9YvKpSknTOWM2Ll8D8L7lThVwuSO7a7wRCD2GA1x1AEZ4GEWQGf57SF30ec2Pxzma0AV
         ZrBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=reDPu3xapg6iR+5sBe8ilixqxgQX7IJS9TltWxjYdes=;
        b=XGCDkIB8CKnCAdDqTF+6vRfwOdSmS1hCk14GveS9yBNbhIo2g15O+WWOV8S37lvUKq
         xwFZSsp/MvTSbw5lYGOxkSoyyRlElR1KR7A/+btVZAKnXNyp4WqPQQ7rzC/HvqxcDTmY
         lQjXolNAonAamzKixgm1vK81PIS+8C4n2Yf7/lzkPYV6u4a2zShQdtdYCfj/MW3sOHv1
         2o6B9DV35d+2NdRaFiQZFCf822AREdgdQyQyuHYNVcbcUl2nSMTvSHwGVE84rucBLYI6
         7PXp+PkdNxJ/3WlxwXLr5oFd5TOBfag90jEcloJIHOkWqy5GbmxApBGjP2q8BRfbKPV6
         l5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=reDPu3xapg6iR+5sBe8ilixqxgQX7IJS9TltWxjYdes=;
        b=OSbnZHBNGyBGubZ7tGEfmlhlsmSM8qhlrlA2Vd2FPQabzG4o+mg4CKSCiaG4sS8Eq0
         YgcLovd4DtWdOL7xPbf+xcLsZ1/HbIydIbqE/tCiK4qRvtk27XkNsc7bVRJmFtWWZSqj
         Ceilvyh8IRHyBpJKb5HDKX1yY/45fjXK1mx1awV4TZgQq1IvyDdOQ+3RkfXYemtVy+7K
         sesl28d9W8oWZov4o6LXxa6CNQ259OvcX3Rdnv2ceREZfpm43Uijtzx7p1ylS2+m7HEq
         25zUG7UboesnpiFa5wkHYwZK3777vpln4HFAgGJrACORMuCU6prL89cl0G0Tgw0j3JcQ
         fhWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWi7OEUGfX5gJ6DNcyKlgNNDgaQ/tXwoUVgPgDkuyyswsNu+Au4
	swAntxmwTGwrduQFIvMM+oE=
X-Google-Smtp-Source: APXvYqzs3fQTQVqW3Rv4LQRf3MLYtzXCrrFQEsuGvYzK6y8vVENMWCzOh59NMOY4zbNGOWK8UiuSQg==
X-Received: by 2002:ac2:5451:: with SMTP id d17mr6823357lfn.77.1570438142246;
        Mon, 07 Oct 2019 01:49:02 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c17:: with SMTP id j23ls2036579lja.12.gmail; Mon, 07
 Oct 2019 01:49:01 -0700 (PDT)
X-Received: by 2002:a05:651c:22a:: with SMTP id z10mr18047507ljn.103.1570438141209;
        Mon, 07 Oct 2019 01:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438141; cv=none;
        d=google.com; s=arc-20160816;
        b=YJXWz0SheS02bcqIawrKHmzSpts54c4alLfXsnCsur8M4nRVmR3+cCTLqqQ+BcUqbm
         LjHujwgZNM2aZzt9wVsXBq5N76/amTnJMLlMj1GKPKMR3hg4xhQ7puD7uoW45ahtdaDI
         iQsUJDodMhQ5TGyJXATwsGNPRwC42VsvdTxuolZAb6isVJJ2grNJ0vwSd4+HfdgDfqZg
         IWEy5H1oNLF1jR52sxd804Gh+8b2apUqazEBz5roc6wP/atIR2cNBRK6HAaookrptOkA
         XDcfqEp+vC0TFiHUympPbVOcKKXipHaztOLkKfX7OXoaAQjqZm6BvdnvBpR5mmMlJ/HU
         6zsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=UHRAL07dnuHWLy2XE1BFrWosOzApAMNvQfQbJ9sk7as=;
        b=CH8mJYM/OGR6u2mKekLmWDwQRSsnB7R81jOsahvX2ihZWPk9E3p7QKcvySrUzHWRyx
         PvOd31PSMc8lIDgWvXy0I8AzgVYyNG8mtimnORH+bQnj1WsAC/lm9TIpBJgriqgWnpkm
         ylA2jFMa4Fn1hdZSVi0HckZdp5DJZpXc8yEg0akhJgRN1Up1nRnPCx318ZRKRan+gp/b
         oYUjIOerefw2tqVf+TLOHLxezoLLu7tUWWs0/0OC6D+oCzgT61GFoqMgyj+FF3Wtz26r
         KiKrLtIX4xt5wUo/+QofvgeusH4hH2Smv3/WoqnGF/1mCJRGOgvxxDN636J4lVksUAVH
         ca+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z9si1372390ljj.4.2019.10.07.01.49.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x978n08a003037
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Oct 2019 10:49:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.114])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x978n01V011472
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Oct 2019 10:49:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 0/2] x86: Full APIC shorthand mode, cleanups
Date: Mon,  7 Oct 2019 10:48:57 +0200
Message-Id: <cover.1570438139.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
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

Version 1 had a nasty bug in sending real all/all-except messages. This
fixes it and also converts apic.h to more readable defines.

Jan

Jan Kiszka (2):
  x86: apic: Add full support for IPI shorthands
  x86: apic: Make defines for masks and bits easier to validate

 hypervisor/arch/x86/apic.c             | 69 ++++++++++++++++++----------------
 hypervisor/arch/x86/include/asm/apic.h | 59 +++++++++++++++--------------
 2 files changed, 66 insertions(+), 62 deletions(-)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1570438139.git.jan.kiszka%40siemens.com.
