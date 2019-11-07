Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRVDSHXAKGQERFRXKMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 85476F3589
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 18:17:59 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id f16sf1145447wmb.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 09:17:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573147079; cv=pass;
        d=google.com; s=arc-20160816;
        b=RIjKENSGbS1z2sM3Qtk7dd380dYPLX+WbJArAaQRHwbMH/XzM9NX+J9UPZfKtYWikt
         8j17IZ69mD0098JCY5rKFnNFqvARqFlsMSzsMzIlMv36XUuHMFHkgvbwyAT1tXKmFcHG
         Kye/xnC/OM1EWX5NXCEg2yc/x1BEzlI6Knz81Ags9C5jdx83NwxYbkcnA4XdiSE1JHLN
         zT6JVhrrV8SQwxebYHK0CA+XG5bsJm1eocHwrN+bcfwa35v9TW1YdBw4LYZMVv1CTetH
         j+LFlJzpqTQHYT34Xww/smK/fAqpyFXJKPBiQTH/SIbNiO3RjZe3kfZUzkTfauQJG1C0
         RUNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=FYOc4TRoi2yC3S/8YYwNLxRYAnxpVnYmuEYM5GXAtr8=;
        b=c0EMX5xKarzD5CtOUIxzWiQUD6LjHMEHdBM061z/k5bdSCwKB9HrsnvVmShuiIVyl0
         3rmzwhyOP/jEKBfKBcWUOcIxc9BVxT3Jeokjl2V/tNwo26m850Pf18JA/X61QWp1LPcI
         zrA5MMr/pXSjgoEecAPTLJRw5ig69DPV0U/aMJFJ7GHA0gNmfRc/KRwZzMoC+0fTvJ37
         NnTTozYW5TZ65KqF04TRCuTLbMJabOCjl4RBx0VRjQclepwAOc/XEbjn3+5+enaAaIlF
         lolJ8evdmitLPuMBsGRRRvuQT1hNYhxlSMYhWyKXzS4a/qhrLpiWQ+qaUjV8UawZ9k87
         puMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FYOc4TRoi2yC3S/8YYwNLxRYAnxpVnYmuEYM5GXAtr8=;
        b=Ej/TeBBtnAQSYAIMCYKWiDZ9JsD+wy4VhrVz9wcxeS9s5vP83+q+yYRBqk4GdtGa/L
         kpm87+PhFFXYbqMgxyJIQhxlYAU1lDPGbnHrx7+vdjvIebJeOt1gGBWC/cNlyCouYN8V
         Cp11alZEmiiwz2HglmUKcReBZrxX1OvdPZwsoWz2dXyxm+Z2aPuO+lH9RvZWyMggmSyB
         EnwpvUYI1eSHg4l4KXywHsYonzbffMBlRbKfoQgedbv7Yijov1AYd1t4j1Q6mlV/KyYe
         fvO9MQctIqxznGwpcutcAXyLf6y9s1UvpOCDPTdYIc29NtWtngJfXd6xIln0iiwudqeJ
         WeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FYOc4TRoi2yC3S/8YYwNLxRYAnxpVnYmuEYM5GXAtr8=;
        b=M1LP8GsKSNWjcITLKRL9/8Wwa4c7kG4o/eL0qK6ubzvlpFzAq7N4LF86C+7ozVjb97
         CiILTwiP/sokwO1avaTSpx7EOo9VJHmEtvwgmbo29voXau+e+rF4rGFY72jSzkNAlFYg
         wM7uyB9bhVGsiGgu4v1lsKPm6UxNO7N3hRro/pMKuprRcQ9zvkSRcAwbIvY+Q4lFcUJ0
         HwgE3ZVaJ8gQPu+KC/9LzkVwED5EFBLgJGMISCoK55COTsiAi9DpBko8cdv1oc6G6o8i
         S6gByRFEgzlV5XcGvvRmTVRF7XZa+RWxof6vNi+NFhS1ga5MRsvm7v+OP9jVP+gQ2pRQ
         RZnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWr5ovaUXiJn07V/ipQ/h2/SbSQzVj+R1i7gQe+uBzJz1HyxJR7
	1wZJzj2kYyNV4RGVn+SDsVU=
