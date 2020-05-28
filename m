Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBCE4X73AKGQE56HIAKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF791E6442
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 16:43:21 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id s7sf6160667wrm.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 07:43:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590677000; cv=pass;
        d=google.com; s=arc-20160816;
        b=RumdoZiXCl6oehxmjyY9MBpiEKQo0ElyM2VZiIbWN8e3Fxvi8J5WK9pMO2YJA15M0A
         2JslXArnMYLxrymMBG55/ZtlEApr7IwEqaN3CT3vGR+HZBF9uCvR4btNV2Vpr1mnEzRO
         Nhmnj+AQX+vlJzR7s7KJNd/a3C/d6yhbnWQQ8oiYdNmK2c7W1vMt7fikZ27UlF1KoOS6
         VY9uJxkTsZCR/e9tBL7xu4Q6ml387FPC7z3z1El8BIk+M1v7zSF8CDVnMcNHVH/biVJu
         R/ldBuNOtVNbrC9OgcytniLuUHJ7sF4SEGCUCRWsZZJBh2chx3yAwQN/N6SL57fKR52w
         x9vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :dkim-signature;
        bh=cx3aTiQtBDUaOZzvPepRN38iVP6LJe2/QpjY4Ft0UfM=;
        b=JKaY4/hG+nvLmKUcA5MEBegnlswmLlvj1CZdxM9h7pAFxukJqTJ1CqpduOypnxhFbR
         MDis2MIDCFEW4Ak2deQyeIXC+/FvBzMkq8La5T/3p5340nggGqIIoV4je6qYTSUnETnc
         JtKlflGCoOoPEtfiScO4JghGuRLxAczV1F7A3ARrFzbOe/TicypIMEkfECyk2DCqnub7
         hg1Kr2DXS7S/hIlC7tZ+/KEub5al5fJQZlPmV0Q+PHawhpHEq54uc2TAqpr/PXd4LrH4
         FarrMAi2EmpwzwI6MxiU9LJVvo8FFVKHMPtKKlvExP9eqO5rgdNz0ACGQO5QJ+JLyuvY
         lGnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4TVcRqa;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::643 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cx3aTiQtBDUaOZzvPepRN38iVP6LJe2/QpjY4Ft0UfM=;
        b=ndPPL/OFA93A8n9dKhr25YyHzZl+XADSjpdoL8ltcUoituV9XsQQUr9FHi1YrgCv7C
         mPI00lRtMhOB6qXMrSTsl/vojKHGV1qWHvXBGzbhHWNSAuVf38uMU9MTmmG9W9uVYqPY
         A/8tIcVb/0alb+o4E0+T0HLdoKq9sQSXxVv2iSFEBuSYlVT/o3r5zDfqVblPUz77x/X7
         9Oo+LIpIj08k8aBRaf7xbs94lDBanC9ZYmF5Ow02SaR5BGAYjBtrus1EPcp6F7P+nSgv
         dwy2Hd3Pi6v1/FygWptQaSCYwzn2S4AyEy3QLCWOf5857UY4GpHhzNGquBYvG2ad3FLk
         2qoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cx3aTiQtBDUaOZzvPepRN38iVP6LJe2/QpjY4Ft0UfM=;
        b=W5UIyqE7Y3vMZY6u1dLnOHxccqsBYP7qLlY7si4nfDcI4GDGC8u/fyVh+8jcuMT6P+
         6OO4lsYQU5M6Xbx7zFbmmYcB1xO4QgnXPWTcc1d1gu+Vf14WvIBPkPpFvfrxt/f7/Jva
         JzcG2K+g/BV3DLeVWbWWEPA13y2+cbWS/Fcm5QMfrAVmU90SlTj55V45+9bNppuiMW1n
         SQf13LkUCKEqEdwYjeaAzqPzovI70D/0eoy1awak/YJvHCC37gsLBNYE4GA9K9pY1LbG
         dWI7xeZRbIwW8yT4VYHgJWHysPDYK7mmLjxbYPN27sRZM3zdrUpPcLcKa2b9ZnXSEAfi
         b3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cx3aTiQtBDUaOZzvPepRN38iVP6LJe2/QpjY4Ft0UfM=;
        b=GElOOzkur2jKhA4fLKbcCXbKtod2tjir4UoQEXcJ4oOeW9kNKQ5Ofu8nSUs+VkoxnL
         woTZU39ShcQHqCTiBg+Q9uuQpLoEUxjCVsJbPVl8Z+soXVOWeyM7j9Dp2RMKLMIKRIE0
         nAeq9zT5jfnqI3YLit6Ry9m+v0rN2U1t5G1ApRb7XOqU6N9PvhJvBAw1yNBuIKmqz3ME
         TkdpqkBKDyA1vSqjKjCabQnRfob1yz4W+HlaR6TvJQ/SwwnCw3e3gakv9gr43DC/20x/
         yZrJwtB0HBMZuO9aaE9riv6qFh3UijMdhMAsQQA1opmyELcaAoCz8Ft8UXR4byDZVO2h
         k13g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Ot7QB7QU9SO5HFyBIGaf9LqiTOlwdn6UXypK1WEM0CGCItK0Z
	HIRsRVfDNmw4vhS/MQONwOk=
