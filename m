Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBS4QY76AKGQEH55GK5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DF296435
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:36 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id y5sf975971edo.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389516; cv=pass;
        d=google.com; s=arc-20160816;
        b=iZ8lrwyKC/e7TIPqA6ycLd4adCbS681611CaJDo/6EQlzDmhogqdzMvAx+S4ZaK361
         EhOFj+6P1UxCzN2zPKdICzLo/cBEK0x+rrkjR/XwDgJwn1YaGTQ30nuxWGbxCmKa7fnt
         G7Ef69JqsnDbWLNuIzG65VdJEx5BrjdTkHYCSEUYCOd/EhluR/3IbkKkMuLtYcJ8BoPU
         7N8YbFqDTZgslSyuJ6sv6eXviD3c2KEc+49cHdu8Y5aVqkkvJ5DhCoeqAeQjNFWXxBhu
         jOQxXPW7BeBRkiWyC36IaBzaan2xunWCoDtcqeYRFz19CcTjaqKyTBgasH9/tpth2/DM
         3/MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=47pL33S1q7Vx0yRQOpNqtwWcFvaUkxDYf26AVqd1A5k=;
        b=pJTReAOI88nWHYQj1rVso5rPn3IhviPWMQJRQ6DUNfDgZqr/EufBnMOf4IvZ2drvQe
         12rgMYzP1D8Bvf4IxF5OejchdRe0hfZCTpdl5cotbO70Xh69NaSr+DjN1Vv9zHlSS0W7
         cPi6WnCfz/FiO9fTpEvb/QzUmR6O1279jkplHM504M4t7ocCbVIPOVb/R9SQ3t7ig3AP
         m0+e9+e/DaOcETtaX8T3gbBbpePpFuER8a5uN/0YPRG7Fed8BQMzSNMNavETyLZgmeWI
         iPOkdgIySRg2ZTXIChMequC57nONwoZjPCNhDBqJbBkjpByS25Q75KfKO/NEBozzna/9
         49OQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Pc44IiZa;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=47pL33S1q7Vx0yRQOpNqtwWcFvaUkxDYf26AVqd1A5k=;
        b=YhGxFhrvVwgfJKO2/oDMskWkSzrungGrJGr26f/KkxEPBxUun7Z3YD85AC+G1AUuv4
         uERvBTBk2d0N3Q5DRsjeiQ9ptkQreawuyDmQbtauY8Cj0KQtKZJR0HhIxGcUDpowkZlR
         2I2IzTEhFCwlcvk9SldrMcN6CCNZFQwgnXjeO55sGmRDgK99YkzcNNfBUdrRP+Lf5KrM
         WCFxoK+y9oR/ddT3qwUThZaZfkYs7gCt43ueclY63oxIoys80Bgxh6fURpBem29n8S6Z
         J0x6pHjujNiMYeCUUJiyOjwgHVkpxq48ZHn4cxrzX1NELxFh+BcSFqUKvjdHSREZYUS9
         XQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=47pL33S1q7Vx0yRQOpNqtwWcFvaUkxDYf26AVqd1A5k=;
        b=cMnDaH+D0t7E+b07zex1Kiu4C9t0yVfssGzijdwgtsjWAjT4jy9W1iROhfgiaGD0pB
         0h99LDGhiBtRTE6logj9yg1mtnfQ6O/uLr+yGhvGIvECB8IYIrDVaVhlWiBdZBMG0BxH
         tJVjQsBDXzMgJolkrWBNESIut+PBY028nouIupxRw4SkJhC2ICdWFQueGabx2tUp1+zg
         YadjVvL9XPIyNg8AP5sqriMVz7nU/J46AQIU7sMkvGo2Rb3ASQKtZwITe96Pp+QZ8RyR
         lgkunNsXH9NvX2AR/twEoZl/RuEdGe+p+Y+NzEbbLHX3fjqQSoufee2zOIW/d3apRhli
         606Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531bNrsVttaB6GEc/U3W8+CTDrfe+GKOB2zKyq/JSdXnD8W4PIfE
	+95DgPzvYc+/larur+wK8/0=
X-Google-Smtp-Source: ABdhPJwzcDSHMtplwsAWaB4HPrYGQ7ZSIjKm2SVZX3z5/gMGRAz57+ZISohwXp4hew3yf8EiWEUuJw==
X-Received: by 2002:a50:9e87:: with SMTP id a7mr3341666edf.297.1603389515795;
        Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:848:: with SMTP id f8ls1275656ejd.4.gmail; Thu, 22
 Oct 2020 10:58:34 -0700 (PDT)
X-Received: by 2002:a17:906:5e4f:: with SMTP id b15mr3534465eju.353.1603389514485;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389514; cv=none;
        d=google.com; s=arc-20160816;
        b=mWpyGRb7gD4lhXw4F+6MxLvNFVP4XT9u2cdPoiQKk/2sbLObMhheKdJNcHyeUQ9g73
         CeWSwcj0vgkfKYLgYXYtzFJCEE915zsA+AmJpum4km6cNYO2xGhv89MrvG54h2cF5d+L
         6Mz0oWCCNIGVz7zDukLCppTVr6X5tZm0IT1sVYNA0D2ZTu8sZ1m1N5vAZEB3opNJLN6a
         fHK1e3twgXMbmVCdepSU75bUF5B0w+wWPFLE9fkA5KPDy01TR3nIYmWzylwkrCTUxPh7
         ASVWFzTDP8kw1ts1EpnSXXUVqNr9AWepbP949spW4NWmM1nhBVy8nAgUn8GV38Prgm5F
         qoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=WOYZNVK/GTelOAUSmlPCb7UCRogC8bNw1FyrwKPpaRE=;
        b=pkBIw3ZfXo/ueXP5ijjx5zVv5lFBIHp4L5i0MGQGCi5Q6oiRiptHLACwsv5/kUOcws
         HJme4N2DiIKXlGCnw0SqRC4Ie3+rVZ/fEziPB5NyskjFsqCGOF+/wrJhT1VkdPlO1vbg
         PlAesPsDo1flvn/fR9g1jFwp+7dNDITE0ETeajHUgtvTZCzlRdZy+OGFk/hYwpsphaDl
         Rvcylku5KeG+Zzu8d8PygZIqoqHFmcm59g9pnsprDfKuuGufJWoV/lmQZwzoItRAJRvg
         5ixbe0NWHFeYYsWzjfnphJik6/Rrc8k6o/i93sNG+8s5VmtmD7oeMIcnffTVgXu3MIhz
         PpMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Pc44IiZa;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id u2si85640edp.5.2020.10.22.10.58.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTk1jvlzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:34 +0200 (CEST)
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
	with LMTP id AOZqH2eRY4RL for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:34 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTj5v4mzyXb
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 09/33] hypervisor: Makefile: hook-in -Wdeprecated and -Wundef
Date: Thu, 22 Oct 2020 19:58:01 +0200
Message-Id: <20201022175826.199614-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Pc44IiZa;       spf=pass
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

Currently, no warnings triggered by these two flags.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 27dd5dee..eeeca2eb 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -31,6 +31,7 @@ KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wnested-externs -Wno-error=nested-externs \
 		 -Wshadow -Wno-error=shadow \
 		 -Wredundant-decls -Wno-error=redundant-decls \
+		 -Wundef -Wdeprecated \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
 		 -D__LINUX_COMPILER_TYPES_H
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-10-andrea.bastoni%40tum.de.