X-Google-Smtp-Source: APXvYqxSvgs9rcxP4INRxSfFSXUBOeeao4NhanGYA2mqV3Tm4QDfEZbny+RoRDKtjthoCeuRRra2Tw==
X-Received: by 2002:a1c:2d4b:: with SMTP id t72mr4276791wmt.112.1573147079013;
        Thu, 07 Nov 2019 09:17:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f10c:: with SMTP id r12ls2673820wro.11.gmail; Thu, 07
 Nov 2019 09:17:58 -0800 (PST)
X-Received: by 2002:adf:aa92:: with SMTP id h18mr1244031wrc.150.1573147078208;
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573147078; cv=none;
        d=google.com; s=arc-20160816;
        b=iXFi+C7R0DKf6wctSjubXMvrQgGM1bvaSxLLRWigwo8+AtuY5PTxeTtiq7HunAoJN3
         T4Ow6f5LbX1Krt15mJSkdkltzwwtpy0Vghg43gWMwixUfCs4tIAvtHxMqnUvXwqjFjc/
         SlwHgUEd6PskWpxVbrfH6MoL0ESQm4Mi7tRZMGEZpCh4tKpbTzz+HnW02K+AJwZU2b/D
         uRgFetxI7V7Fseq293zLs8Y3x2MlBjgYrTFAQriTqEGHpURQCq9WEJ0gf9lL/5dTaUZP
         bLaXYYAI9xDpeswK3cwaBFEmVjRnqzt5yrprU1hor+kB4bxBf2+j/VyduskHHJsR9t6G
         Y6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=ikE6iL2WjrOLKoaVjaSQWykWLs14rPrGjbdYv8wlfE0=;
        b=RZm/7vYg4Oi1sJxvDd0pj8Mcte0+8qHyPJgUCbD2lxwYXmNyY/WZJegv+uKrG+wFKW
         TZsRual6hSdxZx1fWZGbxihpYpEA+Dnz6G13tzKLrfycrnWJu+t97ZX4i7/9eUIaIx7f
         MQIInV3YQclV9R8eqnQIvnO8wK327JrjR+8DfU/EftyF59dvdv7SReBYPL/89PG6jDHu
         XG2/2jxoGi85q9h9wd4Ea/F1DM5opb6o52PMIPcL8XLHnmr3EDcG/qwQG6hBN/m8aNa4
         XiAGvzaBEaIM31qBQkRDhZn+D1rXi77+S9S2K7jM/A9dLW2lxIzhVtMGM28g8fXo2vkY
         6fUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s126si717200wme.1.2019.11.07.09.17.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xA7HHv7c028379
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:57 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA7HHvqw012202
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:57 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/4] Kernel and Isar updates, Jailhouse stable fix, account for new QEMU
Date: Thu,  7 Nov 2019 18:17:52 +0100
Message-Id: <cover.1573147076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

See patches for details.

Jan

Jan Kiszka (4):
  Update Isar to latest revision
  linux-jailhouse: Update to 4.19.81 and 4.19.72-rt26
  jailhouse: Back-port fixes to 0.11
  start-qemu: Update x86 CPU settings for latest QEMU

 kas.yml                                            |   2 +-
 ...1-x86-Permit-root-cell-to-enable-CR4.UMIP.patch |  28 +++++
 ...ic-Rework-and-fix-redir-entry-programming.patch | 115 +++++++++++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |   4 +-
 ...-rt24.bb => linux-jailhouse-rt_4.19.72-rt26.bb} |   4 +-
 ...house_4.19.67.bb => linux-jailhouse_4.19.81.bb} |   4 +-
 start-qemu.sh                                      |   2 +-
 7 files changed, 152 insertions(+), 7 deletions(-)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.59-rt24.bb => linux-jailhouse-rt_4.19.72-rt26.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.67.bb => linux-jailhouse_4.19.81.bb} (62%)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1573147076.git.jan.kiszka%40siemens.com.