X-Google-Smtp-Source: ABdhPJw6UEwzTgioUOzd6b87S/gYDRd1VrHllJ2JQnOkUp5BWYg0Hoh5xX6HPUjKUm4C4jUO4SJETw==
X-Received: by 2002:a5d:6986:: with SMTP id g6mr3980125wru.27.1590677000748;
        Thu, 28 May 2020 07:43:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:414f:: with SMTP id h15ls1158552wmm.3.gmail; Thu,
 28 May 2020 07:43:20 -0700 (PDT)
X-Received: by 2002:a1c:b656:: with SMTP id g83mr3900187wmf.151.1590677000173;
        Thu, 28 May 2020 07:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590677000; cv=none;
        d=google.com; s=arc-20160816;
        b=TK3rWL2GfGW1FCUUWK1ChYplTH/ttXHpP7y6m6HO9F1lllubXF5xL9gx5XqbvCv1Kd
         HH4VymRPdNomnHsDs8ZnJilnL5ztH3dG+ZBKFxPclJ/UTmj//gZu8W1xA2cGT0H4Gyx5
         w8eTPghTf6Ikuq9RfGdS2qNGNvM203RMs563qJ0vwEt8nTYMuG2VAEr1CR9kLD9YBYRB
         okp9KDhIH8KYihRBD20DRzdCDpCCwsd2y0+e5xg09LpPMOunsza0MHT9JJn5WLVBEhqf
         aQdg5MKDAV623afVCCYFQY3obD/Bn2TZwbd/ZrmBHP+gPqnB9qw1wwrYjfNX6zRiLFB+
         afdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4yx7letz7vCk6tKcxvIyZ/4wK0SHXp4stqN5JFC04XI=;
        b=odiZVa4j1K20QKO05Rrl37XAdthig6bxPQSzClHoD4C23r62VvJ3O+f2qPayDP4nY9
         GCcvmphpd/tLzpmTguEzGmru4f73gW2wJbFRPPbzmGHlw+8YYDyNjX9Fhc2B73FPE7WP
         86jMybFN/7hXqmjKWl8RLjNcDa4wSeCAO9m6GFEPDccXgkIdBtSl7bDOrgGbnOOFZYMH
         /FY9YtHkOP0XZzctAAfIN+8rvS2M7TPas/PRGkqgKKHNwVMK6CXtzEEHpQ7XRb3oWCJ2
         gamvqSm/LsuaMygnzdX9oc/OPY1feYtOABESpettwwauc75z3sKptg3XMgDUGz+Jzmzl
         QQ2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4TVcRqa;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::643 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com. [2a00:1450:4864:20::643])
        by gmr-mx.google.com with ESMTPS id y71si350188wmd.3.2020.05.28.07.43.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::643 as permitted sender) client-ip=2a00:1450:4864:20::643;
Received: by mail-ej1-x643.google.com with SMTP id k11so242306ejr.9
        for <jailhouse-dev@googlegroups.com>; Thu, 28 May 2020 07:43:20 -0700 (PDT)
X-Received: by 2002:a17:906:1857:: with SMTP id w23mr3380381eje.273.1590676999940;
        Thu, 28 May 2020 07:43:19 -0700 (PDT)
Received: from localhost.localdomain (static.88-198-216-42.clients.your-server.de. [88.198.216.42])
        by smtp.gmail.com with ESMTPSA id l8sm1710147ejz.52.2020.05.28.07.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:43:18 -0700 (PDT)
From: Mario Mintel <mariomintel@gmail.com>
To: buildroot@buildroot.org
Cc: jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de,
	Mario Mintel <mariomintel@gmail.com>
Subject: [PATCH 1/2] package/jailhouse: bump version to 0.12
Date: Thu, 28 May 2020 16:43:32 +0200
Message-Id: <20200528144333.49268-2-mariomintel@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528144333.49268-1-mariomintel@gmail.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
MIME-Version: 1.0
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=M4TVcRqa;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::643
 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Signed-off-by: Mario Mintel <mariomintel@gmail.com>
---
 package/jailhouse/jailhouse.hash | 2 +-
 package/jailhouse/jailhouse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 9fb4d599da..13a260e8d0 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 8de2406f455db07794cc750238ce57bc897673ba2b68c56fc9ae2d8079142b33  jailhouse-0.11.tar.gz
+sha256 3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
 sha256 3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 1aa7851707..6356c5a7aa 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.11
+JAILHOUSE_VERSION = 0.12
 JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
 JAILHOUSE_LICENSE_FILES = COPYING
-- 
2.26.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200528144333.49268-2-mariomintel%40gmail.com.
